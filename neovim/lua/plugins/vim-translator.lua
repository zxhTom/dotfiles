return {
  'uga-rosa/translate.nvim',
  cmd = { "Translate", "TranslateReplace" },
  config = function()
    require('utils.import').all("vim-translator")
  end,
}

