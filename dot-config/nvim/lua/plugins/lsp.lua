-- LSP Configuration & Plugins

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for Neovim
    { "williamboman/mason.nvim", config = true },
    "WhoIsSethDaniel/mason-tool-installer.nvim",

    -- Configures Lua LSP for your Neovim config, runtime and plugins
    { "folke/lazydev.nvim", ft = "lua", opts = {} },
  },
  config = function()
    local function add_ruby_deps_command(client, bufnr)
      vim.api.nvim_buf_create_user_command(bufnr, "ShowRubyDeps", function(opts)
        local params = vim.lsp.util.make_text_document_params()
        local showAll = opts.args == "all"

        client.request("rubyLsp/workspace/dependencies", params, function(error, result)
          if error then
            print("Error showing deps: " .. error)
            return
          end

          local qf_list = {}
          for _, item in ipairs(result) do
            if showAll or item.dependency then
              table.insert(qf_list, {
                text = string.format("%s (%s) - %s", item.name, item.version, item.dependency),
                filename = item.path,
              })
            end
          end

          vim.fn.setqflist(qf_list)
          vim.cmd("copen")
        end, bufnr)
      end, {
        nargs = "?",
        complete = function()
          return { "all" }
        end,
      })
    end

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("sineraves-lsp-attach", { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        map("<leader>lr", vim.lsp.buf.rename, "Rename")
        map("<leader>la", vim.lsp.buf.code_action, "Code Action")

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if not client then
          return
        end

        if client.name == "ruby_lsp" then
          add_ruby_deps_command(client, event.buf)
        end

        if client.server_capabilities.documentHighlightProvider then
          local highlight_augroup = vim.api.nvim_create_augroup("sineraves-lsp-highlight", { clear = false })
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd("LspDetach", {
            group = vim.api.nvim_create_augroup("sineraves-lsp-detach", { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds({ group = "sineraves-lsp-highlight", buffer = event2.buf })
            end,
          })
        end
      end,
    })

    require("mason").setup({ ui = { border = "single" } })
    require("mason-tool-installer").setup({
      ensure_installed = {
        "gopls",
        "lua-language-server",
        "pyright",
        "rust-analyzer",
        "stylua",
      },
    })

    vim.lsp.enable({ "gopls", "lua_ls", "pyright", "rust_analyzer", "ruby_lsp" })
  end,
}
