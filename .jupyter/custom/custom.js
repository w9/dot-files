IPython.CodeCell.options_default.cm_config.autoCloseBrackets = false;
IPython.Cell.options_default.cm_config.indentUnit = 2;


// Configure CodeMirror Keymap
require([
  'nbextensions/vim_binding/vim_binding',   // depends your installation
], () => {
  CodeMirror.Vim.unmap("F1");
});
