" let s:current_date = strftime("%Y-%m-%d %a %I:%M %p")
let s:class_name = expand("%:t:r")

let s:sz_code = [ '// vim: foldmethod=syntax',
            \'// Bismillahir Rahmanir Rahim',
            \'// Author:           Sazid',
            \'// File Name:        '.@%,
            \'',
            \'package sz.foo;',
            \'',
            \'public class '.s:class_name.' {',
            \'',
            \'    public static void main (String[] args) {',
            \'        // Code goes here',
            \'    }',
            \'',
            \'}' ]

call append(0, s:sz_code)
