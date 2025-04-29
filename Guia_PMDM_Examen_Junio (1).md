<!--───────────────────────────────────────────────────────────-->
<!-- Índice generado para navegación rápida (usar enlaces) -->
<!--───────────────────────────────────────────────────────────-->
## Índice

1. [Estrategia de Estudio](#estrategia-de-estudio)  
2. [Unidad 1 – Diseño de Interfaces](#unidad-1--diseño-de-interfaces)  
   1. [Conceptos básicos: View, ViewGroup y dp/sp](#conceptos-básicos-view-viewgroup-y-dpsp)  
   2. [Layouts comunes](#layouts-comunes)  
   3. [Ejemplo práctico: Listado de Países filtrable](#ejemplo-práctico-listado-de-países-filtrable)  
   4. [Mini-test de repaso](#mini-test-de-repaso-unidad-1)  
3. [Unidad 2 – Actividades e Intents](#unidad-2--actividades-e-intents)  
   1. [Ciclo de vida de una Activity](#ciclo-de-vida-de-una-activity)  
   2. [Intents explícitos e implícitos](#intents-explícitos-e-implícitos)  
   3. [startActivityForResult](#startactivityforresult)  
   4. [Menús y diálogos](#menús-y-diálogos)  
   5. [Localización](#localización)  
   6. [Ejemplo: Selector de Bandera](#ejemplo-selector-de-bandera)  
   7. [Mini-test de repaso](#mini-test-de-repaso-unidad-2)  
4. [Unidad 3 – Fragmentos y UI Adaptativa](#unidad-3--fragmentos-y-ui-adaptativa)  
   1. [Concepto y ciclo de vida de Fragment](#concepto-y-ciclo-de-vida-de-fragment)  
   2. [Layouts adaptativos (-sw600dp)](#layouts-adaptativos--sw600dp)  
   3. [Proyecto Master-Detail de Países](#proyecto-master-detail-de-países)  
   4. [Mini-test de repaso](#mini-test-de-repaso-unidad-3)  
5. [Unidad 4 – Hilos, Conectividad y REST](#unidad-4--hilos-conectividad-y-rest)  
   1. [UI Thread vs background threads](#ui-thread-vs-background-threads)  
   2. [AsyncTask y Executors](#asynctask-y-executors)  
   3. [Consumo de REST con OkHttp + Gson](#consumo-de-rest-con-okhttp--gson)  
   4. [Ejemplo práctico: Descarga y parseo de JSON](#ejemplo-práctico-descarga-y-parseo-de-json)  
   5. [Mini-test de repaso](#mini-test-de-repaso-unidad-4)  
6. [Unidad 5 – Persistencia](#unidad-5--persistencia)  
   1. [SharedPreferences](#sharedpreferences)  
   2. [Ficheros (internos, externos, raw/assets)](#ficheros-internos-externos-rawassets)  
   3. [SQLiteOpenHelper y CRUD](#sqliteopenhelper-y-crud)  
   4. [Introducción a Room](#introducción-a-room)  
   5. [Ejercicio CRUD de Contactos](#ejercicio-crud-de-contactos)  
   6. [Mini-test de repaso](#mini-test-de-repaso-unidad-5)  
7. [Unidad 6 – Permisos, Depuración y Publicación](#unidad-6--permisos-depuración-y-publicación)  
   1. [Permisos en manifest vs runtime](#permisos-en-manifest-vs-runtime)  
   2. [Depuración: Logcat y breakpoints](#depuración-logcat-y-breakpoints)  
   3. [Firma de APK y Google Play](#firma-de-apk-y-google-play)  
   4. [Mini-test de repaso](#mini-test-de-repaso-unidad-6)  
8. [Resumen Final y Tabla de Checklist](#resumen-final-y-tabla-de-checklist)  

---

# Guía PMDM para el Examen de Junio

## Estrategia de Estudio
¡Bienvenido a la guía completa de PMDM! Sigue esta estrategia para maximizar tu aprendizaje:
- **Planificación semanal:** dedica una semana a cada unidad, y una semana final a exámenes resueltos.  
- **Estudio activo:** reproduce código tú mismo, haz los ejemplos en Android Studio.  
- **Mini-tests:** tras cada subunidad, pruébate con las preguntas de repaso sin mirar.  
- **Simula examen:** resuelve los exámenes cronometrado, evalúa con las soluciones detalladas.  
- **Consulta documentación:** si algo no está claro, busca en Android Developers y en esta guía.  
- **Descansa:** alterna estudio y descansos; llega al examen con mente fresca.

---

## Unidad 1 – Diseño de Interfaces

### Conceptos básicos: View, ViewGroup y dp/sp
- **View:** cualquier elemento UI (botón, texto, imagen).  
- **ViewGroup:** contenedor que organiza Views (LinearLayout, ConstraintLayout, etc.)  
- **dp vs sp:**  
  - `dp` (density-independent pixels) para márgenes, anchos y altos.  
  - `sp` (scale-independent pixels) sólo para `textSize`.

### Layouts comunes  
- **LinearLayout:** apila Views en vertical u horizontal; usa `layout_weight` para repartir espacio.  
- **RelativeLayout:** posiciona Views relativas a otras Views o al padre.  
- **ConstraintLayout:** layouts flexibles con constraints horizontales y verticales; reemplaza anidamientos excesivos.  
- **FrameLayout:** apila Views; útil para superponer.  
- **TableLayout & GridLayout:** diseños en tabla o cuadrícula.  
- **ScrollView:** contenedor desplazable para contenido extenso.

### Ejemplo práctico: Listado de Países filtrable
1. **Modelo `Pais.java`** con atributos y `toString()`.  
2. **Fuente de datos `ObtenerDatos.java`** que genera la lista y filtra según `numMostrar`.  
3. **Layout `activity_main.xml`**: EditText + Button + TextView mensaje + ListView.  
4. **`MainActivity.java`**:  
   - Inicializa `ArrayAdapter<Pais>` con todos (–1).  
   - `btnFiltrar.setOnClickListener` lee número:  
     - Vacío → muestra todos + mensaje.  
     - Número → filtra N países + oculta mensaje.  
   - `notifyDataSetChanged()` para refrescar.

#### Mini-test de repaso (Unidad 1)
1. ¿dp vs sp y su uso?  
2. Función de un ViewGroup; nombra dos.  
3. ¿Cómo hacer dos botones al 50% en LinearLayout?  
4. ¿Para qué `notifyDataSetChanged()`?  
5. Verdadero/Falso: FrameLayout coloca vistas una debajo de otra.

---

## Unidad 2 – Actividades e Intents

### Ciclo de vida de una Activity
- `onCreate` → `onStart` → `onResume` (en primer plano)  
- → `onPause` → `onStop` (en background) → `onDestroy`  
- (Opcional `onRestart` si regresa tras Stop)

### Intents explícitos e implícitos
- **Explícito:** `new Intent(this, OtraActivity.class)` + `startActivity`.  
- **Implícito:** `new Intent(ACTION_VIEW, Uri.parse(...))`, sistema elige app adecuada.  

### startActivityForResult  
- Lanzar con código: `startActivityForResult(intent, REQ)`.  
- En Activity B: `setResult(RESULT_OK, intentDatos)` + `finish()`.  
- En A: `onActivityResult(requestCode, resultCode, data)`.

### Menús y diálogos
- **OptionsMenu:** define en `/res/menu/`, infla en `onCreateOptionsMenu`, maneja en `onOptionsItemSelected`.  
- **Contextual:** `registerForContextMenu(view)`, `onCreateContextMenu`, `onContextItemSelected`.  
- **AlertDialog:** `new AlertDialog.Builder(this)...show()`; `.setItems`, `.setSingleChoiceItems`, etc.

### Localización
- Textos en `res/values/strings.xml` y `res/values-en/strings.xml`.  
- Imágenes localizadas en `drawable-es/`, `drawable-en/`.

### Ejemplo: Selector de Bandera
1. **`MainActivity`** con ImageView + Button; lanza `SeleccionarBanderaActivity` con `startActivityForResult`.  
2. **`SeleccionarBanderaActivity`**: muestra un diálogo con países (`setItems`).  
3. Devuelve `putExtra("codigoPais", ...)`; al volver, `MainActivity` actualiza ImageView.  
4. Recursos localizados para textos e icono inicial.

#### Mini-test de repaso (Unidad 2)
1. Ordena ciclo de vida.  
2. ¿Cómo enviar y recibir datos entre Activities?  
3. ¿Dónde pausar tareas al perder foco?  
4. ¿Qué ocurre si un Intent implícito tiene varias apps?  
5. ¿Cómo defines un menú y lo asocias?

---

## Unidad 3 – Fragmentos y UI Adaptativa

### Concepto y ciclo de vida de Fragment
- Fragment vive dentro de una Activity; mini-Activity.  
- Callbacks: `onAttach` → `onCreate` → `onCreateView` → `onViewCreated` → `onStart` → `onResume` → `onPause` → `onStop` → `onDestroyView` → `onDestroy` → `onDetach`.

### Layouts adaptativos (-sw600dp)
- Carpetas `layout-sw600dp/` para tablets.  
- Móvil: Activity lista + Activity detalle.  
- Tablet: Activity con dos fragments lado a lado.

### Proyecto Master-Detail de Países
- **ListadoFragment** con interfaz `OnPaisSelectedListener`.  
- **DetalleFragment** para mostrar datos.  
- **MainActivity** decide si reemplaza fragment o abre DetalleActivity.

#### Mini-test de repaso (Unidad 3)
1. ¿Puede un fragment existir sin Activity?  
2. Ventajas de fragments.  
3. ¿Cómo detecta Master-Detail la configuración?  
4. Comunicación fragment → Activity.  
5. ¿Qué hace `addToBackStack`?

---

## Unidad 4 – Hilos, Conectividad y REST

### UI Thread vs background threads
- UI Thread maneja vistas; bloqueo causa ANR.  
- Tareas largas en background (Executors, AsyncTask).

### AsyncTask y Executors
- **AsyncTask:** `doInBackground`, `onPostExecute`.  
- **ExecutorService:** `submit()` y control de hilos.

### Consumo de REST con OkHttp + Gson
1. Permiso INTERNET + configuración cleartext si HTTP.  
2. Dependencias OkHttp y Gson.  
3. `OkHttpClient` + `Request` + `.enqueue(callback)`.  
4. Parseo con `Gson.fromJson(...)`.  
5. Volcar resultados a UI con `runOnUiThread`.

### Ejemplo práctico: Descarga y parseo de JSON
- Muestra ProgressBar, descarga listado de películas, parsea con Gson, actualiza adapter.

#### Mini-test de repaso (Unidad 4)
1. ¿Por qué no usar red en UI Thread?  
2. Método principal de AsyncTask.  
3. ¿Cómo comunicar resultado a UI?  
4. Rol de `.enqueue()` en OkHttp.  
5. Ventajas de Gson.

---

## Unidad 5 – Persistencia

### SharedPreferences
- Pares clave-valor en XML; privados.  

### Ficheros (internos, externos, raw/assets)
- **res/raw** y **assets** para solo lectura.  
- **Internal** (`openFileOutput/Input`).  
- **External** (`getExternalFilesDir`, `Environment`).  

### SQLiteOpenHelper y CRUD
- Subclase de `SQLiteOpenHelper`, `onCreate/onUpgrade`, `insert/query/update/delete`.

### Introducción a Room
- Anotaciones `@Entity`, `@Dao`, `@Database`.  
- Generación automática de código.

### Ejercicio CRUD de Contactos
- `DatosContactos` y `Contacto`.  
- Fragment lista + Activity edición.  
- Filtros y CRUD completo.

#### Mini-test de repaso (Unidad 5)
1. Ejemplo de uso de SharedPreferences.  
2. Diferencia Internal vs External.  
3. Método de SQLiteOpenHelper.  
4. Ejemplo de `db.query()`.  
5. Beneficio de usar Room.

---

## Unidad 6 – Permisos, Depuración y Publicación

### Permisos en manifest vs runtime
- `<uses-permission>` en manifest; `requestPermissions()` en runtime para permisos peligrosos.

### Depuración: Logcat y breakpoints
- `Log.d/e(...)` y ver en Logcat.  
- Debugger de Android Studio: breakpoints, Step Over/Into.

### Firma de APK y Google Play
- Crear keystore y configurar `signingConfigs` en Gradle.  
- Subir APK/AAB a Play Console, completar ficha y politicas.

#### Mini-test de repaso (Unidad 6)
1. Pasos para solicitar permiso CAMERA.  
2. ¿Cómo explicar razón de permiso rechazado?  
3. Uso de `Log.e`.  
4. Importancia del keystore.  
5. Pasos básicos para publicación.

---

## Resumen Final y Tabla de Checklist

| Categoría                          | Elementos Clave                                         | ✅ |
|------------------------------------|---------------------------------------------------------|----|
| **Diseño de Interfaces**           | dp/sp, Layouts, ejemplo filtro                          |    |
| **Actividades & Intents**          | Ciclo de vida, Intents, startActivityForResult          |    |
| **Fragments & UI Adaptativa**      | Lifecycle, -sw600dp, Master-Detail                      |    |
| **Hilos & Conectividad**           | Background threads, OkHttp+Gson                         |    |
| **Persistencia**                   | SharedPrefs, archivos, SQLite, Room                     |    |
| **Permisos & Debug & Publicación** | Runtime permissions, Logcat, firma de APK               |    |
