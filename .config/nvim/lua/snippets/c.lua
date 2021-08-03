local U = require('snippets.utils')
return {
  main = U.match_indentation [[
int main() {
  $0
  return 0;
}
]],
  Main = U.match_indentation [[
int main(int argc, char *argv[]) {
  $0
  return 0;
}
]],
  inc = "#include<${1:stdio}.h>",
  Inc = [[#include"${1:]] .. vim.fn.expand('%:t:r') .. [[}.h"]],
}
