return {
  -- You can generate docstrings automatically.
  "danymat/neogen",
  config = function()
    require("neogen").setup {
      enabled = true,
      languages = {
        python = {
          template = {
            annotation_convention = "numpydoc",
          },
        },
      },
    }
  end,
}
