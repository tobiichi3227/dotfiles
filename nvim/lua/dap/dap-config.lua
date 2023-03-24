local M = {}

local function config_dapi_and_sign()
    local dap_install = require('dap-install')
    dap_install.setup({
        installation_path = vim.fn.stdpath 'data' .. '/dapinstall/',
    })

    local dap_breakpoint_color = {
        breakpoint = {
            ctermbg=0,
            fg='#993939',
            bg='#31353f',
        },
        logpoing = {
            ctermbg=0,
            fg='#61afef',
            bg='#31353f',
        },
        stopped = {
            ctermbg=0,
            fg='#98c379',
            bg='#31353f'
        },
    }

    vim.api.nvim_set_hl(0, 'DapBreakpoint', dap_breakpoint_color.breakpoint)
    vim.api.nvim_set_hl(0, 'DapLogPoint', dap_breakpoint_color.logpoing)
    vim.api.nvim_set_hl(0, 'DapStopped', dap_breakpoint_color.stopped)

    local dap_breakpoint = {
        error = {
            text = "",
            texthl = "DapBreakpoint",
            linehl = "DapBreakpoint",
            numhl = "DapBreakpoint",
        },
        condition = {
            text = 'ﳁ',
            texthl = 'DapBreakpoint',
            linehl = 'DapBreakpoint',
            numhl = 'DapBreakpoint',
        },
        rejected = {
            text = "",
            texthl = "DapBreakpint",
            linehl = "DapBreakpoint",
            numhl = "DapBreakpoint",
        },
        logpoint = {
            text = '',
            texthl = 'DapLogPoint',
            linehl = 'DapLogPoint',
            numhl = 'DapLogPoint',
        },
        stopped = {
            text = '',
            texthl = 'DapStopped',
            linehl = 'DapStopped',
            numhl = 'DapStopped',
        },
    }

    vim.fn.sign_define('DapBreakpoint', dap_breakpoint.error)
    vim.fn.sign_define('DapBreakpointCondition', dap_breakpoint.condition)
    vim.fn.sign_define('DapBreakpointRejected', dap_breakpoint.rejected)
    vim.fn.sign_define('DapLogPoint', dap_breakpoint.logpoint)
    vim.fn.sign_define('DapStopped', dap_breakpoint.stopped)
end

local function config_dapui()
    require('nvim-dap-virtual-text').setup({
        enabled = true,
        enable_commands = true,
        highlight_changed_variables = true,
        highlight_new_as_changed = false,
        show_stop_reason = true,
        commented = false,
        only_first_definition = true,
        all_references = false,
        filter_references_pattern = '<module',
        virt_text_pos = 'eol',
        all_frames = false,
        virt_lines = false,
        virt_text_win_col = nil
    })

    local dap, dapui = require('dap'), require('dapui')
    dapui.setup({
        mappings = {
            -- Use a table to apply multiple mappings
            expand = { "<CR>", "<2-LeftMouse>" },
            open = "o",
            remove = "d",
            edit = "e",
            repl = "r",
            toggle = "t",
        },
        layouts = {
            {
                elements = {
                    {
                        id = 'scopes',
                        size = 0.35
                    },
                    {id = "stacks", size = 0.35},
                    {id = "watches", size = 0.15},
                    {id = "breakpoints", size = 0.15},
                },
                size = 40,
                position = "left",
            },
            {
                elements = {
                    "repl",
                },
                size = 10,
                position = "bottom",
            },
            {
                elements = {
                    "console",
                },
                size = 5,
                position = "right"
            }
        },

        controls = {enabled = false},
        floating = {
            max_height = nil, -- These can be integers or a float between 0 and 1.
            max_width = nil, -- Floats will be treated as percentage of your screen.
            border = "single", -- Border style. Can be "single", "double" or "rounded"
            mappings = {
                close = { "q", "<Esc>" },
            },
        },
        windows = { indent = 1 },
    })
    dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open({})
        vim.api.nvim_command('DapVirtualTextEnable')
    end

    dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close({})
        vim.api.nvim_command('DapVirtualTextDisable')
        dap.repl.close()
    end

    dap.listeners.before.event_exited['dapui_config'] = function()
        vim.api.nvim_command('DapVirtualTextDisable')
        dapui.close({})
        dap.repl.close()
    end

    dap.listeners.before.disconnect['dapui_config'] = function()
        vim.api.nvim_command('DapVirtualTextDisable')
        dapui.close({})
        dap.repl.close()
    end

    dap.defaults.fallback.terminal_win_cmd = 'vsplit new'
end

local function config_debuggers()
    local dap = require('dap')

    dap.adapters.codelldb = function(on_adapter)
        local codelldb_path = '/home/tobiichi3227/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb'

        local tcp = vim.loop.new_tcp()
        tcp:bind('127.0.0.1', 0)
        local port = tcp:getsockname().port
        tcp:shutdown()
        tcp:close()

        local stdout = vim.loop.new_pipe(false)
        local stderr = vim.loop.new_pipe(false)
        local opts = {
            stdio = {nil, stdout, stderr},
            args = {'--port', tostring(port)}
        }
        local handle
        local pid_or_err
        handle, pid_or_err = vim.loop.spawn(codelldb_path, opts, function(code)
            stdout:close()
            stderr:close()
            handle:close()
            if code ~= 0 then
                print("codelldb exited with code", code)
            end
        end)
        if not handle then
            vim.notify("Error running codelldb: " .. tostring(pid_or_err), vim.log.levels.ERROR)
            stdout:close()
            stderr:close()
            return
        end
        vim.notify('codelldb started. pid=' .. pid_or_err)
        stderr:read_start(function(err, chunk)
            assert(not err, err)
            if chunk then
                vim.schedule(function()
                    require("dap.repl").append(chunk)
                end)
            end
        end)
        local adapter = {
            type = 'server',
            host = '127.0.0.1',
            port = port
        }
        vim.defer_fn(function() on_adapter(adapter) end, 500)
    end

    dap.configurations.rust = {
        {
            name = 'Launch file',
            type = 'codelldb',
            request = 'launch',
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                -- local path = vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                -- if (vim.fn.filereadable(path) == true)
                -- then
                --     print(path)
                --     return path
                -- else
                --     return ''
                -- end
            end,
            pid = function()
                local handle = io.popen('pgrep hw$')
                local result = handle:read()
                handle:close()
                return result
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = true,
            terminal = 'integrated',
        }
    }
    dap.configurations.c   = dap.configurations.rust
    dap.configurations.cpp = dap.configurations.rust
    -- require('dap.ext.vscode').load_launchjs(nil, {})

    -- require('dap.dap-ui')
    -- require('lua.dap.dap-go')
    -- require('lua.dap.di-python')
end

function M.setup()
    config_dapi_and_sign()
    config_dapui()
    config_debuggers()
end

return M
