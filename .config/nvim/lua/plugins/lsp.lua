local conf = require('lspconfig')

conf.rust_analyzer.setup {
  autostart = true,
  settings = {
    ['rust-analyzer'] = {
      checkOnSave = {
        allFeatures = true,
        command = "clippy",
      },
    },
  },
}

conf.sumneko_lua.setup {
  cmd = {'lua-language-server'},
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
