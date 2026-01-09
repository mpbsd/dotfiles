local MAP = require("mpbsd.core.glb").MAP

local KEY = {
	-- Ex mode {{{
	{
		mod = "n",
		lhs = "<Leader>;",
		rhs = ":",
		opt = {
			noremap = true,
			silent = false,
			desc = "Ex mode",
		},
	},
	-- }}}
	-- [W]rite {{{
	{
		mod = "n",
		lhs = "<Leader>w",
		rhs = "<Cmd>w<CR>",
		opt = {
			noremap = true,
			silent = true,
			desc = "[W]rite",
		},
	},
	-- }}}
	-- [Q]uit {{{
	{
		mod = "n",
		lhs = "<Leader>q",
		rhs = "<Cmd>q<CR>",
		opt = {
			noremap = true,
			silent = true,
			desc = "[Q]uit",
		},
	},
	-- }}}
	-- [S]plit | {{{
	{
		mod = "n",
		lhs = [[<Leader>s\]],
		rhs = "<Cmd>vs<CR>",
		opt = {
			noremap = true,
			silent = true,
			desc = "[S]plit |",
		},
	},
	-- }}}
	-- [S]plit - {{{
	{
		mod = "n",
		lhs = [[<Leader>s-]],
		rhs = "<Cmd>sp<CR>",
		opt = {
			noremap = true,
			silent = true,
			desc = "[S]plit -",
		},
	},
	-- }}}
	-- Move cursor to the left window {{{
	{

		mod = "n",
		lhs = "<C-H>",
		rhs = "<C-W><C-H>",
		opt = {
			noremap = true,
			silent = true,
			desc = "Move cursor to the left window",
		},
	},
	-- }}}
	-- Move cursor to the window below {{{
	{
		mod = "n",
		lhs = "<C-J>",
		rhs = "<C-W><C-J>",
		opt = {
			noremap = true,
			silent = true,
			desc = "Move cursor to the window below",
		},
	},
	-- }}}
	-- Move cursor to the window above {{{
	{
		mod = "n",
		lhs = "<C-K>",
		rhs = "<C-W><C-K>",
		opt = {
			noremap = true,
			silent = true,
			desc = "Move cursor to the window above",
		},
	},
	-- }}}
	-- Move cursor to the right window {{{
	{

		mod = "n",
		lhs = "<C-L>",
		rhs = "<C-W><C-L>",
		opt = {
			noremap = true,
			silent = true,
			desc = "Move cursor to the right window",
		},
	},
	-- }}}
	-- Show the next matched string at the center of screen {{{
	{
		mod = "n",
		lhs = "n",
		rhs = "nzz",
		opt = {
			noremap = true,
			silent = true,
			desc = "Show the next matched string at the center of screen",
		},
	},
	-- }}}
	-- Show the previous matched string at the center of screen {{{
	{
		mod = "n",
		lhs = "N",
		rhs = "Nzz",
		opt = {
			noremap = true,
			silent = true,
			desc = "Show the previous matched string at the center of screen",
		},
	},
	-- }}}
	-- nohls {{{
	{
		mod = "n",
		lhs = "<BS>",
		rhs = "<Cmd>nohls<CR>",
		opt = {
			noremap = true,
			silent = true,
			desc = "nohls",
		},
	},
	-- }}}
	-- hsplit -> vsplit {{{
	{
		mod = "n",
		lhs = "<Leader>wth",
		rhs = "<C-W>t<C-W>H",
		opt = {
			noremap = true,
			silent = true,
			desc = "hsplit -> vsplit",
		},
	},
	-- }}}
	-- vsplit -> hsplit {{{
	{
		mod = "n",
		lhs = "<Leader>wtk",
		rhs = "<C-W>t<C-W>K",
		opt = {
			noremap = true,
			silent = true,
			desc = "vsplit -> hsplit",
		},
	},
	-- }}}
	-- [L]a[Z]y {{{
	{
		mod = "n",
		lhs = "<Leader>lz",
		rhs = "<Cmd>Lazy<CR>",
		opt = {
			noremap = true,
			silent = true,
			desc = "[L]a[Z]y",
		},
	},
	-- }}}
	-- [M]a[S]on {{{
	{
		mod = "n",
		lhs = "<Leader>ms",
		rhs = "<Cmd>Mason<CR>",
		opt = {
			noremap = true,
			silent = true,
			desc = "[M]a[S]on",
		},
	},
	-- }}}
	-- [C]heck [H]ealth {{{
	{
		mod = "n",
		lhs = "<Leader>ch",
		rhs = "<Cmd>checkhealth<CR>",
		opt = {
			noremap = true,
			silent = true,
			desc = "[C]heck [H]ealth",
		},
	},
	-- }}}
	-- [C]amel [C]ase {{{
	{
		mod = "i",
		lhs = "<Leader>cc",
		rhs = "<esc>mmb~`ma",
		opt = {
			noremap = true,
			silent = true,
			desc = "[C]amel [C]ase",
		},
	},
	-- }}}
	-- [T]o [U]pper case {{{
	{
		mod = "i",
		lhs = "<Leader>tu",
		rhs = "<esc>mmbgUiw`ma",
		opt = {
			noremap = true,
			silent = true,
			desc = "[T]o [U]pper case",
		},
	},
	-- }}}
	-- [T]o [U]pper case {{{
	{
		mod = "n",
		lhs = "<Leader>tu",
		rhs = "gUiw",
		opt = {
			noremap = true,
			silent = true,
			desc = "[T]o [U]pper case",
		},
	},
	-- }}}
	-- [T]o [L]ower case {{{
	{
		mod = "i",
		lhs = "<Leader>tl",
		rhs = "<esc>mmbguiw`ma",
		opt = {
			noremap = true,
			silent = true,
			desc = "[T]o [L]ower case",
		},
	},
	-- }}}
	-- [T]o [L]ower case {{{
	{
		mod = "n",
		lhs = "<Leader>tl",
		rhs = "guiw",
		opt = {
			noremap = true,
			silent = true,
			desc = "[T]o [L]ower case",
		},
	},
	-- }}}
	-- [D]ecode [B]uffer {{{
	{
		mod = "n",
		lhs = "<Leader>db",
		rhs = function()
			local EQUIVALENCE_TABLE = {
				["à"] = "a",
				["á"] = "a",
				["â"] = "a",
				["ã"] = "a",
				["ç"] = "c",
				["é"] = "e",
				["ê"] = "e",
				["í"] = "i",
				["ó"] = "o",
				["ô"] = "o",
				["õ"] = "o",
				["ú"] = "u",
			}
			local pos = vim.fn.getpos(".")
			local reg = vim.fn.getreg("/")
			for lhs, rhs in pairs(EQUIVALENCE_TABLE) do
				local substitution_cmd = [[%s/]] .. lhs .. [[/]] .. rhs .. [[/ge]]
				vim.cmd(substitution_cmd)
			end
			vim.fn.setpos(".", pos)
			vim.fn.setreg("/", reg)
		end,
		opt = {
			noremap = true,
			silent = true,
			desc = "[D]e[C]ode buffer",
		},
	},
	-- }}}
	-- [R]remove [T]railing spaces from the current buffer {{{
	{
		mod = "n",
		lhs = "<Leader>rt",
		rhs = function()
			local pos = vim.fn.getpos(".")
			local reg = vim.fn.getreg("/")
			vim.cmd([[%s/\s\+$//e]])
			vim.fn.setpos(".", pos)
			vim.fn.setreg("/", reg)
		end,
		opt = {
			noremap = true,
			silent = true,
			desc = "[R]emove [T]railing spaces from current buffer",
		},
	},
	-- }}}
	-- generate a random alphanumeric pass phrase {{{
	{
		mod = "n",
		lhs = "<Leader>uid",
		rhs = function()
			local hex = [[-1r!python3 -c 'import uuid; print(uuid.uuid4().hex)']]
			vim.cmd(hex)
		end,
		opt = {
			noremap = true,
			silent = true,
			desc = "generate a random alphanumeric pass phrase",
		},
	},
	-- }}}
	-- [I]nstall [G]rammars for tree-sitter {{{
	{
		mod = "n",
		lhs = "<Leader>ig",
		rhs = function()
			local CMD = ":TSInstall <trs>"
			local TRS = {
				"bash",
				"bibtex",
				"c",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"ruby",
				"vim",
				"vimdoc",
			}
			for _, trs in pairs(TRS) do
				local cmd = CMD:gsub("<trs>", trs)
				vim.cmd(cmd)
			end
		end,
		opt = {
			noremap = true,
			silent = false,
			desc = "[I]nstall [G]rammars for tree-sitter",
		},
	},
	-- }}}
	-- toggle between [O]pposite [V]alues {{{
	{
		mod = "n",
		lhs = "<Leader>ov",
		rhs = function()
			local cword = vim.fn.expand("<cword>")
			local value = { "true", "false", "yes", "no" }
			if vim.fn.index(value, vim.fn.tolower(cword)) >= 0 then
				if cword == "True" then
					vim.cmd([[sil exec 'normal ciwFalse']])
				elseif cword == "true" then
					vim.cmd([[sil exec 'normal ciwfalse']])
				elseif cword == "False" then
					vim.cmd([[sil exec 'normal ciwTrue']])
				elseif cword == "false" then
					vim.cmd([[sil exec 'normal ciwtrue']])
				elseif cword == "Yes" then
					vim.cmd([[sil exec 'normal ciwNo']])
				elseif cword == "yes" then
					vim.cmd([[sil exec 'normal ciwno']])
				elseif cword == "No" then
					vim.cmd([[sil exec 'normal ciwYes']])
				elseif cword == "no" then
					vim.cmd([[sil exec 'normal ciwyes']])
				end
			end
		end,
		opt = {
			noremap = true,
			silent = false,
			desc = "toggle between [O]pposite [V]alues",
		},
	},
	-- }}}
	-- toggle between [O]pposite [S]igns {{{
	{
		mod = "n",
		lhs = "<Leader>os",
		rhs = function()
			local SV = { "+", "-" }
			vim.cmd([[silent execute 'normal "ayl']])
			vim.cmd([[echo @a]])
			if vim.fn.index(SV, vim.fn.getreg("a")) >= 0 then
				local sv = vim.fn.getreg("a")
				if sv == "+" then
					vim.cmd([[silent execute 'normal s-']])
				elseif sv == "-" then
					vim.cmd([[silent execute 'normal s+']])
				end
			end
		end,
		opt = {
			noremap = true,
			silent = false,
			desc = "toggle between [O]pposite [S]igns",
		},
	},
	-- }}}
	-- [S]tudents [S]IGAA {{{
	{
		mod = "n",
		lhs = "<Leader>ss",
		rhs = function()
			local fn = vim.regex([[\<[0-9]\{6\}IME[0-9]\{4\}\.json\>]])
			local b1 = fn:match_str(vim.fn.expand("%"))
			local b2 = vim.fn.search([[usu.rio \(on\|off\)-line no sigaa]]) > 0
			local b3 = vim.fn.search([[^\s*"[0-9]\{9\}": {$']]) == 0
			if b1 and b2 and b3 then
				vim.cmd([[sil exec 'norm ggguG']])
				vim.cmd([[sil exec 'norm ,db']])
				vim.cmd([[sil exec '1,$s/usuario \(on\|off\)-line no sigaa/\rnome:/g']])
				vim.cmd([[sil exec 'v/^\(nome\|curso\|matricula\|usuario\|e-mail\):/d']])
				vim.cmd([[sil exec '1,$s/\s*enviar mensagem\s*$//']])
				vim.cmd([[sil exec '1,$s/\(^\s\+\|\s\+$\)//e']])
				local subscmd = {
					lhs = {
						[[nome: \(.*\) (perfil)]],
						[[curso: \(.*\)]],
						[[matricula: \(.*\)]],
						[[usuario: \(.*\)]],
						[[e-mail: \(.*\)$]],
					},
					rhs = {
						[["\3": {,]],
						[["fname": "\1",]],
						[["gradc": "\2",]],
						[["uname": "\4",]],
						[["email": "\5"]],
						[[},]],
					},
				}
				local lhs = vim.fn.join(subscmd["lhs"], [[$\n^]])
				local rhs = vim.fn.join(subscmd["rhs"], [[\r]])
				vim.cmd([[1,$s/]] .. lhs .. [[/]] .. rhs .. [[/]])
				vim.cmd([[sil exec 'g/\(marcelo bezerra barboza\|bezerra\|bezerra@ufg.br\)$/d']])
				vim.cmd([[sil exec '1s/^/{\r\t/']])
				vim.cmd([[sil exec '%s/{,$/{/']])
				vim.cmd([[sil exec '$s/$/\r}/']])
				vim.cmd([[sil exec '%s/},$\n^}/}\r}/']])
				vim.cmd([[sil exec 'normal gg=G']])
			end
		end,
		opt = {
			noremap = true,
			silent = false,
			desc = "[S]tudents [S]IGAA",
		},
	},
	-- }}}
	-- [S]taff [I]ME {{{
	{
		mod = "n",
		lhs = "<Leader>si",
		rhs = function()
			local fn = vim.fn.expand("%")
			local b1 = vim.regex([[\<staff_ime\.json\>]]):match_str(fn)
			local b2 = vim.fn.search("DEMONSTRATIVO DE PESSOAL LOTADO") > 0
			local b3 = vim.fn.search("INSTITUTO DE MATEMÁTICA E ESTATÍSTICA") > 0
			if b1 and b2 and b3 then
				local subscmd = {
					lhs = {
						[[^"\([0-9]\{5,\}\)"]],
						[["\([^"]\+\)"]],
						[["\([^"]\+\)"]],
						[["\([^"]\+\)"]],
						[["\%([^"]*\)"]],
						[["\([^"]\+\)"]],
						[["\([^"]\+\)"]],
						[["\([^"]\+\)"]],
						[["\%([^"]*\)"]],
						[["\([^"]\+\)"]],
						[["\([^"]\+\)"$]],
					},
					rhs = {
						[["\1": {"]],
						[["fname": "\2"]],
						[["birth": "\3"]],
						[["ignit": "\4"]],
						[["funct": "\5"]],
						[["categ": "\6"]],
						[["degre": "\7"]],
						[["regim": "\8"]],
						[["afair": "\9"]],
						'"usual": []',
						'"break": []',
						'"patch": []\\r},',
					},
				}
				local lhs = vim.fn.join(subscmd["lhs"], [[,]])
				local rhs = vim.fn.join(subscmd["rhs"], [[,\r]])
				vim.cmd([[sil exec 'norm ggd17j']])
				vim.cmd([[sil exec 'norm ggguG']])
				vim.cmd([[sil exec 'norm ,db']])
				vim.cmd([[sil %s/\v(^|$)/"/g]])
				vim.cmd([[sil %s/,/","/g]])
				vim.cmd([[sil %s/\s\+","/","/g]])
				vim.cmd([[1,$s/]] .. lhs .. [[/]] .. rhs .. [[/]])
				vim.cmd([[sil 1s/^/{\r/]])
				vim.cmd([[sil %s/{",$/{/]])
				vim.cmd([[$s/,$/\r}/]])
				vim.cmd([[set fileformat=unix]])
				vim.cmd([[write]])
			else
				print("Does not match criteria for code execution")
			end
		end,
		opt = {
			noremap = true,
			silent = false,
			desc = "[S]taff [I]ME",
		},
	},
	-- }}}
}

MAP(KEY)
