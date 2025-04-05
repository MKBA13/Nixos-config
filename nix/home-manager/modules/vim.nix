{pkgs, ...}:
{
	programs.vim = {
  		enable = true;
  		plugins = with pkgs.vimPlugins; [
    			vim-airline
                coc-nvim
                jedi-vim
    			vimspector
    			nerdtree
    			vim-lsp-cxx-highlight
                nord-vim
  		];
	  	extraConfig = ''
		    syntax on
		    set number
		    set tabstop=4
		    set shiftwidth=4
		    set noswapfile
		    set relativenumber

		    set mouse=a

		    let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
		    let g:vimspector_base_dir='~/.vim/plugged/vimspector'

		    let g:coc_data_home = expand('~/.vim/coc-data')

		    nnoremap <leader>n :NERDTreeFocus<CR>
		    nnoremap <C-n> :NERDTree<CR>
		    nnoremap <C-t> :NERDTreeToggle<CR>
		    nnoremap <C-f> :NERDTreeFind<CR>
		    let NERDTreeShowHidden=1

		    inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
		    inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
		    inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

		    colorscheme nord
		    set noshowmode
		    set showtabline=2
		    set laststatus=2
		  '';
	};
}
