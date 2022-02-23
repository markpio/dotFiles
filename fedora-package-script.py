#!/usr/bin/env python3

import os

packages = ["rofi",
            "cmake",
            "ninja-build",
            "i3lock",
            "feh",
            "kakoune",
            "git",
            "i3",
            "cargo",
            "xbacklight",
            "polybar",
            "libxcb-devel",
            "xcb-util-keysyms-devel",
            "xcb-util-devel",
            "xcb-util-wm-devel",
            "xcb-util-xrm-devel",
            "yajl-devel",
            "libXrandr-devel",
            "startup-notification-devel",
            "libev-devel",
            "xcb-util-cursor-devel",
            "libXinerama-devel",
            "libxkbcommon-devel",
            "libxkbcommon-x11-devel",
            "pcre-devel",
            "pango-devel",
            "git",
            "gcc",
            "automake"]


os.system("sudo dnf install {}".format(" ".join(packages)))
