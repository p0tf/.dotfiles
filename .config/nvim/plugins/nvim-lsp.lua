local function on_attach(client, _)
  vim.fn["leadermap#bcsmap"]('d', "lua vim.diagnostic.goto_prev()", "lua vim.diagnostic.goto_next()")
  vim.fn["leadermap#bcmap"]('i', "Implementations")
  vim.fn["leadermap#bcmap"]('fs', "WorkspaceSymbols")
  vim.fn["leadermap#bcmap"]('D', "DiagnosticsAll")
  vim.fn["leadermap#bcmap"]('a', "lua vim.lsp.buf.code_action()") vim.fn["leadermap#bcmap"]('r', "lua vim.lsp.buf.rename()")
  vim.fn["leadermap#bcmap"]('d', "lua vim.lsp.buf.definition()")
  vim.fn["leadermap#bcmap"]('t', "lua vim.lsp.buf.type_definition()")
  vim.cmd [[
    augroup lsp_formatting
      autocmd!
      autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1500)
    augroup end
  ]]
  if client.resolved_capabilities.document_highlight then
      vim.cmd [[
        function! s:redraw(timer) abort
          lua << EOF
          vim.lsp.buf.clear_references()
          vim.lsp.buf.document_highlight()
EOF
        endfunction

        function! s:cursor_moved() abort
          if exists('s:timer')
            call timer_stop(s:timer)
          endif
          let s:timer = timer_start(500, funcref('s:redraw'))
        endfunction

        augroup lsp_document_highlight
          autocmd! * <buffer>
          autocmd CursorMoved <buffer> call s:cursor_moved()
        augroup END
      ]]
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local config = require('lspconfig')
-- local util = require('lspconfig.util')

-- config.denols.setup {
--   root_dir = function(fname)
--     return util.root_pattern("deno.json", "deno.jsonc", "tsconfig.json", ".git")(fname)
--       or util.path.dirname(fname)
--   end,
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }

config.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

require('nvim-lsp-installer').on_server_ready(function(server)
  local server_opts = {
    rust_analyzer = {
      ["rust-analyzer"] = {
        assist = {
          importGranularity = "module",
          importEnforceGranularity = true,
        },
        cargo = {
          -- features={"alloc"},
          -- noDefaultFeatures = true,
        },
        checkOnSave = {
          command = "clippy",
          -- features={"alloc"},
          -- noDefaultFeatures = true,
        },
      }
    },
    sumneko_lua = {
      Lua = {
        runtime = {
          version = "LuaJIT",
          path = {
            "./?.lua",
            "/usr/share/luajit-2.0.5/?.lua",
            "/usr/share/lua/5.1/?.lua",
            "/usr/share/lua/5.1/?/init.lua",
          },
        },
        diagnostics = {
          globals = {"vim"},
        },
        workspace = {
          library = {
            ["/usr/share/nvim/runtime/lua"] = true,
            ["/usr/share/nvim/runtime/lua/vim/lsp"] = true,
          },
        },
        telemetry = {
          enable = false,
        },
      }
    }
  }

  server:setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = server_opts[server.name] or {}
  })
end)
