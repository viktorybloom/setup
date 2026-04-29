### Laptop notes

For touchpad support get `Identifier:` from running `swaymsg -t get_inputs`

For power button to bind to syspend action alter binding in `/etc/systemd/logind.conf`

Alter default action to be `HandlePowerKey=suspend`.

See: https://github.com/swaywm/sway/issues/2916 for details.
