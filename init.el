;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.


(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; (default nil)
   dotspacemacs-enable-lazy-installation nil
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   (append
		;; layers always active
	  '(
 		  ;; ----------------------------------------------------------------
		  ;; Example of useful layers you may want to use right away.
		  ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
		  ;; <M-m f e R> (Emacs style) to install them.
		  ;; ----------------------------------------------------------------
		  ;; helm
      (ivy :variables
           ivy-extra-directories nil)
		  (auto-completion :variables
		   			           auto-completion-enable-sort-by-usage t
                       auto-completion-enable-snippets-in-popup t
                       :disabled-for
                       org
                       )
		  (better-defaults :variables
                       better-defaults-move-to-end-of-code-first t)
		  emacs-lisp
		  git
		  markdown
		  org
		  (c-c++ :variables
		  	     c-c++-default-mode-for-headers 'c++-mode
		  	     c-c++-enable-clang-support t)
		  (python :variables
		  	      ;; python-enable-yapf-format-on-save t
              python-sort-imports-on-save t)
      (go :variables
          go-tab-width 4
          go-use-gometalinter t
          gofmt-command "goimports"
          ;; flycheck-gometalinter-enable-linters '("goimports")
          )
      protobuf
		  ranger
		  gtags
		  ibuffer
		  (colors :variables
		  	      colors-enable-nyan-cat-progress-bar t
		  	      colors-enable-rainbow-identifiers t)
		  (spacemacs-layouts :variables
		  				           layouts-enable-autosave nil
		  				           layouts-autosave-delay 900
                         )
      ;; graphviz
      ;; plantuml
      docker
		  sql
      protobuf
		  (syntax-checking :variables
		  			           syntax-checking-enable-by-default t
                       syntax-checking-enable-tooltips t
                       )
		  liter
      )

     ;; layers active depend on system-type
     (when (eq system-type 'gnu/linux)
       '(ycmd)
       )
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; Defines the behaviour of Spacemacs when downloading packages.
   ;; Possible values are `used', `used-but-keep-unused' and `all'. `used' will
   ;; download only explicitly used packages and remove any unused packages as
   ;; well as their dependencies. `used-but-keep-unused' will download only the
   ;; used packages but won't delete them if they become unused. `all' will
   ;; download all the packages regardless if they are used or not and packages
   ;; won't be deleted by Spacemacs. (default is `used')
   dotspacemacs-download-packages 'used
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(
                                    ;; magit
                                    magit-gh-pulls
                                    magit-gitflow
                                    org-projectile
                                    evil-mc
                                    realgud
                                    evil-args
                                    evil-ediff
                                    evil-exchange
                                    evil-unimpaired
                                    evil-indent-plus
                                    volatile-highlights
                                    ;; smartparens
                                    holy-mode
                                    skewer-mode
                                    rainbow-delimiters
                                    highlight-indentation
                                    vi-tilde-fringe
                                    eyebrowse
                                    org-bullets
                                    smooth-scrolling
                                    org-repo-todo
                                    org-download
                                    org-timer
                                    livid-mode
                                    git-gutter
                                    git-gutter-fringe
                                    evil-escape
                                    leuven-theme
                                    gh-md
                                    evil-lisp-state
                                    spray
                                    lorem-ipsum
                                    symon
                                    ac-ispell
                                    ace-jump-mode
                                    auto-complete
                                    auto-dictionary
                                    clang-format
                                    define-word
                                    google-translate
                                    disaster
                                    epic
                                    fancy-battery
                                    org-present
                                    orgit
                                    orglue
                                    spacemacs-theme
                                    helm-flyspell
                                    flyspell-correct-helm
                                    clean-aindent-mode
                                    helm-c-yasnippet
                                    ace-jump-helm-line
                                    helm-make
                                    smeargle
                                    ido-vertical-mode
                                    flx-ido
                                    company-quickhelp
                                    counsel-projectile
                                    window-purpose
                                    ivy-purpose
                                    helm-purpose
                                    spacemacs-purpose-popwin
                                    )
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t)
  )

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '((recents . 8)
                                bookmarks
                                (projects . 8))
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         monokai
                         solarized-dark
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
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
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
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
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers 'relative
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
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
   ;; If non nil advises quit functions to keep server open when quitting.
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
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ;; Add
   spacemacs-large-file-modes-list '(emacs-lisp-mode)
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq exec-path-from-shell-check-startup-files nil)
  (setenv "LC_CTYPE" "zh_CN.UTF-8")

  ;; SPC f f at *spacemacs* buffer root dir
  (cd (concat (getenv "HOME") "/"))

  ;; emacs-china elpa
  (setq-default configuration-layer-elpa-archives
                '(("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
                  ("org-cn" . "http://elpa.emacs-china.org/org/")
                  ("gnu-cn" . "http://elpa.emacs-china.org/gnu/")
                  ("marmalade-cn" . "http://elpa.emacs-china.org/marmalade/")
                  ("user42-cn" . "http://elpa.emacs-china.org/user42/")
                  ("melpa-stable-cn" . "http://elpa.emacs-china.org/melpa-stable/")
                  ("sunrise-commander-cn" . "http://elpa.emacs-china.org/sunrise-commander/")
                  )
                )
  (setq-default package-archives configuration-layer-elpa-archives)

  ;; GO
  (setq exec-path-from-shell-variables '("PATH"
                                         "GOPATH"
                                         "GOROOT"
                                         "GOBIN"))

  (setq frame-resize-pixelwise t)
  )

(defun liter/run-python-once ()
  (remove-hook 'python-mode-hook 'liter/run-python-once)
  (run-python (python-shell-parse-command)))

;; skip . and .. in helm-find-files
(defun helm-skip-dots (old-func &rest args)
  "Skip . and .. initially in helm-find-files.  First call OLD-FUNC with ARGS."
  (apply old-func args)
  (let ((sel (helm-get-selection)))
    (if (and (stringp sel) (string-match "/\\.$" sel))
        (helm-next-line 2)))
  (let ((sel (helm-get-selection))) ; if we reached .. move back
    (if (and (stringp sel) (string-match "/\\.\\.$" sel))
        (helm-previous-line 1))))

;; after-save-hook
(defun liter/after-save-actions ()
  "Used in `after-save-hook`, run go build for golang completion"
  (when (memq this-command '(save-buffer save-some-buffers))
    (let ((filename (buffer-file-name (current-buffer)))
          )
      (when (string-suffix-p ".go" filename)
        (let* ((dir (file-name-directory filename))
              (index (cl-search "src/" dir))
              (package-path (substring dir (+ index 4) -1))
              (command (format "go install %s" package-path))
              )
          (message "after-save-actions: %s" command)
          ;; (shell-command command)
          (start-process-shell-command "go-install" nil command)
          )
        )
      )
    )
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place you code here."
  (global-company-mode)

  (add-hook 'python-mode-hook (lambda ()
                                (setq python-shell-prompt-detect-failure-warning nil)))
  (add-hook 'python-mode-hook 'liter/run-python-once)

  ;; open menu-bar
  (menu-bar-mode t)

  ;; markdown codec
  (add-hook 'markdown-mode-hook (lambda ()
                                  (setq markdown-coding-system 'utf-8)))

  ;; config depend on system-type
  (when (eq system-type 'gnu/linux)
    (set-variable 'ycmd-server-command (list "python"
                                             (concat (getenv "HOME")
                                                     "/.spacemacs.d/tools/ycmd/ycmd/")))
    (set-variable 'ycmd-startup-timeout 60)
    ;; (add-hook 'python-mode-hook 'ycmd-mode)
    )

  ;; (setq flycheck-check-syntax-automatically '(mode-enabled save))

  ;; config golang flycheck
  (with-eval-after-load 'flycheck-gometalinter
    (setq flycheck-gometalinter-disable-linters '("gotype"))
    (setq flycheck-gometalinter-deadline "20s")
    (setq flycheck-gometalinter-fast t)
    (setq flycheck-gometalinter-tests t)
    (setq flycheck-gometalinter-enable-linters '("golint" "goimports"))
    (setq flycheck-gometalinter-vendor t))

  (with-eval-after-load 'plantuml-mode
    (setq plantuml-jar-path (concat (getenv "HOME")
                                    "/.spacemacs.d/tools/plantuml.jar"))
    (setq plantuml-output-type "png"))

  (with-eval-after-load 'go-mode
    (add-hook 'after-save-hook 'liter/after-save-actions))

  ;; only one dired
  ;; (with-eval-after-load 'dired
  ;;   (put 'dired-find-alternate-file 'disabled nil)
  ;;   (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
  ;;   (setq 'dired-recursive-copies 'always)
  ;;   (setq 'dired-recursive-deletes 'always)
  ;;   )

  (with-eval-after-load 'helm
    (advice-add #'helm-preselect :around #'helm-skip-dots)
    (advice-add #'helm-ff-move-to-first-real-candidate :around #'helm-skip-dots))

  ;; (setq counsel-find-file-ignore-regexp (regexp-opt '("." "..")))

  ;; abbrev
  (with-eval-after-load 'abbrev-mode
    (define-abbrev-table 'global-abbrev-table
      '(
        ("MIT" "// Copyright (c) 2018 soren yang
//
// Licensed under the MIT License
// you may not use this file except in complicance with the License.
// You may obtain a copy of the License at
//
//     https://opensource.org/licenses/MIT
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an \"AS IS\" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
")
        )
      )
  )

  (exec-path-from-shell-copy-env "GOPATH")
)
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("6df30cfb75df80e5808ac1557d5cc728746c8dbc9bc726de35b15180fa6e0ad9" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default)))
 '(fci-rule-color "#49483E" t)
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#49483E" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#49483E" . 100))))
 '(magit-diff-use-overlays nil)
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#272822" "#49483E" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Noto Sans CJK SC" :foundry "GOOG" :slant normal :weight normal :height 98 :width normal))))
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
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("6df30cfb75df80e5808ac1557d5cc728746c8dbc9bc726de35b15180fa6e0ad9" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default)))
 '(fci-rule-color "#49483E" t)
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#49483E" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#49483E" . 100))))
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (yasnippet-snippets yapfify ws-butler winum wgrep uuidgen unfill toc-org string-inflection sql-indent spaceline-all-the-icons all-the-icons memoize spaceline powerline solarized-theme smex restart-emacs ranger rainbow-mode rainbow-identifiers pyvenv pytest pyenv-mode py-isort protobuf-mode popwin pippel pipenv pip-requirements persp-mode pcre2el password-generator paradox spinner overseer org-pomodoro alert log4e gntp org-mime org-brain open-junk-file neotree nameless mwim move-text monokai-theme mmm-mode markdown-toc markdown-mode macrostep live-py-mode linum-relative link-hint ivy-xref ivy-rtags ivy-hydra indent-guide importmagic epc ctable concurrent ibuffer-projectile projectile hy-mode dash-functional hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode google-c-style golden-ratio godoctor go-tag go-rename go-guru go-eldoc gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link ggtags fuzzy flycheck-ycmd flycheck-rtags flycheck-pos-tip pos-tip flycheck-gometalinter flycheck flx fill-column-indicator expand-region evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-org evil-numbers evil-nerd-commenter evil-matchit evil-magit magit git-commit ghub with-editor evil-lion evil-iedit-state iedit evil-cleverparens smartparens paredit evil-anzu anzu eval-sexp-fu highlight elisp-slime-nav editorconfig dumb-jump popup dockerfile-mode docker json-mode tablist magit-popup docker-tramp json-snatcher json-reformat cython-mode counsel-gtags counsel swiper ivy company-ycmd ycmd pkg-info request-deferred let-alist request deferred epl company-statistics company-rtags rtags company-go go-mode company-c-headers company-anaconda company column-enforce-mode color-identifiers-mode centered-cursor-mode auto-yasnippet yasnippet auto-highlight-symbol auto-compile packed anaconda-mode pythonic f dash s aggressive-indent adaptive-wrap ace-window ace-link avy which-key use-package org-plus-contrib hydra font-lock+ exec-path-from-shell evil goto-chg undo-tree diminish bind-map bind-key async)))
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#272822" "#49483E" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Noto Sans CJK SC" :foundry "GOOG" :slant normal :weight normal :height 98 :width normal))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
)
