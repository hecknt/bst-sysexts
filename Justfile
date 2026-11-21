default:
    @just --list

build-cardwire-sysext:
    #!/bin/sh
    set -euo pipefail

    rm -rf cardwire-checkout
    bst build sysext/cardwire/image.bst
    bst artifact checkout sysext/cardwire/image.bst --directory cardwire-checkout
