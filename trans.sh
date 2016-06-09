#!/usr/bin/env bash
notify-send \
    "$(xsel -o | trans -u "Mozilla/5.0" -e bing -no-ansi :ru )"
