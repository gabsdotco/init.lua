-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/gabs/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/gabs/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/gabs/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/gabs/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/gabs/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/gabs/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/gabs/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/gabs/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/gabs/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/gabs/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/gabs/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["colorbuddy.nvim"] = {
    loaded = true,
    path = "/home/gabs/.local/share/nvim/site/pack/packer/start/colorbuddy.nvim",
    url = "https://github.com/tjdevries/colorbuddy.nvim"
  },
  ["copilot.vim"] = {
    loaded = true,
    path = "/home/gabs/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/gabs/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nÅ\5\0\0\5\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\3=\3\17\2B\0\2\1K\0\1\0\nsigns\14untracked\1\0\4\nnumhl\18GitSignsAddNr\ahl\16GitSignsAdd\vlinehl\18GitSignsAddLn\ttext\b‚îÜ\17changedelete\1\0\4\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\vlinehl\21GitSignsChangeLn\ttext\b‚îÇ\14topdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\vlinehl\21GitSignsDeleteLn\ttext\b‚îÇ\vdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\vlinehl\21GitSignsDeleteLn\ttext\b‚îÇ\vchange\1\0\4\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\vlinehl\21GitSignsChangeLn\ttext\b‚îÇ\badd\1\0\0\1\0\4\nnumhl\18GitSignsAddNr\ahl\16GitSignsAdd\vlinehl\18GitSignsAddLn\ttext\b‚îÇ\1\0\1\23current_line_blame\2\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/gabs/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nË\3\0\0\4\0\f\0\0226\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0009\0\3\0\18\2\0\0009\0\4\0'\3\5\0B\0\3\0016\0\0\0009\0\6\0'\2\a\0B\0\2\0016\0\b\0'\2\t\0B\0\2\0029\0\n\0005\2\v\0B\0\2\1K\0\1\0\1\0\3\31show_current_context_start\1\25show_current_context\2\25space_char_blankline\6 \nsetup\21indent_blankline\frequireı\1        highlight IndentBlanklineChar guifg=#1c1c1c\n        highlight IndentBlanklineSpaceChar guifg=#1c1c1c\n        highlight IndentBlanklineSpaceCharBlankline guifg=#1c1c1c\n        highlight IndentBlanklineContextChar guifg=#303030\n      \bcmd\14space:‚ãÖ\vappend\14listchars\tlist\bopt\bvim\0" },
    loaded = true,
    path = "/home/gabs/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/home/gabs/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/gabs/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/gabs/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/gabs/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/gabs/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/gabs/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/gabs/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/gabs/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-noirbuddy"] = {
    config = { "\27LJ\2\n≈\2\0\0\4\0\t\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\0016\0\0\0'\2\b\0B\0\2\1K\0\1\0\ntheme\vcolors\1\0\n\15background\f#000000\vnoir_6\f#888888\vnoir_5\f#777777\vnoir_4\f#666666\vnoir_2\f#595959\vnoir_1\f#e0e0e0\vnoir_0\f#ffffff\14secondary\f#777777\fprimary\f#393939\vnoir_7\f#333333\vstyles\1\0\4\tbold\1\vitalic\2\14undercurl\2\14underline\1\1\0\1\vpreset\fminimal\nsetup\14noirbuddy\frequire\0" },
    loaded = true,
    path = "/home/gabs/.local/share/nvim/site/pack/packer/start/nvim-noirbuddy",
    url = "https://github.com/jesseleite/nvim-noirbuddy"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nä\2\0\0\4\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\26context_commentstring\1\0\1\venable\2\nident\1\0\1\venable\2\21ensure_installed\1\0\2\17auto_install\2\17sync_install\1\1\a\0\0\6c\blua\trust\15javascript\15typescript\tjson\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/gabs/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0" },
    loaded = true,
    path = "/home/gabs/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/gabs/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/gabs/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/gabs/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/gabs/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["prettier.nvim"] = {
    loaded = true,
    path = "/home/gabs/.local/share/nvim/site/pack/packer/start/prettier.nvim",
    url = "https://github.com/MunifTanjim/prettier.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/gabs/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/gabs/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/gabs/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-wakatime"] = {
    loaded = true,
    path = "/home/gabs/.local/share/nvim/site/pack/packer/start/vim-wakatime",
    url = "https://github.com/wakatime/vim-wakatime"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nä\2\0\0\4\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\26context_commentstring\1\0\1\venable\2\nident\1\0\1\venable\2\21ensure_installed\1\0\2\17auto_install\2\17sync_install\1\1\a\0\0\6c\blua\trust\15javascript\15typescript\tjson\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nË\3\0\0\4\0\f\0\0226\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0009\0\3\0\18\2\0\0009\0\4\0'\3\5\0B\0\3\0016\0\0\0009\0\6\0'\2\a\0B\0\2\0016\0\b\0'\2\t\0B\0\2\0029\0\n\0005\2\v\0B\0\2\1K\0\1\0\1\0\3\31show_current_context_start\1\25show_current_context\2\25space_char_blankline\6 \nsetup\21indent_blankline\frequireı\1        highlight IndentBlanklineChar guifg=#1c1c1c\n        highlight IndentBlanklineSpaceChar guifg=#1c1c1c\n        highlight IndentBlanklineSpaceCharBlankline guifg=#1c1c1c\n        highlight IndentBlanklineContextChar guifg=#303030\n      \bcmd\14space:‚ãÖ\vappend\14listchars\tlist\bopt\bvim\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nÅ\5\0\0\5\0\18\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\a\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\3=\3\17\2B\0\2\1K\0\1\0\nsigns\14untracked\1\0\4\nnumhl\18GitSignsAddNr\ahl\16GitSignsAdd\vlinehl\18GitSignsAddLn\ttext\b‚îÜ\17changedelete\1\0\4\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\vlinehl\21GitSignsChangeLn\ttext\b‚îÇ\14topdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\vlinehl\21GitSignsDeleteLn\ttext\b‚îÇ\vdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ahl\19GitSignsDelete\vlinehl\21GitSignsDeleteLn\ttext\b‚îÇ\vchange\1\0\4\nnumhl\21GitSignsChangeNr\ahl\19GitSignsChange\vlinehl\21GitSignsChangeLn\ttext\b‚îÇ\badd\1\0\0\1\0\4\nnumhl\18GitSignsAddNr\ahl\16GitSignsAdd\vlinehl\18GitSignsAddLn\ttext\b‚îÇ\1\0\1\23current_line_blame\2\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: nvim-noirbuddy
time([[Config for nvim-noirbuddy]], true)
try_loadstring("\27LJ\2\n≈\2\0\0\4\0\t\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\0016\0\0\0'\2\b\0B\0\2\1K\0\1\0\ntheme\vcolors\1\0\n\15background\f#000000\vnoir_6\f#888888\vnoir_5\f#777777\vnoir_4\f#666666\vnoir_2\f#595959\vnoir_1\f#e0e0e0\vnoir_0\f#ffffff\14secondary\f#777777\fprimary\f#393939\vnoir_7\f#333333\vstyles\1\0\4\tbold\1\vitalic\2\14undercurl\2\14underline\1\1\0\1\vpreset\fminimal\nsetup\14noirbuddy\frequire\0", "config", "nvim-noirbuddy")
time([[Config for nvim-noirbuddy]], false)
-- Config for: nvim-ts-autotag
time([[Config for nvim-ts-autotag]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0", "config", "nvim-ts-autotag")
time([[Config for nvim-ts-autotag]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
