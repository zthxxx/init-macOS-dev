#!/usr/bin/env bash

substitute_template() {
    local target="$1"
    eval "echo \"$(< ${target}.template)\"" > "$target"
}

tpl_render() {
    for target in "$@"; do
        substitute_template "$target"
    done
}
