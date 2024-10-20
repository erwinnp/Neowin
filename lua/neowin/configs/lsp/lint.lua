local status_ok, lint = pcall(require, "lint")
if not status_ok then
  return
end

lint.linters_by_ft = {
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescriptreact = { "eslint_d" },
}

lint.linters.eslint_d = require("lint.util").wrap(lint.linters.eslint_d, function(diagnostic)
  if diagnostic.message:find("Error: Could not find config file") then
    return nil
  end
  return diagnostic
end)

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end,
})

vim.keymap.set("n", "<leader>l", function()
  lint.try_lint()
end, { desc = "Trigger linting for current file" })
