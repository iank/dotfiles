set et
set sw=4
set smarttab
syntax off
set ruler
set tw=72
set fo=q

highlight FIXME_YELLOW ctermbg=yellow
highlight TODO_GREEN ctermbg=green
highlight SEND_HELP ctermbg=red
let todo = matchadd("TODO_GREEN", "TODO")
let fixme = matchadd("FIXME_YELLOW", "FIXME")
let hack = matchadd("SEND_HELP", "HACK")
let bug = matchadd("SEND_HELP", "BUG")

