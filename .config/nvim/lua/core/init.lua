require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    }
require("mason").setup {}
require("mason-lspconfig").setup()

require("lsp")
require("trouble").setup {}
-- require("poetry-nvim").setup()

-- Go
require('go').setup()

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})

vim.keymap.set("n", "<leader>xn", function() require("trouble").next({skip_groups = true, jump = true}) end);
vim.keymap.set("n", "<leader>xp", function() require("trouble").previous({skip_groups = true, jump = true}) end);


