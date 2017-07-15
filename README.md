# rinspector.vim


## Synopsis 

rinspector.vim is a tiny Vim and Neovim plugin for Ruby code editing which 
allows you to easily put and remove Kernel#p at the beginning of current line 
statement in normal mode.

It saves you typing `m`, `a`, `^`, `i`, `p`, `<Space>`, `<Esc>`, `` ` ``, `a`, `l` and `l`.


## Features

- rinspector.vim recognises indentations and keep them.
- The original cursor position is also kept even after insertion. 
- It can replace p with puts or vice versa.
- Nothing happens in empty lines.


## Installation

Create ftplugin/ruby under your .vim or nvim dirctory and put rinspector.vim 
there directly.

As you see, [the GitHub repository](https://github.com/ikhrnet/rinspector.vim) 
is available. If you have your favourite plugin manager, refer to the manual 
and follow the instructions.


## Settings

Add these lines to your .vimrc or init.vim to call via shortcuts:

```
autocmd FileType ruby nnoremap <silent> <Leader>p :call rinspector#toggle('p')<CR>
autocmd FileType ruby nnoremap <silent> <Leader>P :call rinspector#toggle('puts')<CR>
```


## Usages

Here is an example (`][` stands for cursor positions):

```
a = [1, 2, 3]
a.map do |n|
  n * ]2[
end
```

You modified a little:

```
  n ]*[* 2
```

And you want to get outputs, so pressed `<Leader>p`:

```
  p n ]*[* 2
```

`p ` is inserted. The indentation is kept and the cursor stays on the first 
`*`.

You hit `<Leader>P`:

```
  puts n ]*[* 2
```

`p ` has been replaced with `puts`. You press `<Leader>p`:

```
  p n ]*[* 2
```

You got p instead of puts. You type `<Leader>p` again:

```
  n ]*[* 2
```

Finally, `p ` disappeared.

