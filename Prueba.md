# Resumen de la Guía PMDM

## Estrategia de Estudio
La guía propone una estrategia para estudiar Programación Multimedia en Dispositivos Móviles (PMDM), enfocada en temas clave como:

- Diseño de interfaces (dp/sp, Layouts)
- Actividades & Intents (ciclo de vida, startActivityForResult)
- Fragments & UI adaptativa (Master-Detail, responsive design)
- Hilos & Conectividad (Background threads, OkHttp+Gson)
- Persistencia (SharedPrefs, SQLite, Room)
- Permisos & Debugging (Runtime permissions, Logcat)

---

## Resumen Final y Tabla de Checklist

| Categoría                          | Elementos Clave                                         |
|------------------------------------|---------------------------------------------------------|
| **Diseño de Interfaces**           | dp/sp, Layouts, ejemplo filtro                          |
| **Actividades & Intents**          | Ciclo de vida, Intents, startActivityForResult          |
| **Fragments & UI Adaptativa**      | Lifecycle, -sw600dp, Master-Detail                      |
| **Hilos & Conectividad**           | Background threads, OkHttp+Gson                         |
| **Persistencia**                   | SharedPrefs, archivos, SQLite, Room                     |
| **Permisos & Debug & Publicación** | Runtime permissions, Logcat, firma de APK               |

---

## Ciclo de Vida de Actividad (Métodos Clave)
- `onStart()`: La actividad se vuelve visible.  
- `onResume()`: La actividad comienza a interactuar con el usuario.  
- `onPause()`: Pausa la actividad, pero no se detiene completamente.  
- `onStop()`: La actividad ya no es visible.  
- `onDestroy()`: La actividad se destruye (recursos finales).  
- `onRestart()`: Llamado antes de onStart si la actividad fue detenida previamente.

---

## Diseño de Interfaces
### Conceptos Básicos:
- **View:** Elemento UI individual (botón, texto).  
- **ViewGroup:** Contenedor para organizar Views (ej: `LinearLayout`, `ConstraintLayout`).  
- **dp vs sp:**  
  - `dp` (density-independent pixels): Para dimensiones de elementos.  
  - `sp` (scale-independent pixels): Solo para tamaños de texto, respeta ajustes del usuario.
