-- Sends selected text as a command to the last tmux pane <C-c c>
return {
  "jpalardy/vim-slime",
  config = function()
    vim.g.slime_target = "tmux"
    vim.g.slime_default_config = {
      socket_name = "default",
      target_pane = "{last}",
    }
  end,
}
