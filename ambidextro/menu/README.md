# Menu Launcher for Portmaster v0.1.0

This is a menu launcher for Portmaster that allows selecting configurable options through a `menu.items` file.

---

## How to add or remove menu items

To modify the menu options, edit the file:

```
menu.items
```

Each line represents a menu option shown to the user.

---

## Menu output and exit codes

- If **Exit** is selected, the exit code will be `0`.
- If the script fails or encounters any error, the exit code will be `1`.
- For selected menu options, the exit codes are:

| Option       | Exit Code (`exitcode`) |
|--------------|-----------------------|
| Option 1     | 2                     |
| Option 2     | 3                     |
| Option 5     | 6                     |

---

## Integration with your Portmaster script

To integrate this menu into your Portmaster launcher, add the following to your script:

```bash
$GPTOKEYB2 -c "./menu/controls.ini" &
__pid_control=$!
$GAMEDIR/menu/launch_menu.$DEVICE_ARCH $GAMEDIR/menu/menu.items $GAMEDIR/menu/FiraCode-Regular.ttf

# Capture the exit code
selection=$?

# Check what was selected
case $selection in
    0)
        pm_finish
        exit 2
        ;;
    1)
        echo "[MENU] ERROR"
        pm_finish
        exit 1
        ;;
    2)
        echo "[MENU] Virtual Control"
        control_subfix="virtual"
        ;;
    3)
        echo "[MENU] Native Control"
        control_subfix="native"
        ;;
    4)
        echo "[MENU] Lightweight"
        export SHADER_PASSTHROUGH=
        ;;
    5)
        echo "[MENU] Lightweight Virtual Control"
        control_subfix="virtual"
        export SHADER_PASSTHROUGH=
        ;;
    *)
        echo "[MENU] Unknown option: $selection"
        pm_finish
        exit 3
        ;;
esac
echo KILL $__pid_control
kill $__pid_control

sleep 2
```

---

Ready to use your custom menu launcher in Portmaster!

