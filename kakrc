
# Set the color
colorscheme gruvbox

# Tab stuff
set-option global tabstop 4
set-option global indentwidth 4

# Turn off clippy
set-option global ui_options ncurses_assistant=none

# Set tab for indenting
map global insert <tab> '<a-;><gt>'
map global insert <s-tab> '<a-;><lt>'

# OS Clipboard interaction
map global user p -docstring 'Paste from clipboard' '!xsel -bo<ret>uU'
map global user y -docstring 'Copy to clipboard' '<a-|>!xsel -bi<ret>'
map global user d -docstring 'Cut to clipboard' '!xsel -bi<ret>'

# Map user-q to close current buffer
map global user q -docstring 'Close current buffer' ':delete-buffer<ret>'

# Map user-m to make
map global user m -docstring 'Make' %{ :evaluate-commands -try-client build_output make<ret> }

# map user-a to select all occurences of main selection
map global user a -docstring 'Select all occurences of main selection' '*%s<ret>'

# map user-r to launch ranger
map global user r -docstring 'Launch Ranger' ':ranger<ret>'

# map user-g to launch gdb
map user g -docstring 'Launch gdb" ':gdb-session-new<ret>'

# map user-w to set line wrapping
map user w -docstring 'Set line wrapping for current buffer' ':addhl buffer/ wrap<ret>'

# map user-f to run code formatting
map global user f -docstring 'Run code formatting' ':format<ret>'

# map user-<ret> to spawn a new kakoune client
map user <ret> -docstring 'Open a new kak client' ':new<ret>'

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

# Remove trailing whitespace on buffer write
hook global BufWritePre .* %{ try %{ execute-keys -draft \%s\h+$<ret>d } }

# Show line numbers
add-highlighter global/ number-lines -hlcursor

# Still don't know what this does
add-highlighter global/ show-matching

# Highlight the current line
add-highlighter global/ line '%val{cursor_line}' default,blue

# Check for local settings
try %{ source .kakrc.local }

# Load plugin manager
source '%val{config}/plugins/plug.kak/rc/plug.kak"

# Plugins
plug "andreyorst/plug.kak"
plug "alexherbo2/connect.kak"
plug "occivink/kakoune-gdb"

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
  
