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
$GPTOKEYB2 "$godot_executable" -c "./menu/controls.ini" &
$GAMEDIR/menu/launch_menu.$DEVICE_ARCH $GAMEDIR/menu/menu.items $GAMEDIR/menu/FiraCode-Regular.ttf

# Capture exit code
selection=$?

# Check selection
case $selection in
    0)
        pm_finish
        exit 2
        ;;
    1)
        echo "THIS IS AN ERROR"
        ;;
    2)
        echo "Option 1 was selected"
        ;;
    3)
        echo "Option 2 was selected"
        ;;
    *)
        echo "Unknown option: $selection"
        ;;
esac

pm_gptokeyb_finish
```

---

Ready to use your custom menu launcher in Portmaster!

