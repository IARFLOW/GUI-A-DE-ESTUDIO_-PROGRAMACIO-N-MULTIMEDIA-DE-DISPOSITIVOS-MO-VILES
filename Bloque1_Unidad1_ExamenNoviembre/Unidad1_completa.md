
# **Unidad 1 – Diseño de Interfaces (Java) – 13 páginas**

## 0. Objetivo de esta unidad  
Aprenderás a **construir pantallas en Android desde cero**, entender qué hace cada línea de XML y cómo conectar todo con Java. Al final serás capaz de reproducir la interfaz del **Examen de Noviembre** (5 puntos del examen real).

---

## 1. Conceptos fundamentales

| Término | Explicación para principiantes | Dónde lo usarás |
|---------|------------------------------|-----------------|
| **View** | Cualquier elemento que se dibuja (Texto, Botón, Imagen). | `TextView`, `Button`, etc. |
| **ViewGroup** | Contenedor de otras Views, define la distribución. | `LinearLayout`, `ConstraintLayout`. |
| **Layout XML** | Archivo en `res/layout` que describe la pantalla. | `activity_main.xml`, `fragment_listado.xml`. |
| **dp** | Píxeles independientes de densidad (density‑independent). | Siempre usa dp en márgenes y tamaños. |
| **sp** | Igual que dp pero escalable con la fuente del sistema. | Tamaño de texto (`android:textSize`). |

**Regla de examen**: No uses `px`, si el profesor ve `px` descuenta puntos.

---

## 2. LinearLayout: la estantería vertical

### 2.1 Primer ejemplo paso a paso

1. Crea un proyecto «Unidad1Demo» → Activity vacía (Java).  
2. Abre `activity_main.xml` y reemplázalo por:

```xml
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    android:padding="16dp">

    <TextView
        android:id="@+id/tvTitulo"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Hola LinearLayout"
        android:textAppearance="?attr/textAppearanceHeadline6"/>

    <Button
        android:id="@+id/btnAceptar"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:text="Aceptar"/>
</LinearLayout>
```

3. **Qué hace cada línea**  
   * `orientation="vertical"` → apila hijos de arriba abajo.  
   * `layout_width="match_parent"` en el botón → ocupa todo el ancho.  
   * `padding="16dp"` → deja un espacio interior cómodo.

4. **Conectar con Java**

```java
public class MainActivity extends AppCompatActivity {
    @Override protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button btn = findViewById(R.id.btnAceptar);
        btn.setOnClickListener(v ->
                Toast.makeText(this,"Pulsado",Toast.LENGTH_SHORT).show());
    }
}
```

Ejecuta: verás el texto y el botón; al pulsarlo, aparece un Toast.

---

### 2.2 Distribuir 20 % – 80 %

En tus exámenes piden “La zona de filtros ocupa un 20 % y la lista un 80 %”.  
Solución: `layout_weight`.

```xml
<LinearLayout ... orientation="vertical">
    <!-- filtros -->
    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="0dp"
        android:layout_weight="1"   <!-- 1 / (1+4) = 20 % -->
        android:orientation="horizontal">

        <EditText
            android:id="@+id/etNumero"
            android:layout_width="0dp"
            android:layout_height="wrap_content"
            android:layout_weight="1"
            android:inputType="number"
            android:hint="Nº"/>

        <Button
            android:id="@+id/btnFiltrar"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="Filtrar"/>
    </LinearLayout>

    <!-- lista -->
    <FrameLayout
        android:id="@+id/fContenedor"
        android:layout_width="match_parent"
        android:layout_height="0dp"
        android:layout_weight="4"/> <!-- 4 /(1+4)=80 % -->
</LinearLayout>
```

---

## 3. ConstraintLayout: imanes y gomas elásticas

*(explicación + ejemplo con positions)*

---

## 4. Controles básicos y eventos

| Control | XML rápido | Java event listener |
|---------|-----------|---------------------|
| Button | `<Button ... android:id="@+id/btn"/>` | `btn.setOnClickListener(v->{});` |
| EditText | `<EditText android:inputType="number"/>` | `et.getText().toString()` |
| Spinner | `<Spinner .../>` | `spinner.setOnItemSelectedListener(...)` |

*(sección con ejemplos de todos)*

---

## 5. Adaptadores y ListView

### 5.1 Definir la fila  
`item_pais.xml` con dos `TextView`.

### 5.2 Crear el `ArrayAdapter` (Java)

```java
public class PaisAdapter extends ArrayAdapter<Pais>{
    public PaisAdapter(Context c, List<Pais> datos){ super(c,0,datos);}
    @NonNull @Override
    public View getView(int pos, View v, ViewGroup parent){
        if(v==null) v=LayoutInflater.from(getContext())
                           .inflate(R.layout.item_pais,parent,false);
        TextView tvNom=v.findViewById(R.id.tvNombre);
        Pais p=getItem(pos);
        tvNom.setText(p.getNombre());
        return v;
    }
}
```

### 5.3 Enlazar en la Activity

```java
List<Pais> lista = ObtenerDatos.obtenerListaPaises(-1);
PaisAdapter adp = new PaisAdapter(this, lista);
listView.setAdapter(adp);
```

*(explica convertView, por qué mejora rendimiento)*

---

## 6. Mini‑examen práctico (5 puntos)

Reproduce el **Apartado 1 del Examen de Noviembre**:

1. Layout con filtros (20 %) + fragmento (80 %).  
2. `ListadoFragment` recupera la lista con `ObtenerDatos.obtenerListaPaises(limite)`.  
3. Filtrado al pulsar el botón.  
4. `Toast` que dice “Mostrando todos” cuando el campo está vacío.

**Solución detallada** incluida en el PDF final.

---
