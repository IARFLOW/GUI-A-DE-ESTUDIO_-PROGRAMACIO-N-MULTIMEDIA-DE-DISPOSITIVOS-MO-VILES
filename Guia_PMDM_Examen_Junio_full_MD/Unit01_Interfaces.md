
# Unidad 1 – Diseño de Interfaces (Java)

> Sácale 5 puntos al examen dominando layouts y controles.

## 1.1 ¿Qué es un layout?
Un **layout** es el archivo XML donde decides cómo se colocan los botones, textos e imágenes.  
Piensa en él como el plano de una casa: primero eliges el tipo de plano (LinearLayout, ConstraintLayout…) y después colocas los muebles (Views).

### Tipos mínimos que exige tu profesor

| Layout | ¿Cuándo usarlo? | Atributo clave |
|--------|-----------------|----------------|
| `LinearLayout` | Pila vertical/horizontal sencilla. | `android:orientation` |
| `RelativeLayout` | Posicionar controles relativamente (legacy). | `layout_below`, `layout_toRightOf` |
| `ConstraintLayout` | Diseños modernos flexibles. | `app:layout_constraint*` |
| `FrameLayout` | Contenedor para un único hijo o para alojar **Fragmentos**. | — |

### Ejemplo completo – Filtrar países (examen noviembre)
*(layout filtradores + lista)*  
```xml
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical">

    <!-- Filtros -->
    <LinearLayout
        android:layout_width="match_parent"
        android:layout_height="0dp"
        android:layout_weight="1"
        android:orientation="horizontal"
        android:padding="8dp">

        <EditText
            android:id="@+id/etNumero"
            android:layout_width="0dp"
            android:layout_height="wrap_content"
            android:layout_weight="1"
            android:inputType="number"
            android:hint="Nº de países"/>

        <Button
            android:id="@+id/btnFiltrar"
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:text="Filtrar"/>
    </LinearLayout>

    <!-- Donde va el fragmento de la lista -->
    <FrameLayout
        android:id="@+id/contenedorFragment"
        android:layout_width="match_parent"
        android:layout_height="0dp"
        android:layout_weight="4"/>
</LinearLayout>
```

#### Conectar XML ↔ Java
```java
btnFiltrar.setOnClickListener(v -> {
    int n = etNumero.getText().toString().isEmpty() ? -1 :
            Integer.parseInt(etNumero.getText().toString());
    ListadoFragment frag = new ListadoFragment();
    Bundle args = new Bundle();
    args.putInt("limite", n);
    frag.setArguments(args);
    getSupportFragmentManager().beginTransaction()
            .replace(R.id.contenedorFragment, frag)
            .commit();
});
```

## 1.2 Controles básicos imprescindibles

| Control | Atributos útiles | Ejemplo en examen |
|---------|-----------------|-------------------|
| `EditText` | `inputType`, `hint`, `text` | Campo número de países |
| `Button`   | `text`, `onClick` (XML o Java) | Botón “Filtrar” |
| `ImageButton` | `src`, `contentDescription` | Botón cambiar bandera |
| `Spinner`  | usa `ArrayAdapter` | Selector de idioma |

---  
### Práctica guiada
1. Crea un proyecto vacío **Java**.  
2. Copia el XML anterior.  
3. Implementa el `OnClickListener`.  
4. Comprueba que `limite=-1` muestra todos los países.

Cuando funcione, habrás completado el **Apartado 1 (5 pts)** del examen de noviembre.
