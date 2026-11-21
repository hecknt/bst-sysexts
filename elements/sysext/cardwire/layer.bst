kind: script

build-depends:
- freedesktop-sdk.bst:public-stacks/runtime-gnu.bst
- freedesktop-sdk.bst:components/systemd.bst
- freedesktop-sdk.bst:components/erofs-utils.bst
- filename: sysext/cardwire/compose.bst
  config:
    location: /cardwire

variables:
  install-root: '/cardwire'
  cardwire-version: '$(cat /cardwire%{prefix}/cardwire-version)'

config:
  commands:
  - |
    mkdir -p /cardwire/usr/lib/extension-release.d
    cat <<EOF > /cardwire/usr/lib/extension-release.d/extension-release.cardwire_%{cardwire-version}
    ID=_any
    EOF
