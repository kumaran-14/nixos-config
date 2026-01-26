" vimrc for using in vscodevim extension config. Written manually, used by nixos to feed to vscode
" vscodvim only supports remaps through custom .vimrc, so this file only has remaps


" ######################## key remaps

" esc in insert mode
inoremap kj <esc>

" esc in command mode
cnoremap kj <C-C>
" " Note: In command mode mappings to esc run the command for some odd
" " historical vi compatibility reason. We use the alternate method of
" " existing which is Ctrl-C

" https://vim.fandom.com/wiki/Moving_lines_up_or_down#Mappings_to_move_lines


" ################ functions, check if they work in vscode
function! s:swap_lines(n1, n2)
let line1 = getline(a:n1)
let line2 = getline(a:n2)
call setline(a:n1, line2)
call setline(a:n2, line1)
endfunction

function! s:swap_up()
let n = line('.')
if n == 1
return
endif

    call s:swap_lines(n, n - 1)
    exec n - 1

endfunction

function! s:swap_down()
let n = line('.')
if n == line('$')
return
endif

    call s:swap_lines(n, n + 1)
    exec n + 1

endfunction

noremap <silent> <c-s-up> :call <SID>swap_up()<CR>
noremap <silent> <c-s-down> :call <SID>swap_down()<CR>
noremap <silent> <c-s-k> :call <SID>swap_up()<CR>
noremap <silent> <c-s-j> :call <SID>swap_down()<CR>

" another way to swap lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" copy current paragraph, go to next new line and paste
nnoremap cp yap<S-}>p

let mapleader = ","
" https://vi.stackexchange.com/questions/36911/use-comma-as-leader-but-keep-commas-original-functionality-as-leader-i-e
" repeat f or t in reverse
nnoremap <leader>, ,

" for jumping up and down with wrapped lines including count
" https://stackoverflow.com/questions/20975928/moving-the-cursor-through-long-soft-wrapped-lines-in-vim
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'


" for c++ programming, insert semicolon at end of line when pressing ;;
inoremap ;; <C-o>A;

" go to end of line and beginning of line while in insert mode
" https://stackoverflow.com/questions/6545078/move-to-the-beginning-of-line-while-in-insert-mode
inoremap <C-e> <Esc>A
inoremap <C-a> <Esc>I

" for beginning and end
noremap H ^
noremap L $

" #https://vi.stackexchange.com/questions/36217/append-inside-brackets-quotes-double-quotes
nnoremap <LEADER>ci" ci"<C-r>"<space>
nnoremap <LEADER>ci' ci'<C-r>"<space>
nnoremap <LEADER>ci( ci(<C-r>"<space>
nnoremap <LEADER>ci) ci)<C-r>"<space>
nnoremap <LEADER>ci{ ci{<C-r>"<space>
nnoremap <LEADER>ci} ci}<C-r>"<space>
nnoremap <LEADER>ci[ ci[<C-r>"<space>
nnoremap <LEADER>ci] ci]<C-r>"<space>
nnoremap <LEADER>ci< ci<<C-r>"<space>
nnoremap <LEADER>ci> ci><C-r>"<space>
nnoremap <LEADER>ci` ci`<C-r>"<space>
