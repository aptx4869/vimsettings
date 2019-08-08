let g:templates_user_variables = [
            \   ['SPEC_REQUIRE', 'TemplateCustomSpecRequire'],
            \   ['SPEC_CLASS', 'TemplateCustomSpecClass'],
            \   ['FULLPATH', 'TemplateCustomGetFullPath'],
            \   ['RELATIVE_PATH', 'TemplateCustomRelativePath'],
            \   ['DOT_TO_PWD', 'TemplateCustomDotToPwd'],
            \   ['DASHERIZE', 'TemplateDasherize'],
            \   ['FILE_DIR', 'TemplateFileDir'],
            \ ]
fun! TemplateCustomFlieName()
    return expand("%:t:r:r:r")
endf

fun! TemplateDasherize()
    return substitute(TemplateCustomFlieName(), "_", "-", "g")
endf

fun! TemplateCustomGetFullPath()
    return expand('%:p')
endf

fun! TemplateCustomSpecRequire()
    return substitute(TemplateCustomFlieName(), '_spec', '', '')
endf

fun! TemplateCustomDotToPwd()
    let l:relative = TemplateCustomRelativePath()
    let l:path = substitute(l:relative, expand("%:t"), '', '')

    return substitute(l:path, "\\w\\+", '..', 'g')
endf

fun! TemplateCustomRelativePath()
    let l:pwd = getcwd()."/"
    return substitute(TemplateCustomGetFullPath(), l:pwd, '', '')
endf

fun! TemplateCustomClass()
    return substitute(TemplateCustomFlieName(), "\\([a-zA-Z]\\+\\)", "\\u\\1\\e", "g")
endf

fun! TemplateCustomSpecClass()
    let l:class = substitute(TemplateCustomClass(), "_Spec", "", "g")
    return substitute(l:class, "_", "", "g")
endf

fun! TemplateFileDir()
    return substitute(expand('%:h:t'), "\\([a-zA-Z]\\+\\)", "\\u\\1\\e", "g")
endf
