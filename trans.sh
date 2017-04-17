#!/usr/bin/env bash
notify-send \
    "$(trans -u "Mozilla/5.0" -no-ansi :ru """`xsel -o `""")"
