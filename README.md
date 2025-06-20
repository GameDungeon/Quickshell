<h1 align=center>caelestia-shell</h1>

## Fork
This is my fork of the wonderful caelestia quickshell config. This is edited to my taste, and also to properly support nix.

## Components

- Widgets: [`Quickshell`](https://quickshell.outfoxxed.me)
- Window manager: [`Hyprland`](https://hyprland.org)
- Dots: [`caelestia`](https://github.com/caelestia-dots)

## Installation

This is not implemented as of now.

## Usage

The shell can be started in two ways: via systemd or manually running `caelestia shell`.

### Via systemd

The install script creates and enables the systemd service `caelestia-shell.service` which should automatically start the
shell on login.

### Via command

If not on a system that uses systemd, you can manually start the shell via `caelestia-shell`.
To autostart it on login, you can use an `exec-once` rule in your Hyprland config:
```
exec-once = caelestia shell
```

### Shortcuts/IPC

All keybinds are accessible via Hyprland [global shortcuts](https://wiki.hyprland.org/Configuring/Binds/#dbus-global-shortcuts).
For a preconfigured setup, install [`caelestia-hypr`](https://github.com/caelestia-dots/hypr) via `caelestia install hypr` or see
[this file](https://github.com/caelestia-dots/hypr/blob/main/hyprland/keybinds.conf#L1-L29) for an example on how to use global
shortcuts.

All IPC commands can be accessed via `caelestia shell ...`. For example
```sh
caelestia shell mpris getActive trackTitle
```

The list of IPC commands can be shown via `caelestia shell help`:
```
> caelestia shell help
target mpris
  function stop(): void
  function play(): void
  function next(): void
  function getActive(prop: string): string
  function list(): string
  function playPause(): void
  function pause(): void
  function previous(): void
target drawers
  function list(): string
  function toggle(drawer: string): void
target wallpaper
  function list(): string
  function get(): string
  function set(path: string): void
target notifs
  function clear(): void
```

### PFP/Wallpapers

The profile picture for the dashboard is read from the file `~/.face`, so to set it just put your image there.

The wallpapers for the wallpaper switcher are read from `~/Pictures/Wallpapers`, so put your wallpapers there for
them to show up in the switcher (you need to restart the shell after changing stuff in `~/Pictures/Wallpapers` sadly,
no watching for changes yet).

To set the wallpaper, you can use the command `caelestia wallpaper`. Use `caelestia wallpaper -h` for more info about
the command.

## Credits

Thanks to the Hyprland discord community (especially the homies in #rice-discussion) for all the help and suggestions
for improving these dots!

A special thanks to [@outfoxxed](https://github.com/outfoxxed) for making Quickshell and the effort put into fixing issues
and implementing various feature requests.

Another special thanks to [@end_4](https://github.com/end-4) for his [config](https://github.com/end-4/dots-hyprland)
which helped me a lot with learning how to use Quickshell.

Finally another thank you to all the configs I took inspiration from (only one for now):
- [Axenide/Ax-Shell](https://github.com/Axenide/Ax-Shell)
