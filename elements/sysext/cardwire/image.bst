kind: manual

build-depends:
- unsigned-repart-config.bst
- freedesktop-sdk.bst:public-stacks/runtime-gnu.bst
- freedesktop-sdk.bst:components/fakecap.bst
- freedesktop-sdk.bst:components/systemd.bst
- freedesktop-sdk.bst:components/erofs-utils.bst
- filename: sysext/cardwire/layer.bst
  config:
    location: /cardwire

variables:
  cardwire-version: '$(cat /cardwire%{prefix}/cardwire-version)'
  repart-seed: 127a8905-b3bb-4cfe-a828-776f3d8087c7
  filesystem-time: 1321009871
  strip-binaries: ''

environment:
  EROFS_OPTIONS: -z zstd --all-time -T %{filesystem-time} -E fragments,fragdedupe=inode
  EROFS_WORKERS: --workers=%{max-jobs}
  LD_PRELOAD: /usr/libexec/fakecap/fakecap.so
  FAKECAP_DB: '%{build-root}/fakecap'

environment-nocache:
- EROFS_WORKERS

config:
  build-commands:
  - mkdir fakecap
  - cp -a /cardwire cardwire
  - mkdir -p tmp

  - |
    TMPDIR='%{build-root}/tmp' \
    SYSTEMD_LOG_LEVEL=debug \
    SYSTEMD_REPART_MKFS_OPTIONS_EROFS="${EROFS_OPTIONS} ${EROFS_WORKERS}" \
      systemd-repart \
        --definitions=/usr/lib/repart.sysext.d \
        --empty=create \
        --size=auto \
        --dry-run=no \
        --discard=no \
        --offline=true \
        --no-pager \
        --seed %{repart-seed} \
        --copy-source=cardwire \
        %{install-root}/cardwire_%{cardwire-version}.sysext.raw
