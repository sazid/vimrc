" let s:current_date = strftime("%Y-%m-%d %a %I:%M %p")

let s:sz_code = [ '/*',
            \' * vim: foldmethod=syntax',
            \' * Bismillahir Rahmanir Rahim',
            \' * Author:           Sazid',
            \' * File Name:        '.@%,
            \'*/',
            \'',
            \'#include <stdio.h>',
            \'',
            \'int main()',
            \'{',
            \'    return (0);',
            \'}' ]

call append(0, s:sz_code)
