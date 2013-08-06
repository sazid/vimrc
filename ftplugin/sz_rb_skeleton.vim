let s:module_name = expand("%:t:r")

let s:sz_code = [ '#!/usr/bin/ruby',
                \ '# --------------------------- #',
                \ '# vim: softtabstop=2',
                \ '# vim: shiftwidth=2',
                \ '# Module Name: '.s:module_name,
                \ '# ########################### #',
                \ '# Bismillahir Rahmanir Rahim  #',
                \ '# Author: Sazid               #',
                \ '# ########################### #' ]

call append(0, s:sz_code)
