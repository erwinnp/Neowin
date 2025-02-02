local nvim_lsp = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")
local protocol = require("vim.lsp.protocol")
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

local on_attach = function(client, bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format()
      end,
    })
  end

  opts.buffer = bufnr

  opts.desc = "Go to previous diagnostic"
  keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

  opts.desc = "Go to next diagnostic"
  keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

  opts.desc = "Go to declaration"
  keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

  opts.desc = "Hover Documentation"
  keymap.set("n", "K", vim.lsp.buf.hover, opts)

  opts.desc = "Go to definition"
  keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, opts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local signs = { Error = "✘", Warn = "", Hint = "", Info = "" }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  vim.api.nvim_set_hl(0, hl, { bg = "none" })
end

mason_lspconfig.setup_handlers({
  function(server)
    nvim_lsp[server].setup({
      capabilities = capabilities,
    })
  end,
  ["lua_ls"] = function()
    nvim_lsp["lua_ls"].setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          completion = {
            callSnippet = false,
          },
          runtime = { version = "LuaJIT" },
          workspace = {
            checkThirdParty = false,
            library = {
              "${3rd}/luv/library",
              unpack(vim.api.nvim_get_runtime_file("", true)),
            },
          },
          diagnostics = {
            disable = { "missing-fields" },
          },
        },
      },
    })
  end,
  ["ts_ls"] = function()
    nvim_lsp["ts_ls"].setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        typescript = {
          inlayHints = {
            includeInlayParameterNameHints = "literal",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = false,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
          format = {
            insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = false,
          },
        },
        javascript = {
          inlayHints = {
            includeInlayParameterNameHints = "all",
            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
            includeInlayFunctionParameterTypeHints = true,
            includeInlayVariableTypeHints = true,
            includeInlayPropertyDeclarationTypeHints = true,
            includeInlayFunctionLikeReturnTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
          format = {
            insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = false,
          },
        },
      },
    })
  end,
  ["cssls"] = function()
    nvim_lsp["cssls"].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,
  ["tailwindcss"] = function()
    nvim_lsp["tailwindcss"].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,
  ["html"] = function()
    nvim_lsp["html"].setup({
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = {
        "html",
        "css",
        "javascriptreact",
        "typescriptreact",
        "javascript",
        "typescript",
        "jsx",
        "tsx",
      },
    })
  end,
  ["jsonls"] = function()
    nvim_lsp["jsonls"].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,
  ["eslint"] = function()
    nvim_lsp["eslint"].setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,
})
