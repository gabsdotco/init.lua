function get_file_component()
  local file = vim.fn.expand("%:t")
  return file
end
