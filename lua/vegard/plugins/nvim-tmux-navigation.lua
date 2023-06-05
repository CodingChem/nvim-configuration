local ok, nvim_tmux_navigation = pcall(require, "nvim-tmux-navigation")
if not ok then 
  return
end

nvim_tmux_navigation.setup{
  disable_when_zoomed = true,
  keybindings = {
    left = "<C-h>",
    down = "<C-j>",
    up = "<C-k>",
    right = "<C-l>",
  }
}

