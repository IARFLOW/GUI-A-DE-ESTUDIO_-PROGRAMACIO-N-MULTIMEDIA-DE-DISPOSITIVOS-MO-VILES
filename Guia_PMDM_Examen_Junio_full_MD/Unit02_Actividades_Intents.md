
# Unidad 2 – Actividades e Intents (Java)

## 2.1 Ciclo de vida rápido
```
onCreate → onStart → onResume
               ↑        |
onRestart ← onStop ← onPause
                        |
                     onDestroy
```
* **onCreate**: inflas layout, inicializas variables largas.  
* **onPause**: guardas preferencias rápidas.  
* **onStop**: liberas recursos pesados (hilos, sensor).  

## 2.2 Lanzar actividades

### startActivity (explícito)
```java
Intent i = new Intent(this, EditarPaisActivity.class);
startActivity(i);
```

### startActivityForResult (datos de ida y vuelta)
```java
Intent sel = new Intent(this, SelectorBanderaActivity.class);
startActivityForResult(sel, CODIGO_SELECCION);

@Override
protected void onActivityResult(int req, int res, Intent data) {
   if(req==CODIGO_SELECCION && res==RESULT_OK){
       String bandera = data.getStringExtra("bandera");
       etIdioma.setText(bandera);
   }
}
```

### Pasar objetos – implements Serializable
```java
intent.putExtra("pais", paisSeleccionado); // Pais implements Serializable
Pais p = (Pais) getIntent().getSerializableExtra("pais");
```

## 2.3 Menús

**activity_main.xml**  
```xml
<menu xmlns:android="http://schemas.android.com/apk/res/android">
    <item android:id="@+id/menu_add" android:title="Añadir"/>
    <item android:id="@+id/menu_exit" android:title="Salir"/>
</menu>
```

**Java**  
```java
@Override public boolean onCreateOptionsMenu(Menu menu){
    getMenuInflater().inflate(R.menu.activity_main, menu);
    return true;
}
@Override public boolean onOptionsItemSelected(MenuItem item){
   switch(item.getItemId()){
     case R.id.menu_add:
        startActivity(new Intent(this, EditarPaisActivity.class));
        return true;
     case R.id.menu_exit:
        finish();
        return true;
   }
   return super.onOptionsItemSelected(item);
}
```

## 2.4 Preguntas de examen y soluciones
| Pregunta | Código en 1 línea |
|----------|------------------|
| “Salir de la app” | `finishAffinity();` |
| “Mostrar Toast con nº registros” | `Toast.makeText(this, n + " registros", Toast.LENGTH_SHORT).show();` |
| “Validar campo vacío” | `if(et.getText().toString().isEmpty()){ et.setError("Obligatorio"); return; }` |
