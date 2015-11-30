inoremap '      ''<Left>
inoremap ''     ''
inoremap '''    ''''''<Esc>2hi
inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
