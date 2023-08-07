
function! s:append_path(root, meta)
    let classes = a:root . '/' . a:meta . '/classes'
    let conf = a:root . '/' . a:meta
    exec 'setlocal path+=' . classes
    exec 'setlocal path+=' . conf
endfunction

function! s:append_project_path()
    let root = wzqlib#path#get_root('%')
    let phosphor = wzqlib#path#join(root, 'meta-phosphor')
    let inspur = wzqlib#path#join(root, 'meta-inspur')
    if !wzqlib#path#exists(phosphor) || !wzqlib#path#exists(inspur)
        return
    endif
    let metas = [
                \ 'meta',
                \ 'meta-openembedded/meta-oe',
                \ 'meta-openembedded/meta-networking',
                \ 'meta-openembedded/meta-perl',
                \ 'meta-openembedded/meta-python',
                \ 'meta-openembedded/meta-webserver',
                \ 'meta-security',
                \ 'meta-phosphor',
                \ 'meta-aspeed',
                \ 'meta-inspur',
                \ 'meta-inspur/meta-x86',
                \ 'seta-inspur/meta-nf5280m7'
                \ ]
    for meta in metas
        call s:append_path(root, meta)
    endfor
endfunction

augroup openbmc
    autocmd!

    autocmd FileType bitbake
                \ call s:append_project_path()
augroup END