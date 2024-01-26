-- Fugitive git stuff
vim.keymap.set('n', '<leader>gS', vim.cmd.Git, { desc = "Fugitive Git" })

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("BufWinEnter", {
  group = augroup('git'),
  pattern = "*",
  callback = function()
    if vim.bo.ft ~= "fugitive" then
      return
    end

    local bufnr = vim.api.nvim_get_current_buf()
    -- Add descriptions to opts
    local opts = {
      buffer = bufnr,
      remap = false,
      desc =
      "Git Operation"
    }

    vim.keymap.set("n", "<leader>p", function()
      vim.cmd.Git('push')
    end, vim.tbl_extend("force", opts, { desc = "Git Push" }))

    -- rebase always
    vim.keymap.set("n", "<leader>P", function()
      vim.cmd.Git('pull --rebase')
    end, vim.tbl_extend("force", opts, { desc = "Git Pull with Rebase" }))

    -- NOTE: It allows me to easily set the branch I am pushing and any tracking
    -- needed if I did not set the branch up correctly
    vim.keymap.set("n", "<leader>t", ":Git push -u origin ",
      vim.tbl_extend("force", opts, { desc = "Git Push with Tracking" }))
  end,
})

return {}
