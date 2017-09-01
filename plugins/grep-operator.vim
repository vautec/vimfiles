nnoremap <leader>g :set operatorfunc=<SID>GerpOperator<cr>g@
vnoremap <leader>g :<c-u>call <SID>GerpOperator(visualmode())<cr>

function! s:GerpOperator(type)
    let save_unnamed_registr = @@
    if a:type ==# 'v'
        execute "normal! `<v`>y"
    elseif a:type ==# 'char'
        execute "normal! `[v`]y"
    else
        return
    endif
    echom shellescape(@@)
    let @@ = save_unnamed_registr
endfunction
