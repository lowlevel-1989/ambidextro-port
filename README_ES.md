| Modo                        | Características principales                                                                         |
|-----------------------------|-----------------------------------------------------------------------------------------------------|
| **Ambidextro Virtual Control**    | Control virtual, alta compatibilidad con todos los CFW.                                          |
| **Ambidextro Native Control**     | Control nativo, mayor precisión, puede requerir reasignación manual, compatibilidad limitada con algunos CFW. |
| **Ambidextro Lightweight**        | Sin efectos, optimizado para consolas con hardware limitado.                                     |

> **Nota:** La versión *lightweight* usa por defecto el control nativo. Si se utiliza control virtual, el rendimiento puede verse **reducido**, especialmente en consolas con recursos limitados. Para mejores resultados, se recomienda usar un CFW compatible con el control nativo.

## Notas importantes

- En consolas clones con pocos recursos, durante los primeros niveles puedes experimentar bajones de FPS hasta que el juego termine de cachear todos sus datos. Después de esto, el juego debería funcionar con normalidad.


## Ambidextro

**Ambidextro** es el juego perfecto para disfrutar en cualquier consola portátil: directo, desafiante y muy divertido.

Creado por **Alva Majo**, este juego es un *multiplayer para un solo jugador*. Aprende a controlar dos personajes al mismo tiempo, uno con cada mano. Desarrolla tu ambidestreza y rescata simultáneamente al príncipe y a la princesa al mismo tiempo.

**Todos los derechos pertenecen a Majorariatto.**

## ¿Dónde conseguirlo?

Así que, si quieres disfrutar de este port, lo primero que tienes que hacer es conseguir el juego en la tienda de **Steam** o **itch.io** a través de los siguientes enlaces:  
- [https://store.steampowered.com/app/3445580/Ambidextro](https://store.steampowered.com/app/3445580/Ambidextro)  
- [https://majorariatto.itch.io/ambidextro](https://majorariatto.itch.io/ambidextro)

## ¿Qué contenido trae este port?

- **Launcher compatible con PortMaster** para instalación automática.  
- **Soporte para mods**, implementado con [Godot Mod Loader](https://github.com/GodotModding/godot-mod-loader).  
- **Mods incluidos:**
  - [**ShaderLow**](mods): un shader optimizado especialmente para consolas portátiles, que mejora el rendimiento manteniendo la estética del juego.
  - [**Achievements**](mods): añade una interfaz para consultar y hacer seguimiento de logros desbloqueables dentro del juego, como por ejemplo completar niveles sin errores, jugar con ambas manos durante cierto tiempo o alcanzar puntuaciones específicas.  
    Este mod incluye su propio sistema de guardado, por lo que los logros desbloqueados en la versión de PC no se sincronizarán a menos que tengas este mismo mod activo.  
    Puedes consultar los logros disponibles en la [página de logros de Steam](https://steamcommunity.com/stats/3445580/achievements).

### Más Mods para Ambidextro

Si buscas más mods para mejorar tu experiencia en Ambidextro, visita el [repositorio de Ambidextro Mods](https://github.com/lowlevel-1989/ambidextro-mods?tab=readme-ov-file#-mods-para-ambidextro).
Ahí encontrarás varios mods, incluyendo logros y mejoras en el gameplay.

## Requisitos de hardware

- **CPU:** AArch64  
- **RAM:** 1 GB  
- **Consola:** Es obligatorio que tenga **dos sticks analógicos**

## CFW Tests:

~~~
- [x] Rocknix
    -> [x] Panfrost
    -> []  Libmali    <- NO
- [x] MuOS
- [x] AmberELEC
- [x] ArkOS
- [x] Knulli
~~~

## 1. Instalar o actualizar el port

Download `ambidextro.zip` Place the `.zip` into:  
`/PortMaster/autoinstall`

Ejecuta **PortMaster**. La instalación se hará automáticamente.

## 2. Agregar datos del juego al port

copiar el archivo `Ambidextro.pck` dentro de la carpeta `/roms/ports/ambidextro/`

## Agradecimientos

- [Alva Majo](https://www.majorariatto.com/)
- [Damian2809](https://github.com/Damian2809)
- [BinaryCounter](https://github.com/binarycounter)
- [PortMaster](https://github.com/PortsMaster)
- [Godot Mod Loader](https://github.com/GodotModding/godot-mod-loader)
