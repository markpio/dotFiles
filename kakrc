
# Set the color
colorscheme gruvbox

# Tab stuff
set-option global tabstop 4
set-option global indentwidth 4

# Turn off clippy
set-option global ui_options ncurses_assistant=none

# OS Clipboard interaction
map global user p -docstring 'Paste from clipboard' '!xsel -bo<ret>uU'
map global user y -docstring 'Copy to clipboard' '<a-|>!xsel -bi<ret>'
map global user d -docstring 'Cut to clipboard' '!xsel -bi<ret>'

# No tabs... just spaces
map global insert <tab> "    "

# Shift tab unindents
map global insert <s-tab> '<a-;><lt>'

# Map user-q to close current buffer
map global user q -docstring 'Close current buffer' ':delete-buffer<ret>'

# Map user-m to make
map global user m -docstring 'Make' %{ :evaluate-commands -try-client build_output make<ret> }

# map user-a to select all occurences of main selection
map global user a -docstring 'Select all occurences of main selection' '*%s<ret>'

# map user-r to launch ranger
map global user r -docstring 'Launch Ranger' ':ranger<ret>'

# map user-w to set line wrapping
map global user w -docstring 'Set line wrapping for current buffer' ':addhl buffer/ wrap<ret>'

# map user-f to run code formatting
map global user f -docstring 'Run code formatting' ':format<ret>'

# map user-<ret> to spawn a new kakoune client
map global user <ret> -docstring 'Open a new kak client' ':new<ret>'

# map user-c to ctags search
map global user c -docstring 'Ctags-search on current selection' ':ctags-search<ret>'

# Comments
map global normal '#' -docstring 'Comment line' :comment-line<ret>
map global normal '<a-#>' -docstring 'Comment block' :comment-block<ret>

# Hooks for C/C++ family of files
hook global WinCreate .*\.(c|cc|cpp|cxx|C|h|hh|hpp|hxx)$ %{

  # Enable autocomplete
  clang-enable-autocomplete

  # Set clang-format for formatting
  set window formatcmd 'clang-format'

  # Format the code on exiting insert and saving buffer
  hook buffer InsertEnd .* %{ format }
  hook buffer BufWritePre .* %{ format }

  # Update ctags on exiting insert mode
  hook buffer InsertEnd .* %{ ctags-generate }
}

# Hooks for python files
hook global WinCreate .*\.py$ %{

    # Set format command to autopep8
    set window formatcmd "autopep8 -"

    # Install hook to format on save
    hook buffer BufWritePre .* %{ format }
}

# Remove trailing whitespace on buffer write
hook global BufWritePre .* %{ try %{ execute-keys -draft \%s\h+$<ret>d } }

# Show line numbers
add-highlighter global/ number-lines -hlcursor

# Still don't know what this does
add-highlighter global/ show-matching

# Highlight the current line
add-highlighter global/ line '%val{cursor_line}' default,black

# Check for local settings
try %{ source .kakrc.local }

# Load plugin manager
source "%val{config}/plugins/plug.kak/rc/plug.kak"

# Plugins
plug "alexherbo2/connect.kak"
plug "andreyorst/fzf.kak" %{
    map global normal <c-p> ': fzf-mode<ret>'
}


plug "andreyorst/powerline.kak" defer "powerline" %{
  powerline-seperator triangle
  set-option global powerline_format 'powerline-format git bugname filetype mode_info line_column position'
  powerline-toggle line_column off
  powerline-theme gruvbox
}

plug "andreyorst/tagbar.kak" defer "tagbar" %{
  set-option global tagbar_sort false
  set-option global tagbar_size 40
  set-option global tagbar_display_anon false
} config %{
  hook global WinSetOption filetype-tagbar %{
    remove-highlighter window/wrap
  }
}

plug 'delapouite/kakoune-i3' %{
    map global user h ':i3-new-left<ret>' -docstring "Open a new window to the left"
    map global user j ':i3-new-down<ret>' -docstring "Open a new window below"
    map global user k ':i3-new-up<ret>' -docstring "Open a new window on top"
    map global user l ':i3-new-right<ret>' -docstring "Open a new window to the right"
}
