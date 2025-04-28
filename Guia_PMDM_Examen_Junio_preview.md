
# Guía completa PMDM – **Java** para Examen de Junio

> **Propósito**: Esta versión abreviada sirve para comprobar que el enlace de descarga funciona.  
> El documento completo (≈ 80 páginas) se subirá en bloques para evitar expiración.

## Contenido de la versión abreviada

1. Estrategia de estudio
2. Unidad 1 – Diseño de interfaces  
3. Unidad 2 – Actividades e Intents  
4. Unidad 3 – Fragmentos  
5. Unidad 4 – Hilos y REST  
6. Unidad 5 – Persistencia  
7. Unidad 6 – Permisos y Depuración  
8. Exámenes resueltos (referencia)

---

### Ejemplo de código Java (ListView + ArrayAdapter)

```java
public class PaisAdapter extends ArrayAdapter<Pais> {
    public PaisAdapter(Context c, List<Pais> datos) { super(c, 0, datos); }
    @NonNull
    @Override public View getView(int pos, View v, ViewGroup parent) {
        if (v == null)
            v = LayoutInflater.from(getContext())
                              .inflate(R.layout.item_pais, parent, false);
        TextView tvNombre = v.findViewById(R.id.tvNombre);
        TextView tvCapital = v.findViewById(R.id.tvCapital);
        Pais p = getItem(pos);
        tvNombre.setText(p.getNombre());
        tvCapital.setText(p.getCapital());
        return v;
    }
}
```

Comprueba que puedes descargar este MD; luego subo el paquete completo dividido por unidades.
