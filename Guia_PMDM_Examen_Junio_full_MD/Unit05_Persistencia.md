
# Unidad 5 – Persistencia (Java)

## 5.1 SharedPreferences
*(ver código unidad anterior)*

## 5.2 Ficheros internos
```java
try(FileOutputStream fos = openFileOutput("notas.txt", MODE_PRIVATE)){
    fos.write("Hola".getBytes());
}
```

## 5.3 SQLiteOpenHelper
(ver plantilla)

## 5.4 Introducción a Room en Java
```java
@Entity
public class Contacto{
 @PrimaryKey(autoGenerate=true) public int id;
 public String nombre;
}

@Dao
public interface ContactoDao{
 @Insert void insert(Contacto c);
 @Query("SELECT * FROM Contacto") List<Contacto> getAll();
}

@Database(entities={Contacto.class}, version=1)
public abstract class AppDB extends RoomDatabase{
 public abstract ContactoDao contactoDao();
}
```
