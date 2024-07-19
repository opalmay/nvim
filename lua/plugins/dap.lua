return {
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
				-- dap.repl.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
				-- dap.repl.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
				-- dap.repl.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
				-- dap.repl.close()
			end
		end,
		keys = {
			{ "<leader>dc", "<CMD>lua require('dap').continue()<CR>" },
			{ "<leader>dd", "<CMD>lua require('dap').step_over()<CR>" },
			{ "<leader>di", "<CMD>lua require('dap').step_into()<CR>" },
			{ "<leader>do", "<CMD>lua require('dap').step_out()<CR>" },
			{ "<leader>db", "<CMD>lua require('dap').toggle_breakpoint()<CR>" },
			{ "<leader>dB", "<CMD>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>" },
			{ "<leader>dr", "<CMD>lua require('dap').repl.toggle()<CR>" },
			{ "<leader>dl", "<CMD>lua require('dap').run_last()<CR>" },
		}
	},
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		config = function()
			require("dap-python").setup("python")
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		lazy = true,
		config = function()
			require("dapui").setup({
				-- layouts = {
				-- 	{
				-- 		elements = {
				-- 			{ id = "scopes",      size = 0.33 },
				-- 			{ id = "breakpoints", size = 0.17 },
				-- 			{ id = "stacks",      size = 0.25 },
				-- 			{ id = "watches",     size = 0.25 },
				-- 		},
				-- 		size = 0.33,
				-- 		position = "right",
				-- 	},
				-- 	{
				-- 		elements = {
				-- 			{ id = "console", size = 1 },
				-- 		},
				-- 		size = 0.27,
				-- 		position = "bottom",
				-- 	},
				-- }
			})
		end,
		keys = {
			{ "<leader>de", "<CMD>lua require('dapui').eval()<CR>" }
		},
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }
	}
}
