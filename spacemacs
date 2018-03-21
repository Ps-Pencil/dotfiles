;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(graphviz
     asciidoc
     (go :variables
         go-use-gometalinter t
         gofmt-command "goimports")
     javascript
     lua
     ocaml
     csv
     php
     html
     markdown
     yaml
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-sort-by-usage t
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-tab-key-behavior 'cycle)
     fasd
     ;; emoji
     ;; pdf-tools
     ;; mu4e
     ;; erc
     ;; eyebrowse
     better-defaults
     emacs-lisp
     ;; themes-megapack
     (latex :variables latex-enable-folding t)
     git
     evil-commentary
     org
     ;; ivy
     helm
     c-c++
     (python :variables python-enable-yapf-format-on-save t)
     java
     (shell :variables
            shell-default-height 30
            shell-default-shell 'ansi-term
            shell-enable-smart-eshell t
            shell-protect-eshell-prompt t
            shell-default-position "bottom")
     ;; (spell-checking :variables spell-checking-enable-auto-dictionary t)
     syntax-checking
     ;; version-control
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '()

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the lastest
   ;; version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'org-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `vim-powerline' and `vanilla'. The first three
   ;; are spaceline themes. `vanilla' is default Emacs mode-line. `custom' is a
   ;; user defined themes, refer to the DOCUMENTATION.org for more info on how
   ;; to create your own spaceline theme. Value can be a symbol or list with\
   ;; additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Consolas"
                               :size 17
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; If non-nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil

   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t

   ;; If non-nil, `J' and `K' move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil

   ;; If non-nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil

   ;; if non-nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil

   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom

   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always

   ;; If non-nil, the paste transient-state is enabled. While enabled, pressing
   ;; `p' several times cycles through the elements in the `kill-ring'.
   ;; (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."

  ;; others
  ;; (evil-define-key 'insert prog-mode-map (kbd "RET") #'reindent-then-newline-and-indent)
  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

  ;; this seems to mess up with other values in before-save-hook
  ;; (global-aggressive-indent-mode)
  (global-visual-line-mode)

  ;; ivy counsel tab
  ;; (define-key ivy-minibuffer-map (kbd "TAB") 'ivy-alt-done)

  ;; clashed with my window managements
  ;; (define-key evil-insert-state-map (kbd "C-l") 'sp-up-sexp)

  ;; seems to cause some erroneous expansion
  ;; don't want space, especially in latex
  ;; (require 'yasnippet)
  ;; (add-to-list 'yas-key-syntaxes 'yas-longest-key-from-whitespace)

  ;; faster window switching
  (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)
  (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
  (define-key evil-insert-state-map (kbd "C-l") 'evil-window-right)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-window-left)
  (define-key evil-insert-state-map (kbd "C-j") 'evil-window-down)
  (define-key evil-insert-state-map (kbd "C-k") 'evil-window-up)
  (define-key visual-line-mode-map (kbd "C-l") 'evil-window-right)
  (define-key visual-line-mode-map (kbd "C-h") 'evil-window-left)
  (define-key visual-line-mode-map (kbd "C-j") 'evil-window-down)
  (define-key visual-line-mode-map (kbd "C-k") 'evil-window-up)

  (require 'term)
  (define-key term-raw-map (kbd "<insert-state> C-k") nil)
  (define-key term-raw-map (kbd "<insert-state> C-j") nil)
  (define-key term-raw-map (kbd "<normal-state> C-k") nil)
  (define-key term-raw-map (kbd "<normal-state> C-j") nil)
  (define-key comint-mode-map (kbd "<insert-state> C-k") nil)
  (define-key comint-mode-map (kbd "<insert-state> C-j") nil)
  (define-key comint-mode-map (kbd "<normal-state> C-k") nil)
  (define-key comint-mode-map (kbd "<normal-state> C-j") nil)
  (define-key comint-mode-map (kbd "<insert-state> C-p") 'comint-previous-input)
  (define-key comint-mode-map (kbd "<insert-state> C-n") 'comint-next-input)
  (define-key comint-mode-map (kbd "<normal-state> C-p") 'comint-previous-input)
  (define-key comint-mode-map (kbd "<normal-state> C-n") 'comint-next-input)
  (require 'python)
  (define-key inferior-python-mode-map (kbd "C-k") nil)
  (define-key inferior-python-mode-map (kbd "C-j") nil)

  ;; Let emacs use ssh-agent from outer shell
  (require 'exec-path-from-shell)
  (exec-path-from-shell-copy-env "SSH_AGENT_PID")
  (exec-path-from-shell-copy-env "SSH_AUTH_SOCK")

  ;; shadowed by previous one
  (define-key evil-insert-state-map (kbd "C-p") 'term-send-up)
  (define-key evil-insert-state-map (kbd "C-n") 'term-send-down)

  ;; faster switching buffers
  (define-key evil-normal-state-map (kbd "C-b") 'helm-mini)

  ;; constructor fonts
  (face-spec-set
   'tuareg-font-lock-constructor-face
   '((((class color) (background light)) (:foreground "SaddleBrown"))
     (((class color) (background dark)) (:foreground "burlywood1"))
     (((class color) (type tty)) (:foreground "white"))))

  ;; this is shadowed by my i3 config
  ;; (require 'org)
  ;; (define-key org-mode-map (kbd "C-M-l") 'org-metaright)
  ;; (define-key org-mode-map (kbd "C-M-h") 'org-metaleft)
  ;; (define-key org-mode-map (kbd "C-M-j") 'org-metadown)
  ;; (define-key org-mode-map (kbd "C-M-k") 'org-metaup)

  ;; Prolog support
  (autoload 'prolog-mode "prolog" "Major mode for editing Prolog programs." t)
  (add-to-list 'auto-mode-alist '("\\.pl\\'" . prolog-mode))
  (setq prolog-system 'swi
        prolog-program-switches '((swi ("-G128M" "-T128M" "-L128M" "-O"))
                                  (t nil))
        prolog-electric-if-then-else-flag t)

  ;; OCaml
  (require 'ocamlformat)
  (add-hook 'tuareg-mode-hook (lambda ()
                                (define-key merlin-mode-map (kbd "C-M-<tab>") 'ocamlformat)
                                (add-hook 'before-save-hook 'ocamlformat-before-save)))

  ;; Latex text wrapping
  (add-hook 'latex-mode-hook (lambda () (progn (spacemacs/toggle-auto-fill-mode) (set-fill-column 80))))

  ;; Automatically set scripts to be executable
  (add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

  ;; mu4e
  ;; (add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")

  ;; Org-mode
  (spacemacs/toggle-mode-line-org-clock-on)

  ;; known bug https://github.com/ocaml/tuareg/issues/162
  (defun tuareg-abbrev-hook ())

  ;; Imagine the following scenario.  One wants to paste some previously copied
  ;; (from application other than Emacs) text to the system's clipboard in place
  ;; of some contiguous block of text in a buffer.  Hence, one switches to
  ;; `evil-visual-state' and selects the corresponding block of text to be
  ;; replaced.  However, one either pastes some (previously killed) text from
  ;; `kill-ring' or (if `kill-ring' is empty) receives the error: "Kill ring is
  ;; empty"; see `evil-visual-paste' and `current-kill' respectively.  The
  ;; reason why `current-kill' does not return the desired text from the
  ;; system's clipboard is because `evil-visual-update-x-selection' is being run
  ;; by `evil-visual-pre-command' before `evil-visual-paste'.  That is
  ;; `x-select-text' is being run (by `evil-visual-update-x-selection') before
  ;; `evil-visual-paste'.  As a result, `x-select-text' copies the selected
  ;; block of text to the system's clipboard as long as
  ;; `x-select-enable-clipboard' is non-nil (and in this scenario we assume that
  ;; it is).  According to the documentation of `interprogram-paste-function',
  ;; it should not return the text from the system's clipboard if it was last
  ;; provided by Emacs (e.g. with `x-select-text').  Thus, one ends up with the
  ;; problem described above.  To solve it, simply make
  ;; `evil-visual-update-x-selection' do nothing:
  (fset 'evil-visual-update-x-selection 'ignore)

  ;; Avy
  (setq avy-all-windows 'all-frames)

  ;; Diary layout
  (spacemacs|define-custom-layout "diary"
    :binding "d"
    :body
    (find-file "~/Diary/diary.org")
    (magit-status)
    )


  ;; allow for export=>beamer by placing

  ;; #+LaTeX_CLASS: beamer in org files
  (unless (boundp 'org-export-latex-classes)
    (setq org-export-latex-classes nil))
  (add-to-list 'org-export-latex-classes
               ;; beamer class, for presentations
               '("beamer"
                 "\\documentclass[11pt]{beamer}\n
      \\mode<{{{beamermode}}}>\n
      \\usetheme{{{{beamertheme}}}}\n
      \\usecolortheme{{{{beamercolortheme}}}}\n
      \\beamertemplateballitem\n
      \\setbeameroption{show notes}
      \\usepackage[utf8]{inputenc}\n
      \\usepackage[T1]{fontenc}\n
      \\usepackage{hyperref}\n
      \\usepackage{color}
      \\usepackage{listings}

      \\lstset{numbers=none,language=[ISO]C++,tabsize=4,
  frame=single,
  basicstyle=\\small,
  showspaces=false,showstringspaces=false,
  showtabs=false,
  keywordstyle=\\color{blue}\\bfseries,
  commentstyle=\\color{red},
  }\n

\\lstnewenvironment{pseudocode}
{   
    \\lstset{
        frame=tB,
        numbers=left, 
        numberstyle=\\tiny,
        basicstyle=\\scriptsize, 
        keywordstyle=\\color{blue}\\bfseries,
        keywords={,input, output, return, datatype, function, in, if, else, foreach, while, begin, end, } %add the keywords you want, or load a language as Rubens explains in his comment above.
        numbers=left,
        xleftmargin=.04\\textwidth,
    }
}
      \\usepackage{verbatim}\n
      \\institute{{{{beamerinstitute}}}}\n          
       \\subject{{{{beamersubject}}}}\n"

                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\begin{frame}[fragile]\\frametitle{%s}"
                  "\\end{frame}"
                  "\\begin{frame}[fragile]\\frametitle{%s}"
                  "\\end{frame}")))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(counsel-find-file-ignore-regexp
   "\\(?:\\`[#.]\\)\\|\\(?:[#~]\\'\\)\\|\\(?:\\.class\\'\\)\\|\\(?:\\.o\\'\\)")
 '(evil-escape-delay 0.5)
 '(helm-boring-file-regexp-list
   (quote
    ("\\.o$" "\\.DS_STORE$" "~$" "\\.bin$" "\\.lbin$" "\\.so$" "\\.a$" "\\.ln$" "\\.blg$" "\\.bbl$" "\\.elc$" "\\.lof$" "\\.glo$" "\\.idx$" "\\.lot$" "\\.svn$" "\\.hg$" "\\.bzr$" "CVS$" "_darcs$" "_MTN$" "\\.fmt$" "\\.tfm$" "\\.class$" "\\.fas$" "\\.lib$" "\\.mem$" "\\.x86f$" "\\.sparcf$" "\\.dfsl$" "\\.pfsl$" "\\.d64fsl$" "\\.p64fsl$" "\\.lx64fsl$" "\\.lx32fsl$" "\\.dx64fsl$" "\\.dx32fsl$" "\\.fx64fsl$" "\\.fx32fsl$" "\\.sx64fsl$" "\\.sx32fsl$" "\\.wx64fsl$" "\\.wx32fsl$" "\\.fasl$" "\\.ufsl$" "\\.fsl$" "\\.dxl$" "\\.lo$" "\\.la$" "\\.gmo$" "\\.mo$" "\\.toc$" "\\.aux$" "\\.cp$" "\\.fn$" "\\.ky$" "\\.pg$" "\\.tp$" "\\.vr$" "\\.cps$" "\\.fns$" "\\.kys$" "\\.pgs$" "\\.tps$" "\\.vrs$" "\\.pyc$" "\\.pyo$")))
 '(helm-ff-skip-boring-files t)
 '(helm-grep-ag-command
   "rg --color=always --smart-case --no-heading --line-number %s %s %s")
 '(ivy-extra-directories nil)
 '(ivy-initial-inputs-alist
   (quote
    ((org-refile . "")
     (org-agenda-refile . "")
     (org-capture-refile . "")
     (counsel-M-x . "")
     (counsel-describe-function . "")
     (counsel-describe-variable . "")
     (man . "")
     (woman . ""))) t)
 '(latex-enable-auto-fill nil t)
 '(org-hide-emphasis-markers t)
 '(package-selected-packages
   (quote
    (org-mime flyspell-correct-helm flyspell-correct ghub let-alist company-quickhelp auto-dictionary adoc-mode markup-faces powerline spinner hydra parent-mode helm helm-core flx smartparens iedit anzu evil goto-chg undo-tree highlight diminish projectile pkg-info epl f dash s bind-map bind-key packed auctex-latexmk async avy popup bash-completion flycheck-pos-tip pos-tip flycheck-gometalinter flycheck go-guru go-eldoc company-go go-mode counsel swiper ivy yapfify yaml-mode web-mode web-beautify utop unfill tuareg caml tagedit smeargle slim-mode scss-mode sass-mode pyvenv pytest pyenv-mode py-isort pug-mode pip-requirements phpunit phpcbf php-extras php-auto-yasnippets orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-download ocp-indent mwim mmm-mode merlin markdown-toc markdown-mode magit-gitflow lua-mode livid-mode skewer-mode simple-httpd live-py-mode less-css-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc hy-mode htmlize helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haml-mode gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy fasd evil-magit magit magit-popup git-commit with-editor evil-commentary emmet-mode drupal-mode php-mode disaster cython-mode csv-mode company-web web-completion-data company-tern dash-functional tern company-statistics company-emacs-eclim eclim company-c-headers company-auctex company-anaconda anaconda-mode pythonic company coffee-mode cmake-mode clang-format auto-yasnippet yasnippet auctex ace-jump-helm-line ac-ispell auto-complete xterm-color ws-butler winum which-key wgrep volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline smex shell-pop restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree multi-term move-text macrostep lorem-ipsum linum-relative link-hint ivy-hydra info+ indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-make google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help elisp-slime-nav dumb-jump define-word counsel-projectile column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link)))
 '(persp-add-buffer-on-after-change-major-mode t)
 '(persp-auto-save-num-of-backups 1)
 '(persp-auto-save-persps-to-their-file t)
 '(persp-set-last-persp-for-new-frames t)
 '(projectile-project-root-files
   (quote
    ("rebar.config" "project.clj" "build.boot" "SConstruct" "pom.xml" "build.sbt" "gradlew" "build.gradle" ".ensime" "Gemfile" "requirements.txt" "setup.py" "tox.ini" "composer.json" "Cargo.toml" "mix.exs" "stack.yaml" "info.rkt" "DESCRIPTION" "TAGS" "GTAGS" "fake.project")))
 '(read-quoted-char-radix 16)
 '(split-height-threshold nil)
 '(split-width-threshold 0))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(counsel-find-file-ignore-regexp
   "\\(?:\\`[#.]\\)\\|\\(?:[#~]\\'\\)\\|\\(?:\\.class\\'\\)\\|\\(?:\\.o\\'\\)")
 '(evil-escape-delay 0.5)
 '(helm-boring-file-regexp-list
   (quote
    ("\\.o$" "\\.DS_STORE$" "~$" "\\.bin$" "\\.lbin$" "\\.so$" "\\.a$" "\\.ln$" "\\.blg$" "\\.bbl$" "\\.elc$" "\\.lof$" "\\.glo$" "\\.idx$" "\\.lot$" "\\.svn$" "\\.hg$" "\\.bzr$" "CVS$" "_darcs$" "_MTN$" "\\.fmt$" "\\.tfm$" "\\.class$" "\\.fas$" "\\.lib$" "\\.mem$" "\\.x86f$" "\\.sparcf$" "\\.dfsl$" "\\.pfsl$" "\\.d64fsl$" "\\.p64fsl$" "\\.lx64fsl$" "\\.lx32fsl$" "\\.dx64fsl$" "\\.dx32fsl$" "\\.fx64fsl$" "\\.fx32fsl$" "\\.sx64fsl$" "\\.sx32fsl$" "\\.wx64fsl$" "\\.wx32fsl$" "\\.fasl$" "\\.ufsl$" "\\.fsl$" "\\.dxl$" "\\.lo$" "\\.la$" "\\.gmo$" "\\.mo$" "\\.toc$" "\\.aux$" "\\.cp$" "\\.fn$" "\\.ky$" "\\.pg$" "\\.tp$" "\\.vr$" "\\.cps$" "\\.fns$" "\\.kys$" "\\.pgs$" "\\.tps$" "\\.vrs$" "\\.pyc$" "\\.pyo$")))
 '(helm-ff-skip-boring-files t)
 '(helm-grep-ag-command
   "rg --color=always --smart-case --no-heading --line-number %s %s %s")
 '(ivy-extra-directories nil)
 '(ivy-initial-inputs-alist
   (quote
    ((org-refile . "")
     (org-agenda-refile . "")
     (org-capture-refile . "")
     (counsel-M-x . "")
     (counsel-describe-function . "")
     (counsel-describe-variable . "")
     (man . "")
     (woman . ""))) t)
 '(latex-enable-auto-fill nil t)
 '(org-hide-emphasis-markers t)
 '(package-selected-packages
   (quote
    (graphviz-dot-mode org-mime flyspell-correct-helm flyspell-correct ghub let-alist company-quickhelp auto-dictionary adoc-mode markup-faces powerline spinner hydra parent-mode helm helm-core flx smartparens iedit anzu evil goto-chg undo-tree highlight diminish projectile pkg-info epl f dash s bind-map bind-key packed auctex-latexmk async avy popup bash-completion flycheck-pos-tip pos-tip flycheck-gometalinter flycheck go-guru go-eldoc company-go go-mode counsel swiper ivy yapfify yaml-mode web-mode web-beautify utop unfill tuareg caml tagedit smeargle slim-mode scss-mode sass-mode pyvenv pytest pyenv-mode py-isort pug-mode pip-requirements phpunit phpcbf php-extras php-auto-yasnippets orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-download ocp-indent mwim mmm-mode merlin markdown-toc markdown-mode magit-gitflow lua-mode livid-mode skewer-mode simple-httpd live-py-mode less-css-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc hy-mode htmlize helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag haml-mode gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy fasd evil-magit magit magit-popup git-commit with-editor evil-commentary emmet-mode drupal-mode php-mode disaster cython-mode csv-mode company-web web-completion-data company-tern dash-functional tern company-statistics company-emacs-eclim eclim company-c-headers company-auctex company-anaconda anaconda-mode pythonic company coffee-mode cmake-mode clang-format auto-yasnippet yasnippet auctex ace-jump-helm-line ac-ispell auto-complete xterm-color ws-butler winum which-key wgrep volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline smex shell-pop restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree multi-term move-text macrostep lorem-ipsum linum-relative link-hint ivy-hydra info+ indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-make google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help elisp-slime-nav dumb-jump define-word counsel-projectile column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link)))
 '(persp-add-buffer-on-after-change-major-mode t)
 '(persp-auto-save-num-of-backups 1)
 '(persp-auto-save-persps-to-their-file t)
 '(persp-set-last-persp-for-new-frames t)
 '(projectile-project-root-files
   (quote
    ("rebar.config" "project.clj" "build.boot" "SConstruct" "pom.xml" "build.sbt" "gradlew" "build.gradle" ".ensime" "Gemfile" "requirements.txt" "setup.py" "tox.ini" "composer.json" "Cargo.toml" "mix.exs" "stack.yaml" "info.rkt" "DESCRIPTION" "TAGS" "GTAGS" "fake.project")))
 '(read-quoted-char-radix 16)
 '(split-height-threshold nil)
 '(split-width-threshold 0))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
)
