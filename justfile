default:
    @just --list

format:
    stylua .

update-plugins:
    git subtree pull --prefix pack/plugins/start/everforest-nvim git@github.com:neanias/everforest-nvim.git main --squash
    git subtree pull --prefix pack/plugins/start/rcd.nvim git@github.com:alven-shin/rcd.nvim.git master --squash
    git subtree pull --prefix pack/plugins/start/which-key.nvim git@github.com:folke/which-key.nvim.git main --squash
    git subtree pull --prefix pack/plugins/start/gitsigns.nvim git@github.com:lewis6991/gitsigns.nvim.git main --squash
    git subtree pull --prefix pack/plugins/start/mason.nvim git@github.com:mason-org/mason.nvim.git main --squash
    git subtree pull --prefix pack/plugins/start/conform.nvim git@github.com:stevearc/conform.nvim.git master --squash
