
# Unidad 4 – Hilos, Conectividad y REST (Java)

## 4.1 Por qué usar hilos
Android aborta accesos de red en el hilo principal ⇒ `NetworkOnMainThreadException`.

### AsyncTask plantilla
```java
class DescargaTask extends AsyncTask<String, Void, String>{
   protected String doInBackground(String... url){
        try(InputStream is = new URL(url[0]).openStream()){
            return new String(is.readAllBytes());
        }catch(Exception e){ return ""; }
   }
   protected void onPostExecute(String r){ textView.setText(r); }
}
```
Uso: `new DescargaTask().execute("https://api.ejemplo.com/data");`

## 4.2 OKHttp
(ver plantilla en guía previa)

## 4.3 Verbos REST
| Verbo | Para qué sirve | Ejemplo Spring Boot |
|-------|----------------|---------------------|
| GET | Listar/obtener | `@GetMapping("/paises")` |
| POST | Crear | `@PostMapping("/paises")` |
| PUT | Modificar | `@PutMapping("/paises/{id}")` |
| DELETE | Borrar | `@DeleteMapping("/paises/{id}")` |
