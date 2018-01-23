if g:dein#_cache_version != 100 | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/pspencil/.config/nvim/init.vim'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/pspencil/.vim/dein'
let g:dein#_runtime_path = '/home/pspencil/.vim/dein/.cache/init.vim/.dein'
let g:dein#_cache_path = '/home/pspencil/.vim/dein/.cache/init.vim'
let &runtimepath = '/home/pspencil/.config/nvim,/etc/xdg/nvim,/home/pspencil/.local/share/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/home/pspencil/.vim/dein//repos/github.com/Shougo/dein.vim,/home/pspencil/.vim/dein/.cache/init.vim/.dein,/usr/share/nvim/runtime,/home/pspencil/.vim/dein/.cache/init.vim/.dein/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/home/pspencil/.local/share/nvim/site/after,/etc/xdg/nvim/after,/home/pspencil/.config/nvim/after,/home/pspencil/.vim,/home/pspencil/.vim/after'
filetype off
