vim.highlight.priorities.semantic_tokens = 95

vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    format = function(diagnostic)
      local source = diagnostic.source and string.format("[%s]", diagnostic.source) or ""
      return string.format("%s %s", source, diagnostic.message)
    end,
  },
  underline = false,
  update_in_insert = true,
  float = {
    source = "always",
  },
  on_ready = function()
    vim.cmd("highlight DiagnosticVirtualText guibg=NONE")
  end,
})

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})
