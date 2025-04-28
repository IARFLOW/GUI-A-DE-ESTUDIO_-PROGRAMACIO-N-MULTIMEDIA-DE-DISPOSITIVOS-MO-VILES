
# Unidad 3 – Fragmentos y UI adaptativa

## 3.1 ¿Qué es un Fragment?
Módulo reutilizable de interfaz que vive dentro de una Activity.

Ventajas:
* Reutilizas la misma lógica en móvil (pantalla única) y tablet (pantalla doble).
* Ciclo de vida propio → puedes cambiar fragmentos sin recrear la activity.

## 3.2 Ciclo de vida esencial
`onAttach()` → `onCreate()` → `onCreateView()` → `onViewCreated()` → `onStart()` …

## 3.3 Ejemplo: Lista + Detalle

### XML para tablet `res/layout-sw600dp/activity_main.xml`
```xml
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:orientation="horizontal"
    android:layout_width="match_parent"
    android:layout_height="match_parent">

    <FrameLayout
        android:id="@+id/fList"
        android:layout_width="0dp"
        android:layout_height="match_parent"
        android:layout_weight="1"/>

    <FrameLayout
        android:id="@+id/fDetail"
        android:layout_width="0dp"
        android:layout_height="match_parent"
        android:layout_weight="2"/>
</LinearLayout>
```

### Comunicación (Java)
```java
public class ListaFragment extends ListFragment {
   public interface OnPaisClick { void onSelect(Pais p); }
   private OnPaisClick cb;
   public void onAttach(Context c){ super.onAttach(c); cb=(OnPaisClick)c; }
   public void onListItemClick(ListView l, View v, int pos, long id){
        cb.onSelect((Pais) l.getItemAtPosition(pos));
   }
}
```
En la Activity:
```java
public void onSelect(Pais p){
   if(findViewById(R.id.fDetail) != null){ // tablet
       getSupportFragmentManager().beginTransaction()
         .replace(R.id.fDetail, DetalleFragment.newInstance(p))
         .commit();
   } else { // móvil
       Intent i = new Intent(this, DetalleActivity.class);
       i.putExtra("pais", p);
       startActivity(i);
   }
}
```

*(Resto de unidad incluye manejo de backStack y diálogo de confirmación)*
