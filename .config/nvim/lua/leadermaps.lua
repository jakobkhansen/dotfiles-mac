local wk = require("which-key")

vim.g.mapleader = " "

local utils = require("utils")

local lsp = vim.lsp.buf
local dap = require("dap")
local diagnostic = vim.diagnostic
local fzf = require("fzf-lua")
local fzf_custom = require("plugins.fzf-config")

wk.register({
	f = {
		name = "find",
		f = { fzf.files, "find-files" },
        d = { fzf_custom.fzf_dirs, "find-directory" },
		g = { fzf.git_files, "find-git" },
		n = { "<CMD>Explore<CR>", "find-netrw" },
		r = { '<CMD>Ranger --choosedir="/tmp/ranger_dir"<CR>', "find-ranger" },
		l = { "<CMD>NeoTreeFocusToggle<CR>", "file-browser" },
		o = { "<CMD>Telescope oldfiles<CR>", "find-mru" },

        c = { fzf.live_grep, "find-code" },
		h = { "<CMD>Telescope heading<CR>", "find-heading" },

		p = { "<CMD>Telescope neoclip<CR>", "find-clipboard" },
		t = { "<CMD>Telescope termfinder find<CR>", "find-termminal" },
		b = { "<CMD>Telescope buffers<CR>", "find-buffers" },
		j = { "<CMD>Telescope jumplist<CR>", "find-jump" },
	},

	-- Buffer
	b = {
		name = "buffer",
		d = { "<CMD>lua MiniBufremove.wipeout(0, true)<CR>", "buffer-close" },
		e = { "<CMD>enew<CR>", "open-empty-buffer" },
		x = { "<CMD>close<CR>", "window-close" },
		v = { "<CMD>vsplit<CR>", "vertical-split" },
		h = { "<CMD>split<CR>", "horizontal-split" },
		t = { "<CMD>tabnew<CR>", "tab-new" },
	},

	-- LSP
	l = {
		name = "lsp",
		d = { lsp.definition, "goto-definition" },
		h = { lsp.hover, "show-hover" },
		s = { lsp.signature_help, "show-signature" },
		r = { lsp.references, "goto-references" },
		x = { "<CMD>LspRestart<CR>", "goto-references" },
		i = { "<CMD>LspInfo<CR>", "lsp-info" },
		l = { "<CMD>e /home/jakob/.cache/nvim/lsp.log<CR>", "lsp-log" },
		n = { lsp.rename, "rename-symbol" },
		a = { lsp.code_action, "code-actions" },
		e = {
			name = "diagnostics",
			e = { "<CMD>Telescope diagnostics<CR>", "diagnostic-overview" },
			l = { diagnostic.open_float, "line-diagnostics" },
            n = { diagnostic.goto_next, "goto-next" },
            p = { diagnostic.goto_prev, "goto-prev" },
		},
	},

    -- DAP
    d = {
        name = "debug",
        r = {dap.continue, "run"},
        b = {dap.toggle_breakpoint, "toggle-breakpoint"}
    },

	-- Terminal
	t = {
		name = "terminal",
		t = { "<CMD>exe v:count1 . 'ToggleTerm'<CR>", "popup-terminal" },
		f = { "<CMD>terminal<CR>", "full-terminal" },
	},

	-- Git
	g = {
		name = "git",
		s = { "<CMD>Ge :<CR>", "git-status" },
		c = { fzf.git_commits, "git-commits" },
		b = { "<CMD>Telescope git_branches<CR>", "git-branches" },
		h = { "<CMD>Git blame<CR>", "git-blame" },
		m = { "<CMD>Git mergetool<CR>", "git-mergetool" },
		v = { "<CMD>silent !gh repo view --web<CR>", "git-browser" },
	},

	-- Path, cwd
	p = {
		name = "path",
		h = { "<CMD>cd $HOME<CR>", "path-home" },
		g = { utils.CWDgitRoot, "path-git-root" },
		n = { "<CMD>cd $HOME/.config/nvim<CR>", "path-neovim-config" },
		c = { "<CMD>cd %:p:h<CR>", "path-current-file" },
		o = { "<CMD>cd $HOME/Documents/gtd<CR>", "path-gtd" },
		k = { "<CMD>cd $HOME/Documents/Personal/KattisSolutions<CR>", "path-kattis" },
		s = { "<CMD>cd $HOME/Documents/School<CR>", "path-school" },
	},


	-- Neorg
	o = {
		name = "organize",
		h = { "<CMD>silent! NeorgStart<CR><CMD>Neorg journal custom " .. utils.getFirstDayOfCurrentMonth() .. "<CR>", "hours" },
		j = { "<CMD>silent! NeorgStart<CR><CMD>Neorg journal today<CR>", "journal" },
		p = { "<CMD>edit $HOME/Documents/gtd/projects.norg<CR>", "projects" },
        t = {
            name = "timetrap",
            i = {require("plugins.timetrap-config").check_in, "check-in"},
            o = {"<CMD>Timetrap out<CR>", "check-out"},
            r = {"<CMD>Timetrap resume<CR>", "resume"},
            d = {"<CMD>Timetrap d<CR>", "display"},
            n = {"<CMD>Timetrap now<CR>", "now"}
        }
	},

    -- Shortcuts
    s = {
        name = "shortcuts",
        p = {"<CMD>PackerSync<CR>", "packer-sync"},
        s = {"<CMD>Alpha<CR>", "start-screen"},
        t = {utils.ToggleThemeMode, "toggle-theme"},
        z = {"<CMD>ZenMode<CR>", "toggle-zen"},
        c = {"<CMD>ScrollbarToggle<CR>", "toggle-scrollbar"}
    },

	-- Help
	h = {
		name = "help",
		t = { "<CMD>Telescope help_tags<CR>", "help-tags" },
        w = { '<CMD>execute "h " . expand("<cword>")<CR>', "help-cword" },
	},

	-- Uncategorized
	w = { "<CMD>w<CR>", "which_key_ignore" },
	n = {
		name = "which_key_ignore",
		o = { "<CMD>nohlsearch<CR>", "which_key_ignore" },
	},
	["<BS>"] = { "<CMD>cd ..<CR>", "which_key_ignore" },
	["<CR>"] = { "<CMD>TermExec go_back=1 cmd='!!'<CR>", "which_key_ignore" },
}, { prefix = "<Leader>" })

wk.register({
	l = {
		name = "lsp",
		a = { "<Esc>gv<CMD>lua vim.lsp.buf.range_code_action()<CR>", "code-actions" },
	},
}, { prefix = "<Leader>", mode = "v" })
