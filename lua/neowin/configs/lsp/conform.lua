local status_ok, conform = pcall(require, "conform")
if not status_ok then
  return
end

conform.setup({
  formatters_by_ft = {
    javascript = { "prettier", stop_after_first = true },
    javascriptreact = { "prettier", stop_after_first = true },
    typescript = { "prettier", stop_after_first = true },
    typescriptreact = { "prettier", stop_after_first = true },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    lua = { "stylua" },
  },
  format_on_save = {
    lsp_fallback = true,
    timeout_ms = 1000,
  },
})

vim.keymap.set({ "n", "v" }, "<leader>fm", function()
  conform.format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  })
end, { desc = "Format file or range (in visual mode)" })
