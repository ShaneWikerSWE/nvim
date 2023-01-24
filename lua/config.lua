--LSP
require("nvim-lsp-installer").setup({
	automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗"
		}
	}
})
local sumneko_binary_path = vim.fn.exepath('lua-language-server')
local sumneko_root_path = vim.fn.fnamemodify(sumneko_binary_path, ':h:h:h')

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local lspconfig = require("lspconfig")

local function on_attach(client, bufnr)
	-- set up buffer keymaps, etc.
end

lspconfig.sumneko_lua.setup { on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = {
					'vim', 'setup_servers'
				}
			}
		}
	} }

--lspconfig.tsserver.setup {}
lspconfig.jsonls.setup {}
lspconfig.pyright.setup {}
lspconfig.vimls.setup {}
lspconfig.yamlls.setup {}
lspconfig.dockerls.setup {}


require 'nvim-lsp-installer'.post_install_hook = function()
	setup_servers() -- reload installed servers
	vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

require("toggleterm").setup {}

require 'nvim-treesitter.configs'.setup {
	autotag = {
		enable = true,
	}
}

--cmp
local cmp = require("cmp")
local luasnip = require("luasnip")

--   פּ ﯟ   some other good icons
local kind_icons = {
	Text = "",
	Method = "m",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	-- TypeParameter = "",
}

--LSP Enable diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
	signs = true,
}
)

-- Send diagnostics to quickfix list
do
	local method = "textDocument/publishDiagnostics"
	local default_handler = vim.lsp.handlers[method]
	vim.lsp.handlers[method] = function(err, method, result, client_id, bufnr, config)
		default_handler(err, method, result, client_id, bufnr, config)
		local diagnostics = vim.diagnostic.get()
		local qflist = {}
		for bufnr, diagnostic in pairs(diagnostics) do
			for _, d in ipairs(diagnostic) do
				d.bufnr = bufnr
				d.lnum = d.range.start.line + 1
				d.col = d.range.start.character + 1
				d.text = d.message
				table.insert(qflist, d)
			end
		end
	end
end

function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
	vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- Setup nvim-cmp.
local cmp = require 'cmp'

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	window = {
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<S-Tab>'] = cmp.mapping.select_prev_item(),
		['<Tab>'] = cmp.mapping.select_next_item(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = "luasnip" },
		{ name = "copilot" },
		{ name = "nvim_lsp", max_item_count = 6 },
		{ name = "nvim_lua" },
		{ name = "path" },
		{ name = "buffer", max_item_count = 6 },
	})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = 'buffer' },
	})
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lspconfig')['tsserver'].setup {
	capabilities = capabilities
}
require('lspconfig')['html'].setup {
	capabilities = capabilities
}
require('lspconfig')['cssls'].setup {
	capabilities = capabilities
}

require("project_nvim").setup {
}

require('neoscroll').setup({
	-- All these keys will be mapped to their corresponding default scrolling animation
	mappings = { '<C-u>', '<C-d>', '<C-b>', '<C-f>',
		'<C-y>', '<C-e>', 'zt', 'zz', 'zb' },
	hide_cursor = true, -- Hide cursor while scrolling
	stop_eof = true, -- Stop at <EOF> when scrolling downwards
	respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
	cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
	easing_function = nil, -- Default easing function
	pre_hook = nil, -- Function to run before the scrolling animation starts
	post_hook = nil, -- Function to run after the scrolling animation ends
	performance_mode = false, -- Disable "Performance Mode" on all buffers.
})

vim.notify = function(msg, log_level, _opts)
	if msg:match("exit code") then return end
	if log_level == vim.log.levels.ERROR then
		vim.api.nvim_err_writeln(msg)
	else
		vim.api.nvim_echo({ { msg } }, true, {})
	end
end

require('telescope').setup {
	extensions = {
		file_browser = {
			theme = "ivy",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				["i"] = {
					-- your custom insert mode mappings
				},
				["n"] = {
					-- your custom normal mode mappings
				},
			},
		},
	},
}
require('telescope').load_extension('luasnip')
require('telescope').load_extension('file_browser')

require('lualine').setup {}

local function configureDebuggerAngular(dap)
	dap.adapters.chrome = {
		-- executable: launch the remote debug adapter - server: connect to an already running debug adapter
		type = "executable",
		-- command to launch the debug adapter - used only on executable type
		command = "node",
		args = { os.getenv("HOME") .. "/.local/share/nvim/lsp-debuggers/vscode-chrome-debug/out/src/chromeDebug.js" }
	}
	-- The configuration must be named: typescript
	dap.configurations.typescript = {
		{
			name = "Debug (Attach) - Remote",
			type = "chrome",
			request = "attach",
			-- program = "${file}",
			-- cwd = vim.fn.getcwd(),
			sourceMaps = true,
			--      reAttach = true,
			trace = true,
			-- protocol = "inspector",
			-- hostName = "127.0.0.1",
			port = 9222,
			webRoot = "${workspaceFolder}"
		}
	}
end
