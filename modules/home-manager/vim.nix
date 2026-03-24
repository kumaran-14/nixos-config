{
  pkgs,
  primaryUser,
  ...
}:
{
  programs.vim = {
    enable = true;
    packageConfigurable = pkgs.vim-darwin; # specifically for macos clipboard settings
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      vim-highlightedyank
      vim-indent-object
      vim-repeat
      vim-commentary
      vim-surround
      vim-exchange
      vim-textobj-entire
      vim-cool
      fzf-vim
    ];
    extraConfig = ''
      " See macos config from laptop and update it
      " ####################### Behold my vimrc #########################

      autocmd VimEnter \* echo "Welcome, Kumaran!"


      filetype plugin indent on
      syntax on

      " ######################## key remaps

      " esc in insert mode
      inoremap kj <esc>

      " esc in command mode
      cnoremap kj <C-C>
      " " Note: In command mode mappings to esc run the command for some odd
      " " historical vi compatibility reason. We use the alternate method of
      " " existing which is Ctrl-C

      " https://vim.fandom.com/wiki/Moving_lines_up_or_down#Mappings_to_move_lines

      " ######################### set options
      set nrformats=
      set title
      set autoindent
      set smartindent
      set backspace=indent,eol,start
      set hlsearch
      set ruler
      set incsearch
      set encoding=UTF-8

      set wildmenu
      set showmode
      set number relativenumber
      set showmatch

      set tabstop=4
      set shiftwidth=4
      set softtabstop=4
      set textwidth=80
      set expandtab " use spaces instead of tabs.
      set smarttab " let's tab key insert 'tab stops', and bksp deletes tabs.

      " We have VCS -- we don't need this stuff.
      set nobackup " We have vcs, we don't need backups.
      set nowritebackup " We have vcs, we don't need backups.
      set noswapfile " They're just annoying. Who likes them?

      " don't nag me when hiding buffers
      set hidden " allow me to have buffers with unsaved changes.
      set autoread " when a file has changed on disk, just load it. Don't ask.

      " Make search more sane
      set ignorecase " case insensitive search
      set smartcase " If there are uppercase letters, become case-sensitive.
      set incsearch " live incremental searching
      set showmatch " live match highlighting
      set hlsearch " highlight matches

      " allow the cursor to go anywhere in visual block mode.
      set virtualedit+=block

      " ######### use copy and paste from vim to clipboard and clipboad to vim
      " Tell Vim exactly how to talk to the macOS pasteboard through Alacritty
      set clipboard=unnamed 

      " ############# common typos
      :command WQ wq
      :command Wq wq
      :command W w
      :command Q q
      :command Set set

      " ################ functions
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

      " persistent undo
      let s:undodir = "~/.vim/undodir" . $USER
      let &undodir=s:undodir
      set undofile

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

      

      " Find files
      nnoremap <C-p> :Files<CR>

      " List and fuzzy-find open buffers
      nnoremap <leader>b :Buffers<CR>

      " Quick switch between last two buffers
      nnoremap <leader><leader> <C-^>

      "############## plugin settings
      " Plugin: vim-cool
      let g:cool_total_matches = 1

      "Plugin: 


    '';
  };




  # TODO: copy useful stuff from above. Keep using SHORCUTS.md to help remember stuff.
  home.file.".ideavimrc".text = ''
    " .ideavimrc is a configuration file for IdeaVim plugin. It uses
    "   the same commands as the original .vimrc configuration.
    " You can find a list of commands here: https://jb.gg/h38q75
    " Find more examples here: https://jb.gg/share-ideavimrc

    " Source your .vimrc
    "source ~/.vimrc
    " ############################### instead doing it manually
    
    " esc in insert mode
    inoremap kj <esc>
    
    " ######################### end manual copy from .vimrc

    " esc in command mode
    cnoremap kj <C-C>
    " " Note: In command mode mappings to esc run the command for some odd
    " " historical vi compatibility reason. We use the alternate method of
    " " existing which is Ctrl-C


    "" -- Suggested options --
    " Show a few lines of context around the cursor. Note that this makes the
    " text scroll if you mouse-click near the start or end of the window.
    set scrolloff=5

    " Do incremental searching.
    set incsearch

    "" Don't use Ex mode, use Q for formatting.
    "map Q gq

    "" --- Enable IdeaVim plugins https://jb.gg/ideavim-plugins

    " Highlight copied text
    Plug 'machakann/vim-highlightedyank'
    "" Commentary plugin
    "Plug 'tpope/vim-commentary'


    """ -- Map IDE actions to IdeaVim -- https://jb.gg/abva4t
    """ Map \r to the Reformat Code action
    ""map \r <Action>(ReformatCode)

    """ Map <leader>d to start debug
    ""map <leader>d <Action>(Debug)

    """ Map \b to toggle the breakpoint on the current line
    ""map \b <Action>(ToggleLineBreakpoint)


    " my kumaran's additions for ideavim
    set ideajoin
    set clipboard+=unnamed
    set clipboard+=ideaput
    set idearefactormode=keep


    " all remaps
    nnoremap g; :action JumpToLastChange<Enter>
    nnoremap g, :action JumpToNextChange<Enter>
  '';
}
