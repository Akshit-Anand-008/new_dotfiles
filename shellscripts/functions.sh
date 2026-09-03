# --- FUNCTIONS ---
ex() {
  if [ -f "$1" ] ; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1"    ;;
      *.tar.gz)    tar xzf "$1"    ;;
      *.tar.xz)    tar xf "$1"     ;;
      *.bz2)       bunzip2 "$1"    ;;
      *.rar)       unrar x "$1"    ;;
      *.gz)        gunzip "$1"     ;;
      *.tar)       tar xf "$1"     ;;
      *.tbz2)      tar xjf "$1"    ;;
      *.tgz)       tar xzf "$1"    ;;
      *.zip)       unzip "$1"      ;;
      *.Z)         uncompress "$1" ;;
      *.7z)        7z x "$1"       ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

mkcd() {
    mkdir -p "$1" && cd "$1"
}

jot() {
    local target
    target="$WIKI_PATH/jotted.md"
    mkdir -p "$(dirname "$target")"
    echo "- [$(date "+%Y-%m-%d %H:%M")]: $*" >> "$target"
}

fw() {
    local file
    file=$(fd --type file --search-path "$WIKI_PATH" | fzf)
    [[ -f "$file" ]] && nvim "$file"
}

myopen(){
    local file="$1"
    local mime
    mime=$(file -biL "$file")
    case "$mime" in
        *text*|*empty*|application/json|application/xml)
            "${VISUAL:-nvim}" "$file"
            ;;
        *)
            xdg-open "$file" &>/dev/null &
            ;;
    esac
}

fh() {
    local file
    file=$(fd --type file --search-path "$HOME" | fzf)
    [[ -f "$file" ]] && myopen "$file"
}

f() {
    local file
    file=$(fd --type file | fzf) || return
    [[ -f "$file" ]] && myopen "$file"
}

d() {
    local dir
    dir=$(fd --type directory --search-path "$HOME" | fzf)
    [[ -d "$dir" ]] && cd "$dir"
}

newdh() {
    local dir
    dir=$(fd --type directory --search-path "$HOME" | fzf)
    if [[ -n "$dir" ]]; then
        LBUFFER="${LBUFFER}${(q)dir} "
    fi
    # zle reset-prompt
}
# zle -N newdh
# bindkey '^O' newdh

newff() {
    local file
    file=$(fd --type file . | fzf)
    if [[ -n "$file" ]]; then
        LBUFFER="${LBUFFER}${(q)file} "
    fi
    # zle reset-prompt
}
# zle -N newff
# bindkey '^F' newff

my_zvm_bindkeys() {
    zvm_define_widget newdh
    zvm_define_widget newff
    zvm_bindkey viins '^O' newdh
    zvm_bindkey viins '^F' newff
}
zvm_after_init_commands+=(my_zvm_bindkeys)
ZVM_SYSTEM_CLIPBOARD_ENABLED=true
