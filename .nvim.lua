-- Presentation-friendly settings for walkthrough markdown files
vim.api.nvim_create_autocmd("BufRead", {
  pattern = vim.fn.getcwd() .. "/*.md",
  group = vim.api.nvim_create_augroup("walkthrough_present", { clear = true }),
  callback = function()
    local wo = vim.wo
    wo.number = false
    wo.relativenumber = false
    wo.signcolumn = "no"
    wo.scrolloff = 999
    wo.cursorline = false
    wo.foldcolumn = "0"

    vim.bo.readonly = true
    vim.bo.modifiable = false
  end,
})
