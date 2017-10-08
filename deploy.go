package main

import (
	"encoding/csv"
	"flag"
	"fmt"
	"io"
	"log"
	"os"
	"os/exec"
	"path/filepath"
	"strings"
)

// loc maps from location in this directory to default location in the system.
var (
	loc    = map[string]string{}
	locMap = "location.csv"

	includes = flag.String("include", "", "A list of files to include.")
	excludes = flag.String("exclude", "", "A list of files to exclude. Cannot be set at the same time as --include")
	up       = flag.Bool("up", false, "Whether to reverse the direction of the copy. i.e. Upload")
)

// CopyFile copies a file from src to dst. If src and dst files exist, and are
// the same, then return success. Otherise, attempt to create a hard link
// between the two files. If that fail, copy the file contents from src to dst.
func cp(src, dst string) error {
	_, err := os.Stat(src)
	if err != nil {
		return err
	}

	diffcmd := exec.Command("diff", src, dst)
	rmCmd := exec.Command("rm", "-r", dst)
	cpCmd := exec.Command("cp", "-r", src, dst)

	_, diff := diffcmd.CombinedOutput()
	if diff == nil {
		log.Printf("%s and %s are equal.\n", src, dst)
		return nil
	}

	if _, err := os.Stat(dst); err == nil {
		if output, err := rmCmd.CombinedOutput(); err != nil {
			return fmt.Errorf("error removing: %q %s", output, err)
		}
	}
	if output, err := cpCmd.CombinedOutput(); err != nil {
		return fmt.Errorf("error copying: %q %s", output, err)
	}
	return nil
}

func main() {
	flag.Parse()

	home := os.Getenv("HOME")
	dir, err := filepath.Abs(filepath.Dir(os.Args[0]))
	if err != nil {
		log.Fatalf("Error getting current executable path: %s", err)
	}

	file, err := os.Open(filepath.Join(dir, locMap))
	if err != nil {
		log.Fatalf("Error opening location mapping: %s", err)
	}
	defer file.Close()

	reader := csv.NewReader(file)
	for {
		record, err := reader.Read()
		if err == io.EOF {
			break
		} else if err != nil {
			fmt.Println("Error reading csv:", err)
			return
		}
		if len(record) != 2 {
			fmt.Printf("Line contains incorrect number of items: %q expects 2\n", record)
			continue
		}

		from, to := record[0], record[1]
		from = strings.Replace(from, "~", home, 1)
		to = strings.Replace(to, "~", home, 1)
		from = strings.TrimSpace(from)
		to = strings.TrimSpace(to)

		if *up {
			from, to = to, from
		}
		fmt.Println(from, to)

		if err = cp(from, to); err != nil {
			log.Fatalf("Error copying file from %q to %q: %s", from, to, err)
		}
	}
}
