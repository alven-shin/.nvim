default:
    @just --list

update-plugins:
    git subtree pull --prefix pack/plugins/start/everforest-nvim git@github.com:neanias/everforest-nvim.git main --squash
