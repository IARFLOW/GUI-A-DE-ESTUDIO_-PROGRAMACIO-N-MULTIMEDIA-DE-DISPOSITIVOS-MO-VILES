
# Unidad 6 – Permisos, Depuración y Publicación

## 6.1 Permisos (API 23+)
Declarar en AndroidManifest:
```xml
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
```
Comprobar en tiempo de ejecución:
```java
if(ContextCompat.checkSelfPermission(this,
        Manifest.permission.READ_EXTERNAL_STORAGE)
        != PackageManager.PERMISSION_GRANTED){
    ActivityCompat.requestPermissions(this,
        new String[]{Manifest.permission.READ_EXTERNAL_STORAGE}, 123);
}
```

## 6.2 Depurar
* `Log.d("PMDM", "valor=" + x);`
* Breakpoint F8 (Step Over), F7 (Step Into).

## 6.3 Generar APK firmado
`Build > Generate Signed Bundle / APK` → crea keystore → rellena `versionCode`.

