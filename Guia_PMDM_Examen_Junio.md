
# Guía PMDM – Examen Junio

> **Versión preliminar** – contiene la estructura completa, el índice navegable y las dos primeras unidades totalmente desarrolladas.  
> Las demás secciones incluyen marcadores **`🟡 TODO`** donde se irán incorporando los contenidos detallados y los exámenes resueltos.

---

## Tabla de Contenidos
1. [Estrategia de estudio](#estrategia-de-estudio)
2. [Unidad 1 – Diseño de interfaces](#unidad-1--diseño-de-interfaces)
3. [Unidad 2 – Actividades e Intents](#unidad-2--actividades-e-intents)
4. [Unidad 3 – Fragmentos y UI adaptativa](#unidad-3--fragmentos-y-ui-adaptativa)
5. [Unidad 4 – Hilos- Conectividad y REST](#unidad-4--hilos-conectividad-y-rest)
6. [Unidad 5 – Persistencia](#unidad-5--persistencia)
7. [Unidad 6 – Permisos- Depuración y Publicación](#unidad-6--permisos-depuración-y-publicación)
8. [Exámenes resueltos](#exámenes-resueltos)
9. [Plantillas rápidas + Checklist](#plantillas-rápidas--checklist)
10. [Resumen final](#resumen-final)

---

## Estrategia de estudio

### 1 · Planificación semanal
| Semana | Tema | Horas teoría | Horas práctica | Entregable |
|-------|------|--------------|----------------|------------|
| 1 | Unidad 1 – Layouts | 3 h | 4 h | Demo *Listado de Países* |
| 2 | Unidad 2 – Activities & Intents | 3 h | 4 h | Demo *Selector de Bandera* |
| 3 | Repaso U1 + U2 | 2 h | 3 h | Mini‑test |
| 4 | Unidad 3 – Fragmentos | 3 h | 4 h | Proyecto Lista‑Detalle |
| 5 | Unidad 4 – Threads & REST | 3 h | 5 h | Demo REST Países |
| 6 | Unidad 5 – Persistencia | 3 h | 5 h | CRUD Contactos |
| 7 | Unidad 6 – Permisos + Debug | 3 h | 3 h | Firmar APK |
| 8 | Simulacros de examen | — | 6 h | 6 exámenes |

> **Tip ✏️**: pon en el calendario bloques fijos (ej. lunes‑miércoles‑viernes de 18‑20 h) y usa la regla “50 min + 10 min descanso”.

### 2 · Técnica Pomodoro
1. Elige un objetivo (ej. “comprender `ConstraintLayout`”).
2. Trabaja 25 min sin distracciones.
3. Descansa 5 min.
4. Cada cuatro pomodoros, descansa 15 min.

### 3 · Cómo usar esta guía
- **Lee la teoría** primero.  
- **Sigue el paso‑a‑paso** en Android Studio (capturas incluidas).  
- **Haz el mini‑test** al final de cada sub‑apartado.  
- Marcar ✅ en la **Checklist** antes de pasar de unidad.

---

## Unidad 1 – Diseño de interfaces

### 1.1 Conceptos clave
| Concepto | Descripción |
|----------|-------------|
| `View` | Bloque básico visible (botón, texto, imagen, etc.). |
| `ViewGroup` | Contenedor de otras views. |
| **dp** | *Density‑independent pixel* → tamaño físico coherente en cualquier densidad. |
| **sp** | *Scale‑independent pixel* → como **dp** pero respeta accesibilidad (tamaño de fuente). |

### 1.2 Layouts principales

#### LinearLayout
```xml
<LinearLayout
    android:orientation="vertical"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:padding="16dp">
    <TextView
        android:text="Hola Linear!"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"/>
</LinearLayout>
```
**Ventaja**: sencillez.  
**Inconveniente**: jerarquías profundas si combinas muchos.

#### ConstraintLayout
Diagrama ASCII del ejemplo:

```
+---------------------------------------------+
| [Filtro EditText ] [ Botón Filtrar ]        |
|---------------------------------------------|
|             RecyclerView                    |
+---------------------------------------------+
```

👉 *Piensa en ConstraintLayout como “AutoLayout + GridBag” de Android*.

### 1.3 Ejemplo guiado — “Listado de Países filtrable”
1. **Crea el proyecto** → Empty Activity, Java 8, SDK 34.  
2. **Añade dependencias** en `build.gradle`:
   ```gradle
   implementation "androidx.recyclerview:recyclerview:1.3.2"
   ```
3. **Diseña `activity_main.xml`** en ConstraintLayout (ver captura).  
4. **Implementa el `PaisAdapter`** (extiende `RecyclerView.Adapter`).  
5. **Filtra** con el `TextInputEditText`:  
   ```java
   int n = parseInt(etFiltro.getText().toString(), -1);
   adapter.setData(new ObtenerDatos().obtenerListaPaises(n));
   ```
6. **Mini‑test**  
   1. ¿Qué hace `layout_width="0dp"` combinado con `app:layout_constraintWidth_percent="0.5"`?  
   2. ¿Por qué usar un `RecyclerView` en vez de un `ListView`?

*(Respuestas al final de la unidad.)*


---

## Unidad 2 – Actividades e Intents

### 2.1 Ciclo de vida (diagrama ASCII)
```
onCreate → onStart → onResume
      ↑               ↓
  onRestart ← onStop ← onPause
      ↓
   onDestroy
```

### 2.2 `startActivityForResult` (API 33−)
```java
Intent i = new Intent(this, EditarPaisActivity.class);
startActivityForResult(i, 100);
```
> **Nota**: desde API 34 se recomienda `registerForActivityResult`.

### 2.3 Ejemplo — “Selector de Bandera”
- Reutiliza las imágenes `bandera_es.jpg`, `bandera_uk.jpg`.  
- Muestra un `AlertDialog` con la lista de idiomas, devuelve el seleccionado.

🟡 **TODO**: completar código paso a paso + capturas + mini‑test.

---

## Unidad 3 – Fragmentos y UI adaptativa
🟡 **TODO**

---

## Unidad 4 – Hilos‑ Conectividad y REST
🟡 **TODO**

---

## Unidad 5 – Persistencia
🟡 **TODO**

---

## Unidad 6 – Permisos‑ Depuración y Publicación
🟡 **TODO**

---

## Exámenes resueltos
🟡 **TODO**

---

## Plantillas rápidas + Checklist
🟡 **TODO**

---

## Resumen final

| Unidad | Concepto clave | Dominado ✅ / Repasar ❗️ |
|-------|----------------|--------------------------|
| 1 | Layouts & Views |  |
| 2 | Activities & Intents |  |
| 3 | Fragments |  |
| 4 | Threads & REST |  |
| 5 | Persistencia (Room) |  |
| 6 | Permisos & Debug |  |

> Marca cada casilla cuando seas capaz de **explicar el concepto** y **replicar el ejercicio sin mirar la guía**.

---

### Próximos pasos
1. Completar las secciones 🟡 pendientes (en curso).  
2. Adjuntar `/proyectos_demo.zip` con todos los proyectos Android listos para abrir.  
3. Versionar la guía en GitHub para que puedas revisar cambios históricamente.

---

*¡Ánimo! Cada bloque que completes te acerca al aprobado en junio.* 🎯
