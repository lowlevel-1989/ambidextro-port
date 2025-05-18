# Ambidextro

**Ambidextro** is the perfect game to enjoy on any handheld console: straightforward, challenging, and very fun.

Created by **Alva Majo**, this game is a *multiplayer for a single player*. Learn to control two characters at the same time, one with each hand. Develop your ambidexterity and rescue both the prince and the princess simultaneously.

**All rights belong to Majorariatto.**

## Where to get it?

So, if you want to enjoy this port, the first thing you need to do is get the game on **Steam** or **itch.io** through the following links:  
- [https://store.steampowered.com/app/3445580/Ambidextro](https://store.steampowered.com/app/3445580/Ambidextro)  
- [https://majorariatto.itch.io/ambidextro](https://majorariatto.itch.io/ambidextro)

## What does this port include?

- **Launcher compatible with PortMaster** for automatic installation.  
- **Mod support** implemented using [Godot Mod Loader](https://github.com/GodotModding/godot-mod-loader).  
- **Included mods:**
  - [**ShaderLow**](mods): a shader optimized specifically for handheld consoles, improving performance while preserving the game’s visual style.
  - [**Achievements**](mods): adds an in-game interface to track and view unlockable achievements, such as completing levels flawlessly, playing with both hands for a certain duration, or reaching specific scores.  
    This mod features its own save system, so achievements unlocked on the PC version will not carry over unless this same mod is enabled.  
    You can review the available achievements [on the Steam achievement page](https://steamcommunity.com/stats/3445580/achievements).

## Hardware Requirements

- **CPU:** AArch64  
- **RAM:** 1 GB  
- **Console:** Must have **two analog sticks**

## CFW Tests:

~~~
- [ ] AmberELEC        (testing)
- [ ] ArkOS            (testing)
- [x] Rocknix
    -> [x] Panfrost
    -> []  Libmali    <- NO
- [x] MuOS
- [ ] Knulli           (testing)
~~~

## 1. Install or update the port

Download `ambidextro.zip` and place it into:  
`/PortMaster/autoinstall`

Launch **PortMaster**. It will install the port automatically.

## 2. Add game data to the port

Copy the file `Ambidextro.pck` into the folder:  
`/roms/ports/ambidextro/`

## Thanks

- [Alva Majo](https://www.majorariatto.com/)  
- [PortMaster](https://github.com/PortsMaster)  
- [Godot Mod Loader](https://github.com/GodotModding/godot-mod-loader)

