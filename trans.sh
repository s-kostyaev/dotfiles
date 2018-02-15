#!/usr/bin/env bash
notify-send \
    "перевод" \
    "$(transline """`xsel -o `""")"
