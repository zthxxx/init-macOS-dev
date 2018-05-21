#!/usr/bin/env bash

TMPLT_SUFFIX=${SUFFIX:=template}

tmplt.compile() {
eval "cat <<-EOF
$(< "${1}.${TMPLT_SUFFIX}")
EOF" > "${1}"
}

tmplt.render() {
    for target in "$@"; do
        # do not render again which file already
        if [[ -r "${target}" ]]; then continue; fi
        if [[ ! -r "${target}.${TMPLT_SUFFIX}" ]]; then
            echo "Can not find template: ${target}.${TMPLT_SUFFIX}"
            return 1
        fi
        tmplt.compile "$target"
    done
}
