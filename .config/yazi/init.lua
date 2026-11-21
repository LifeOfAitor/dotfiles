-- yazi plugin setup

-- mdv-previewer: Markdown preview with mdv's Catppuccin theme
require("mdv-previewer"):setup({
  theme = "catppuccin",
})

-- full-border: rounded border around the panes
require("full-border"):setup({
  set = "rounded",
})

-- git: git status (modified, untracked…) in the file list
require("git"):setup({
  order = 1500,
})
