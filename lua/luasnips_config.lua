local ls = require("luasnip") --{{{

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").load({ paths = "~/.config/nvim/snippets/" })
require("luasnip").filetype_extend("javascript", { "css" })
require("luasnip").config.setup({ store_selection_keys = "<A-p>" })

vim.cmd([[command! LuaSnipEdit :lua require("luasnip.loaders.from_lua").edit_snippet_files()]]) --}}}

-- Virtual Text
local types = require("luasnip.util.types")
ls.config.set_config({
	history = true, --keep around last snippet local to jump back
	updateevents = "TextChanged,TextChangedI", --update changes as you type
	enable_autosnippets = true,
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "●", "GruvboxOrange" } },
			},
		},
	},
})

-- Key Mapping --{{{

vim.keymap.set({ "i", "s" }, "<c-s>", "<Esc>:w<cr>")
vim.keymap.set({ "i", "s" }, "<c-u>", '<cmd>lua require("luasnip.extras.select_choice")()<cr><C-c><C-c>')

vim.keymap.set({ "i", "s" }, "<A-y>", "<Esc>o", { silent = true })

vim.keymap.set({ "i", "s" }, "<a-k>", function()
	if ls.jumpable(1) then
		ls.jump(1)
	end
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<a-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-n>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)
vim.keymap.set({ "i", "s" }, "<c-p>", function()
	if ls.choice_active() then
		ls.change_choice(-1)
	end
end) --}}}

vim.cmd([[autocmd BufEnter */snippets/*.lua nnoremap <silent> <buffer> <CR> /-- End Refactoring --<CR>O<Esc>O]])
