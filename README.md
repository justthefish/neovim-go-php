neovim golang and php config
===

This is an early aplha - but the time to move from vim 7.x has come.

Requirements: 
 - neovim 
 - ack-grep
 - fzf (tries to be installed automatically)


- Deoplete on PHP works strange in some cases
- Python, CPP support missing

To start deopleting - create file .phpcd.vim ith content like this:

```
let g:phpcd_autoload_path='vendor/autoload.php'
```

file contains path to autoload files generated by composer.
