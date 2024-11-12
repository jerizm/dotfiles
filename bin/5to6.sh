#! /bin/bash
npm install -g jscodeshift
npm install 5to6-codemod
files="config lib handlers test"
jscodeshift -t ../../node_modules/5to6-codemod/transforms/cjs.js $files
jscodeshift -t ../../node_modules/5to6-codemod/transforms/no-strict.js $files
jscodeshift -t ../../node_modules/5to6-codemod/transforms/exports.js $files
jscodeshift -t ../../node_modules/5to6-codemod/transforms/named-export-generation.js $files
# jscodeshift -t node_modules/5to6-codemod/transforms/simple-arrow.js $files
