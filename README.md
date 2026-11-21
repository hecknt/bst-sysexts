# Buildstream built sysexts (WIP)

This is a test repository for sysexts built to work on [GNOME OS](https://os.gnome.org) and [Zirconium (FDSDK)](https://github.com/zirconium-dev/zirconium-hawaii). 

> [!NOTE]
>
> These sysexts are built for systems running on an ABI equivalent to or newer than FDSDK-26.08. Anything other than FDSDK-26.08 has no guarantee of working.
>
> Additionally, sysexts built from this repository will not function on systems with SELinux enabled (such as Fedora).

## Goals

The goal is to allow for these sysexts to be updated automatically through systemd-sysupdate by installing a transfer definition into `/etc/sysupdate.(component-name).d`

- [ ] CI
- [x] Cardwire
- [ ] Tailscale
