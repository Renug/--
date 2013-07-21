;关闭启动时提示信息
(setq inhibit-startup-message t)
(menu-bar-mode -1)
;不要那个如此大的工具条
(tool-bar-mode -1)
;禁用滚动条
(scroll-bar-mode nil)
;去掉烦人的警告铃声
(setq visible-bell t)
;显示时间
(display-time)
;时间使用24小时制
(setq display-time-24hr-format t)
;时间显示包括日期和具体时间
(setq display-time-day-and-date t)
;显示行号
(setq column-number-mode t)
(setq line-number-mode t)
;高亮当前行
;(require 'hl-line)
;(global-hl-line-mode t)
;默认目录
(setq default-directory "~")

;; 指针颜色设置为白色
(set-cursor-color "blue")
;; 鼠标颜色设置为白色
(set-mouse-color "white")
;; 设置背景颜色和字体颜色darkblue,dark表示代亮度
;(set-foreground-color "white")
;(set-background-color "deepblue")
;把缺省的 major mode 设置为 text-mode
(setq default-major-mode 'text-mode)
;;指针不要闪，我得眼睛花了
(blink-cursor-mode -1)
;记录修改时间
(add-hook 'write-file-hooks 'time-stamp)
;设置time-stamp的格式，在文章的前八行输入 Time-stamp: <>，则出会动出现修改时间。
(setq time-stamp-format "%:u %02m/%03d/%04y %02H:%02M:%02S")
;显示匹配的括号
(show-paren-mode t)
;匹配括号的时候, 不要跳到另一个括号那里
(setq show-paren-style 'parentheses)
;高亮显示要拷贝的区域
(transient-mark-mode t)
;允许和外部其他程式的粘贴
(setq x-select-enable-clipboard t)
;支持中键粘贴
(setq mouse-yank-at-point t)
;开启语法高亮。
(global-font-lock-mode 1)
;当光标在行尾上下移动的时候，始终保持在行尾。
(setq track-eol t)
;防止删除东西，弄一个超大的kill ring
(setq kill-ring-max 200)
;文字行宽60个英文字母
(setq default-fill-column 60)
;;;;备份策略
;配置备份文档的路径
(setq backup-directory-alist '(("" . "~/.emacs.d/auto-save-list/")))
;生成临时文件
(setq-default make-backup-file t)
(setq make-backup-file t)
(setq make-backup-files t)
;启用版本控制，即能够备份多次
(setq version-control t)
;备份最原始的版本两次,即第一次编辑前的文档，和第二次编辑前的文档
(setq kept-old-versions 2)
;备份最新的版本10次，理解同上
(setq kept-new-versions 3)
;删掉不属于以上版本的版本
(setq delete-old-versions t)
;自动存盘
(setq auto-save-mode t)
;击键100次自动保存
(setq auto-save-interval 100)
;改变标题栏的标题
(setq frame-title-format "%b@BadKid")
;;在日历中突出标记节日和生日
(setq mark-holidays-in-calendar t)

;;有些可惜，没有中国传统农历，谁能写个扩展elisp包弄一下
(setq general-holidays '((holiday-fixed 1 1 "元旦")
(holiday-fixed 1 26 "春节")
(holiday-fixed 3 8 "妇女节")
(holiday-fixed 4 1 "愚人节")
(holiday-fixed 5 1 "劳动节")
(holiday-fixed 10 1 "国庆节")
(holiday-fixed 12 25 "圣诞节")
(holiday-fixed 2 9 "元宵节")
(holiday-fixed 4 4 "清明节")
(holiday-fixed 5 28 "端午节")
(holiday-fixed 8 26 "七夕")
(holiday-fixed 9 14 "中秋节")
(holiday-float 5 0 2 "母亲节")
(holiday-float 6 0 3 "父亲节")
(holiday-float 2 0 4 "老妈生日")
(holiday-float 4 0 5 "老爸生日")
))
;(require 'color-theme)
;(color-theme-comidia)

;(set-default-font "consolas:15")
;; 默认的日记文件
;(setq diary-file "~/calendar/diary")
;; 自动显示图片
(auto-image-file-mode t)
;常用命令键绑定，删除缓冲区
(global-set-key [f9] 'kill-buffer)
;CONTRL+SPACE键去掉，把MARK SET设置成别的F2键。
;(global-set-key [(f2)] 'set-mark-command)
(global-set-key (kbd "C-,") 'set-mark-command)
;(global-set-key (kbd "C-c C-s") 'set-mark-command)
;设置F11快捷键指定 的日历系统
(global-set-key [f11] 'calendar)
;防止页面滚动时跳动,可以在靠近屏幕边沿3行时就开始滚动
(setq scroll-margin 1 scroll-conservatively 10000)

;;解决因颜色问题带^m乱码问题
;;set anti-color
(autoload 'ansi-color-apply-on-region "ansi-color")
(defun article-treat-ansi-sequences ()
"Translate ANSI SGR control sequences into overlays or extents."
(interactive)
(save-excursion
(when (article-goto-body)
(let ((inhibit-read-only t))
(ansi-color-apply-on-region (point) (point-max))))))
(add-hook 'gnus-part-display-hook 'article-treat-ansi-sequences)

;;左移一个此窗口
(global-set-key (kbd "C-c h") 'windmove-left)
;;右移一个此窗口
(global-set-key (kbd "C-c l") 'windmove-right)
;上移一个此窗口
(global-set-key (kbd "C-c k") 'windmove-up)
;;下移一个此窗口
(global-set-key (kbd "C-c j") 'windmove-down)

;;将主窗口分割成4个窗口
(defun split-window-4() 
  "Spilt window in 4"
  (interactive)
  (progn (split-window-vertically)
       (split-window-horizontally)
       (other-window 2)
       (split-window-horizontally)
  )
)

;;键绑定
(global-set-key (kbd "C-c 4") 'split-window-4)  
;;将主窗口分割成4个窗口
(defun split-window-3() 
  "Spilt window in 3"
  (interactive)
  (progn (split-window-horizontally)
       (split-window-vertically)
;;       (other-window 2)
;;       (split-window-horizontally)
  )
)
(global-set-key (kbd "C-c 5") 'split-window-3)  
(winner-mode)

;;复制行
(defun copy-line (&optional arg)
 "Save current line into Kill-Ring without mark the line"
 (interactive "P")
 (let ((beg (line-beginning-position)) 
    (end (line-end-position arg)))
 (copy-region-as-kill beg end))
)
;;键绑定
(global-set-key (kbd "C-c C-l") 'copy-line)
(require 'cc-mode)
;;复制词
(defun copy-word (&optional arg)
 "Copy words at point"
 (interactive "P")
 (let ((beg (progn (if (looking-back "[a-zA-Z0-9]" 1) (backward-word 1)) (point))) 
    (end (progn (forward-word arg) (point))))
 (copy-region-as-kill beg end))
)
;;键绑定
(global-set-key (kbd "C-c C-w") 'copy-word)

;;复制段
(defun copy-paragraph (&optional arg)
 "Copy paragraphes at point"
 (interactive "P")
 (let ((beg (progn (backward-paragraph 1) (point))) 
    (end (progn (forward-paragraph arg) (point))))
 (copy-region-as-kill beg end))
)
;;键绑定
(global-set-key (kbd "C-c C-p") 'copy-paragraph)

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-k" 'kill-whole-line)

(global-set-key (kbd "C-x i") 'query-replace)

(global-set-key "\C-x\C-m" 'execute-extended-command)

(setq erc-ignore-list nil)
(setq erc-hide-list
      '("JOIN" "PART" "QUIT" "MODE"))


(global-set-key [(control ?\.)] 'ska-point-to-register)
(global-set-key [(control ?\')] 'ska-jump-to-register)
(defun ska-point-to-register()
  "Store cursorposition _fast_ in a register. 
Use ska-jump-to-register to jump back to the stored 
position."
  (interactive)
  (setq zmacs-region-stays t)
  (point-to-register 8))

(defun ska-jump-to-register()
  "Switches between current cursorposition and position
that was stored with ska-point-to-register."
  (interactive)
  (setq zmacs-region-stays t)
  (let ((tmp (point-marker)))
        (jump-to-register 8)
        (set-register 8 tmp)))

;;--------------------CC-mode配置  http://cc-mode.sourceforge.net/
;; http://docs.freebsd.org/cgi/getmsg.cgi?fetch=26277+0+archive/2001/freebsd-standards/20011230.freebsd-standards
(require 'cc-mode)
(defun my-c-mode-hook ()
  "happy hacking."
  (interactive)
  (c-set-style "linux")
  (setq tab-width 8    ;; TAB键的宽度设置为8
	c-basic-offset 8   
;;	indent-tabs-mode t  ;; 使用TAB缩进
	c-tab-always-indent nil) ;;也使用TAB的原有功能
  (setq-default indent-tabs-mode nil)
  (setq c-cleanup-list (append c-cleanup-list (list 'brace-else-brace)))
  (c-set-offset 'arglist-close 0)
  (c-set-offset 'arglist-cont-nonempty 4)
  (c-set-offset 'inline-open 0)
  (c-set-offset 'case-label 0)
  (c-set-offset 'statement-cont 4)
  (c-toggle-auto-state -1) ;;不用自动换行/1表示自动换行
  (c-toggle-hungry-state)  ;; 此模式下，当按Backspace时会删除最多的空格
  (define-key c-mode-map [return] 'newline-and-indent) ;; 将回车代替C-j的功能，换行的同时对齐
  (define-key c-mode-map "\C-ce" 'c-comment-edit) ;;写注释
)

(add-hook 'c-mode-hook 'my-c-mode-hook) 

(define-key c-mode-map (kbd "C-c C-w") 'copy-word)
(define-key c-mode-map (kbd "C-c C-l") 'copy-line)
(define-key c-mode-base-map [(f7)] 'compile)
(define-key c-mode-base-map [(f5)] 'gdb)

;(add-to-list 'load-path "G:/软件/emacs-22.3-bin-i386/emacs-22.3/site-lisp")

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(display-time-mode t)
 '(menu-bar-mode nil)
 '(show-paren-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "Black" :foreground "SteelBlue" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 109 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

;;; C/C++ Programming Enviroment
(setq c-default-style
      '((java-mode . "java") (awk-mode . "awk") (other . "linux")))
; 下面调整Tab键缩进为4个空格
(setq c-basic-offset 4)

(setq slime-net-coding-system 'utf-8-unix)
(setq inferior-lisp-program "/usr/local/bin/sbcl")
;(setq inferior-lisp-program "/usr/bin/clisp")
;(slime-setup)
(slime-setup '(slime-fancy))
