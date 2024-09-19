return {
  "nvim-pack/nvim-spectre",
  opts = {
    color_devicons = true,
    open_cmd = "vnew",
    live_update = false,
    lnum_for_results = true,
    line_sep_start = "",
    result_padding = "¦  ",
    line_sep = "",
    highlight = {
      ui = "String",
      search = "DiffChange",
      replace = "DiffDelete",
    },
  },
  config = function()
    local spectre = require("spectre")

    vim.keymap.set("n", "<leader>S", function()
      spectre.toggle()
    end, { desc = "Toggle Spectre" })

    vim.keymap.set("n", "<leader>sw", function()
      spectre.open_visual({ select_word = true })
    end, { desc = "Search current word" })

    vim.keymap.set("v", "<leader>sw", function()
      spectre.open_visual()
    end, { desc = "Search current word" })

    vim.keymap.set("n", "<leader>sp", function()
      spectre.open_file_search({ select_word = true })
    end, { desc = "Search on current file" })
  end,
}
