
plug 'delapouite/kakoune-i3' %{
    map global user h ':i3-new-left<ret>' -docstring "Open a new window to the left"
    map global user j ':i3-new-down<ret>' -docstring "Open a new window below"
    map global user k ':i3-new-up<ret>' -docstring "Open a new window on top"
    map global user l ':i3-new-right<ret>' -docstring "Open a new window to the right"
}

