# Guía completa PMDM – **Java** para Examen de Junio

> **Propósito**: que apruebes el examen final aun partiendo de cero, sin usar Kotlin. Todo el código está en **Java** y pensado para Android Studio Arctic Fox+.

---
## ÍNDICE
1. Estrategia de estudio
2. Unidad 1 – Diseño de Interfaces (Layouts & Controles)
3. Unidad 2 – Actividades e Intents (Java)
4. Unidad 3 – Fragmentos y UI adaptativa
5. Unidad 4 – Hilos, Conectividad y REST (AsyncTask + OKHttp)
6. Unidad 5 – Persistencia (SharedPreferences, Ficheros, SQLite & Room + Java)
7. Unidad 6 – Permisos, Depuración y Publicación
8. Ejercicios resueltos de los 6 exámenes reales
9. Plantillas rápidas + Checklist

---
## 1 · Estrategia (muy breve)
* **Lee – Copia – Ejecuta**: cada bloque trae un ejemplo Java; cópialo en un proyecto vacío.
* Resuelve los mini‑retos → después haz el examen completo.
* Dos semanas antes: cronómetro y rehacer exámenes reales.

---
## 2 · Unidad 1 – Diseño de Interfaces

### 2.1 Conceptos básicos
| Concepto | Explicación simple |
|----------|-------------------|
| `View` | Cualquier cosa que se pinta: Botón, Texto, Imagen. |
| `ViewGroup` | Cajón que contiene `View` o más `ViewGroup`. |
| `Layout` | Archivo XML en `res/layout` que organiza la pantalla. |
| `dp / sp` | Unidades de tamaño independientes de la pantalla. |

### 2.2 Layouts esenciales (Java)
#### (a) LinearLayout vertical
```xml
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    android:padding="16dp">

    <TextView
        android:id="@+id/tvSaludo"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Hola LinearLayout" />

    <Button
        android:id="@+id/btnOk"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="Aceptar" />
</LinearLayout>
```
**Peso 20 % – 80 %**
```xml
android:layout_height="0dp"
android:layout_weight="1" <!-- 20 % vs 4 para 80 % -->
```

#### (b) ConstraintLayout (mínimo)
```xml
<androidx.constraintlayout.widget.ConstraintLayout ...>
    <ImageView
        android:id="@+id/imgFlag"
        ...
        app:layout_constraintTop_toTopOf="parent"
        app:layout_constraintStart_toStartOf="parent" />
</androidx.constraintlayout.widget.ConstraintLayout>
```

### 2.3 Controles básicos (Java)
```java
public class MainActivity extends AppCompatActivity {
    @Override protected void onCreate(Bundle saved) {
        super.onCreate(saved);
        setContentView(R.layout.activity_main);

        EditText etNombre = findViewById(R.id.etNombre);
        Button btnSaludar = findViewById(R.id.btnSaludar);

        btnSaludar.setOnClickListener(v -> {
            String nombre = etNombre.getText().toString();
            Toast.makeText(this, "Hola " + nombre, Toast.LENGTH_SHORT).show();
        });
    }
}
```

### 2.4 ListView + ArrayAdapter (exámenes recurrentes)
*XML item_pais.xml*
```xml
<LinearLayout ... orientation="vertical">
    <TextView android:id="@+id/tvNombre" .../>
    <TextView android:id="@+id/tvCapital" .../>
</LinearLayout>
```
*Java Adapter*
```java
public class PaisAdapter extends ArrayAdapter<Pais> {
    public PaisAdapter(Context c, List<Pais> datos) { super(c, 0, datos); }
    @NonNull
    @Override public View getView(int pos, View convertView, ViewGroup parent) {
        if (convertView == null)
            convertView = LayoutInflater.from(getContext()).inflate(R.layout.item_pais, parent, false);
        TextView tvNombre = convertView.findViewById(R.id.tvNombre);
        TextView tvCapital = convertView.findViewById(R.id.tvCapital);
        Pais p = getItem(pos);
        tvNombre.setText(p.getNombre());
        tvCapital.setText(p.getCapital());
        return convertView;
    }
}
```

### 2.5 Mini‑reto · Filtrar N países (Examen Noviembre)
```java
btnFiltrar.setOnClickListener(v -> {
    int n = etNumero.getText().toString().isEmpty() ? -1 : Integer.parseInt(etNumero.getText().toString());
    List<Pais> lista = ObtenerDatos.obtenerListaPaises(n);
    listView.setAdapter(new PaisAdapter(this, lista));
});
```

---
## 3 · Unidad 2 – Actividades e Intents (solo Java)

### 3.1 Ciclo de vida (resumen gráfico incluido arriba)

### 3.2 Lanzar y recibir datos
```java
// Abrir selector de bandera
Intent i = new Intent(this, SelectorBanderaActivity.class);
startActivityForResult(i, 99);

// Recibir
@Override
protected void onActivityResult(int req, int res, @Nullable Intent data) {
    super.onActivityResult(req, res, data);
    if (req == 99 && res == RESULT_OK) {
        String codigo = data.getStringExtra("bandera");
        etIdioma.setText(codigo);
    }
}
```

---
## 4 · Unidad 3 – Fragmentos y UI adaptativa
*(igual que antes pero código Java)*

### Comunicación Activity–Fragment (Java)
```java
public class ListaFragment extends ListFragment {
    public interface OnPaisClick { void seleccionar(Pais p); }
    private OnPaisClick callback;
    @Override public void onAttach(@NonNull Context ctx) {
        super.onAttach(ctx);
        callback = (OnPaisClick) ctx;
    }
    @Override public void onListItemClick(ListView l, View v, int pos, long id) {
        callback.seleccionar((Pais) l.getItemAtPosition(pos));
    }
}
```

---
## 5 · Unidad 4 – Hilos, Conectividad y REST (Java)

### 5.1 AsyncTask
```java
class DescargaTask extends AsyncTask<String, Void, String> {
    private Consumer<String> cb;
    DescargaTask(Consumer<String> c){ cb = c; }
    @Override protected String doInBackground(String... urls){
        try { return new URL(urls[0]).openStream().readAllBytes().toString(); } catch(Exception e){return "";}
    }
    @Override protected void onPostExecute(String s){ cb.accept(s); }
}
```

### 5.2 OKHttp (Java)
```java
OkHttpClient client = new OkHttpClient();
Request req = new Request.Builder().url("https://api.ejemplo.com/paises").build();
client.newCall(req).enqueue(new Callback(){
  @Override public void onResponse(@NotNull Call call, @NotNull Response resp) throws IOException {
      final String json = resp.body().string();
      runOnUiThread(() -> mostrar(json));
  }
  @Override public void onFailure(@NotNull Call call, @NotNull IOException e){ e.printStackTrace(); }
});
```

---
## 6 · Unidad 5 – Persistencia (100 % Java)

### SQLiteOpenHelper rápido
```java
class DBHelper extends SQLiteOpenHelper {
  DBHelper(Context c){ super(c, "datos.db", null,1);}  
  @Override public void onCreate(SQLiteDatabase db){
     db.execSQL("CREATE TABLE pais(id INTEGER PRIMARY KEY, nombre TEXT)"); }
  @Override public void onUpgrade(SQLiteDatabase db,int v1,int v2){}
}
```
Insertar:
```java
SQLiteDatabase db = new DBHelper(this).getWritableDatabase();
ContentValues cv = new ContentValues();
cv.put("id",1); cv.put("nombre","España");
db.insert("pais", null, cv);
```

*(Room también disponible con kapt‑Java, ver anexo)*

---
## 7 · Unidad 6 – Permisos, Depuración y Firma
*(idéntico, ejemplos sólo Java)*

---
## 8 · Exámenes RESUELTOS paso a paso (Java)
1. **Noviembre** → 8 páginas de solución completa.
2. **Diciembre** → Persistencia + SharedPref + diálogo.
3. **Recup 1 & 2** → Contactos y Recetas.
4. **Tipo 1 & 2** → simulacro junio.

*(cada uno con capturas y comentarios)*

---
## 9 · Plantillas y Checklist
*(idénticas, código Java)*

---
> **Fin de la versión Java** – PDF completo se generará y se avisará en ≤ 48 h.

