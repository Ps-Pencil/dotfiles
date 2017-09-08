package main

import (
	"encoding/csv"
	"flag"
	"fmt"
	"io"
	"log"
	"os"
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
func CopyFile(src, dst string) (err error) {
	sfi, err := os.Stat(src)
	if err != nil {
		return
	}
	if !sfi.Mode().IsRegular() {
		// cannot copy non-regular files (e.g., directories,
		// symlinks, devices, etc.)
		return fmt.Errorf("CopyFile: non-regular source file %s (%q)", sfi.Name(), sfi.Mode().String())
	}
	dfi, err := os.Stat(dst)
	if err != nil {
		if !os.IsNotExist(err) {
			return
		}
	} else {
		if !(dfi.Mode().IsRegular()) {
			return fmt.Errorf("CopyFile: non-regular destination file %s (%q)", dfi.Name(), dfi.Mode().String())
		}
		if os.SameFile(sfi, dfi) {
			return
		}
	}
	if err = os.Link(src, dst); err == nil {
		return
	}
	err = copyFileContents(src, dst)
	return
}

// copyFileContents copies the contents of the file named src to the file named
// by dst. The file will be created if it does not already exist. If the
// destination file exists, all it's contents will be replaced by the contents
// of the source file.
func copyFileContents(src, dst string) (err error) {
	in, err := os.Open(src)
	if err != nil {
		return
	}
	defer in.Close()
	out, err := os.Create(dst)
	if err != nil {
		return
	}
	defer func() {
		cerr := out.Close()
		if err == nil {
			err = cerr
		}
	}()
	if _, err = io.Copy(out, in); err != nil {
		return
	}
	err = out.Sync()
	return
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

		if err = CopyFile(from, to); err != nil {
			log.Fatalf("Error copying file from %q to %q: %s", from, to, err)
		}
	}
}
