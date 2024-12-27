local cmp = require "cmp"

local options = require "nvchad.configs.cmp"

options.sources = {
  { name = "nvim_lsp" },
  { name = "luasnip" },
  { name = "buffer" },
  { name = "nvim_lua" },
  { name = "path" },
  { name = "vimtex" },
}

options.preselect = "none"

options.completion = {
  completeopt = "menu,menuone,noinsert,noselect",
}

options.mapping["<CR>"] = cmp.mapping {
  i = function(fallback)
    if cmp.visible() and cmp.get_active_entry() then
      cmp.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false }
    else
      fallback()
    end
  end,
  s = cmp.mapping.confirm { select = true },
  c = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true },
}

return options
