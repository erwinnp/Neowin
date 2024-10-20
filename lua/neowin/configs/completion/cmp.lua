local cmp = require("cmp")

local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local hl = vim.api.nvim_set_hl

hl(0, "Pmenu", { fg = "#d8dee9", bg = "#2e3440" })  -- Popup menu normal
hl(0, "CmpCursorLine", { bg = "#4c566a" })          -- Cursor line in completion
hl(0, "CmpDoc", { fg = "#d8dee9", bg = "#2e3440" }) -- Documentation window
hl(0, "FloatBorder", { fg = "#3b4252" })            -- Border color

-- icons in snippet
local icons = {
  Class = "Class ",
  Color = "Color ",
  Constant = "Const ",
  Constructor = "Constructor",
  Enum = "Enum ",
  EnumMember = "Enum Member",
  Field = "󰄶 ",
  File = " ",
  Folder = " ",
  Function = "Func",
  Interface = "Interface",
  Keyword = "󰌆 ",
  Method = "Method",
  Module = "󰏗 ",
  Property = " ",
  Snippet = "Snippet",
  Struct = " ",
  Text = " ",
  Unit = " ",
  Value = "󰎠 ",
  Variable = " ",
}

local function feedkey(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },

  completion = {
    autocomplete = { cmp.TriggerEvent.TextChanged },
  },

  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = icons[vim_item.kind]
      vim_item.menu = ({
        buffer = "[Buf]",
        path = "[Path]",
        nvim_lsp = "[Lsp]",
        luasnip = "[Snip]",
        cmdline = "[Cmd]",
        nvim_lua = "[Lua]",
      })[entry.source.name]
      return vim_item
    end,
    -- format = function(_, vim_item)
    -- 	vim_item.kind = icons[vim_item.kind] or " "
    -- 	return vim_item
    -- end,
  },

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  sources = {
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "nvim_lua" },
    { name = "vsnip" },
    {
      name = "buffer",
      option = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end,
      },
    },
  },
  mapping = {
    ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
  },
})
