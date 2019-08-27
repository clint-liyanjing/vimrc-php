#!/bin/bash
## create cscope.out in current dir for php files

find `pwd` -name "*.php" > cscope.files
ctags -R
cscope -Rbkq
