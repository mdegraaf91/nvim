return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"rcarriga/nvim-dap-ui",
		"leoluz/nvim-dap-go",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("dapui").setup()
		require("dap-go").setup()

		dap.adapters.php = {
			type = "executable",
			command = "node",
			args = { "/Users/michael/.vscode/extensions/vscode-php-debug/out/phpDebug.js" },
		}
		dap.configurations.php = {
			{
				type = "php",
				request = "launch",
				name = "Listen for Xdebug",
				port = 9003,
			},
		}

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<Leader>db", function()
			dap.toggle_breakpoint()
		end, {})

		vim.keymap.set("n", "<Leader>dn", function()
			dap.continue()
		end, {})

		vim.keymap.set("n", "<Leader>dt", function()
			dapui.toggle()
		end, {})

	end,
}
