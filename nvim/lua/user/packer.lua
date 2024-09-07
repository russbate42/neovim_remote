-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)

  -- Packer can manage itself
  use { 'wbthomason/packer.nvim' }

  use { 'ellisonleao/gruvbox.nvim' }

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use { "nvim-treesitter/nvim-treesitter" , run = ':TSUpdate'} 

  use { "nvim-treesitter/playground" }

  use {
	  "nvim-treesitter/nvim-treesitter-textobjects",
	  after = "nvim-treesitter",
	  requires = "nvim-treesitter/nvim-treesitter",
  }

  use { "kylechui/nvim-surround",
      tag = "*", -- Use for stability; omit to use `main` branch for the latest features
      config = function()
          require("nvim-surround").setup({
              -- Configuration here, or leave empty to use defaults
          })
      end }

  use {'m4xshen/autoclose.nvim'}

  use {'wfxr/minimap.vim',
      as = 'minimap',
  }

  use {'ThePrimeagen/harpoon',
	branch = "harpoon2",
    requires = { {"nvim-lua/plenary.nvim",
                "nvim-telescope/telescope.nvim"} }
  }

  use { 'xiyaowong/transparent.nvim' }

  use { 'HiPhish/rainbow-delimiters.nvim' }

  use { 'lukas-reineke/indent-blankline.nvim' }
  
  use { 'numToStr/Comment.nvim',
      config = function() require('Comment').setup() end }

  -- NVIM TREE, for now leave this out as we will just use netrw
  -- use { 'nvim-tree/nvim-tree.lua' }

  if packer_bootstrap then
      require('packer').sync()
  end
end)


