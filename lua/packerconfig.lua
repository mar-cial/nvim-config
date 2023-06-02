
-- ensure the packer plugin manager is installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")
  use("neovim/nvim-lspconfig")
  use 'fatih/vim-go'

  -- themer VERY IMPORTANT DO NOT FUCKING DELETE
  use({
        "themercorp/themer.lua",
        config = function()
	      require("themer").setup({
	          colorscheme = "everforest",
	          styles = {
	            	["function"] = { style = 'italic' },
	             	functionbuiltin = { style = 'italic' },
	             	variable = { style = 'italic' },
	              	variableBuiltIn = { style = 'italic' },
	            	parameter  = { style = 'italic' },
	          },
	      })
        end
    })
end)

-- the first run will install packer and our plugins
if packer_bootstrap then
  require("packer").sync()
  return
end


