#!/usr/local/bin/zsh

# Copyleft 2010 paradoxxxzero All wrongs reserved
# With contribution from James Ahlborn
# https://gist.github.com/752727
# Fork of https://gist.github.com/586698 by nicoulaj / dingram / roylzuo ...
# From http://www.zsh.org/mla/users/2010/msg00692.html
# Minor Mods here and there by Skinwalker aka Prem K. Murugan
# http://skinwalker.wordpress.com

# Token types styles.
# See http://zsh.sourceforge.net/Doc/Release/Zsh-Line-Editor.html#SEC135
ZLE_RESERVED_WORD_STYLE='fg=yellow,bold'
ZLE_ALIAS_STYLE='fg=magenta,bold'
ZLE_BUILTIN_STYLE='fg=cyan,bold'
ZLE_FUNCTION_STYLE='fg=blue,bold'
ZLE_COMMAND_STYLE='fg=green,bold'
ZLE_COMMAND_UNKNOWN_TOKEN_STYLE='fg=red,bold'

ZLE_HYPHEN_CLI_OPTION='fg=yellow,bold'
ZLE_DOUBLE_HYPHEN_CLI_OPTION='fg=green,bold'
ZLE_SINGLE_QUOTED='fg=magenta,bold'
ZLE_DOUBLE_QUOTED='fg=red,bold'
ZLE_BACK_QUOTED='fg=cyan,bold'
ZLE_GLOBING='fg=blue,bold'

ZLE_DEFAULT='fg=white,bold'

ZLE_TOKENS_FOLLOWED_BY_COMMANDS=('|' '||' ';' '&' '&&' 'sudo' 'start' 'time' 'strace' '§')

# Recolorize the current ZLE buffer.
colorize-zle-buffer() {
  region_highlight=()
  colorize=true
start_pos=0
  for arg in ${(z)BUFFER}; do
    ((start_pos+=${#BUFFER[$start_pos+1,-1]}-${#${BUFFER[$start_pos+1,-1]## #}}))
    ((end_pos=$start_pos+${#arg}))
    if $colorize; then
colorize=false
res=$(LC_ALL=C builtin type $arg 2>/dev/null)
      case $res in
        *'reserved word'*) style=$ZLE_RESERVED_WORD_STYLE;;
        *'an alias'*) style=$ZLE_ALIAS_STYLE;;
        *'shell builtin'*) style=$ZLE_BUILTIN_STYLE;;
        *'shell function'*) style=$ZLE_FUNCTION_STYLE;;
        *"$cmd is"*) style=$ZLE_COMMAND_STYLE;;
        *) style=$ZLE_COMMAND_UNKNOWN_TOKEN_STYLE;;
      esac
else
case $arg in
'--'*) style=$ZLE_DOUBLE_HYPHEN_CLI_OPTION;;
'-'*) style=$ZLE_HYPHEN_CLI_OPTION;;
"'"*"'") style=$ZLE_SINGLE_QUOTED;;
'"'*'"') style=$ZLE_DOUBLE_QUOTED;;
'`'*'`') style=$ZLE_BACK_QUOTED;;
*"*"*) style=$ZLE_GLOBING;;
*) style=$ZLE_DEFAULT;;
esac
fi
region_highlight+=("$start_pos $end_pos $style")
    [[ ${${ZLE_TOKENS_FOLLOWED_BY_COMMANDS[(r)${arg//|/\|}]}:+yes} = 'yes' ]] && colorize=true
start_pos=$end_pos
  done
}

# Bind the function to ZLE events.
ZLE_COLORED_FUNCTIONS=(
    self-insert
    delete-char
    backward-delete-char
    kill-word
    backward-kill-word
    up-line-or-history
    down-line-or-history
    beginning-of-history
    end-of-history
    undo
    redo
    yank
)

for f in $ZLE_COLORED_FUNCTIONS; do
eval "$f() { zle .$f && colorize-zle-buffer } ; zle -N $f"
done

# Expand or complete hack
# Thanks to James Ahlborn :

# create an expansion widget which mimics the original "expand-or-complete" (you can see the default setup using "zle -l -L")
zle -C orig-expand-or-complete .expand-or-complete _main_complete

# use the orig-expand-or-complete inside the colorize function (for some reason, using the ".expand-or-complete" widget doesn't work the same)
expand-or-complete() { builtin zle orig-expand-or-complete && colorize-zle-buffer }
zle -N expand-or-complete
