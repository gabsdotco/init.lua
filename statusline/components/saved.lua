function get_saved_component()
  local saved = vim.bo.modified and "UNSAVED" or "SAVED"
  return saved
end
