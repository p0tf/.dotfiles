command! ShowHlGroup echo synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
command! ShowHlItem echo synIDattr(synID(line("."), col("."), 1), "name")
