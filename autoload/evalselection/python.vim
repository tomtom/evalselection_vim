" python.vim
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @Website:     http://www.vim.org/account/profile.php?user_id=4037
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2010-01-03.
" @Last Change: 2020-10-18.
" @Revision:    7

let s:save_cpo = &cpo
set cpo&vim


function! evalselection#python#Init() "{{{3
    if !has('python3')
        echoerr 'EvalSelection: +python3 support is required'
    endif
endf


if !exists("*EvalSelectionCalculate")
    function! EvalSelectionCalculate(formula) "{{{3
        exec "python3 print ". a:formula
    endf
endif

function! EvalSelection_python(cmd) "{{{3
    call evalselection#Eval("python", a:cmd, "python3")
endf

if !hasmapto("EvalSelection_python(")
    call EvalSelectionGenerateBindings("y", "python")
endif

if g:evalSelectionPluginMenu != ""
    exec "amenu ". g:evalSelectionPluginMenu ."Python:\\ Command\\ Line :EvalSelectionCmdLine python3<cr>"
end

command! EvalSelectionCmdLinePython :EvalSelectionCmdLine python


let &cpo = s:save_cpo
unlet s:save_cpo
