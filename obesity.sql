CREATE DATABASE obesity;
USE  obesity;
-- DROP TABLE obesitydataset;
CREATE TABLE obesitydataset (
id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
gender CHAR(10) NOT NULL,
age INT NOT NULL,
height DOUBLE(10,2) NOT NULL,
weight DOUBLE(10,2) NOT NULL,
family_history_with_overweight CHAR(5) NOT NULL,
favc CHAR(5) NOT NULL,
fcvc INT NOT NULL,
ncp INT NOT NULL,
caec CHAR(30) NOT NULL,
smoke CHAR(5) NOT NULL,
ch20 INT NOT NULL,
scc CHAR(5) NOT NULL,
faf INT NOT NULL,
tue INT NOT NULL,
calc CHAR(30) NOT NULL,
mtrans CHAR(30) NOT NULL,
nobeyesdad CHAR(30) NOT NULL
);

# Relación entre el número de comidas al día y los diferentes niveles de peso:
        SELECT 
            ncp, 
            nobeyesdad, 
            COUNT(*) * 100.0 / (SELECT COUNT(*) FROM obesitydataset) AS porcentaje
        FROM obesitydataset
        GROUP BY ncp, nobeyesdad;
    
    # Influencia del ejercicio físico (faf) en los diferentes niveles de peso:
        SELECT 
            faf, 
            nobeyesdad, 
            COUNT(*) * 100.0 / (SELECT COUNT(*) FROM obesitydataset) AS porcentaje
        FROM obesitydataset
        GROUP BY faf, nobeyesdad;
    
    # Uso de transporte (mtrans) y los diferentes niveles de peso:
        SELECT 
            mtrans, 
            nobeyesdad, 
            COUNT(*) * 100.0 / (SELECT COUNT(*) FROM obesitydataset) AS porcentaje
        FROM obesitydataset
        GROUP BY mtrans, nobeyesdad;
    
    # Consumo de alcohol (calc) y los diferentes niveles de peso:
        SELECT 
            calc, 
            nobeyesdad, 
            COUNT(*) * 100.0 / (SELECT COUNT(*) FROM obesitydataset) AS porcentaje
        FROM obesitydataset
        GROUP BY calc, nobeyesdad;
    
    # Antecedentes familiares de sobrepeso (family_history_with_overweight) y los diferentes niveles de peso:
        SELECT 
            family_history_with_overweight, 
            nobeyesdad, 
            COUNT(*) * 100.0 / (SELECT COUNT(*) FROM obesitydataset) AS porcentaje
        FROM obesitydataset
        GROUP BY family_history_with_overweight, nobeyesdad;
    
    # Relación entre el consumo de agua diaria (ch20) y los niveles de peso:
        SELECT 
            ch20, 
            nobeyesdad, 
            COUNT(*) * 100.0 / (SELECT COUNT(*) FROM obesitydataset) AS porcentaje
        FROM obesitydataset
        GROUP BY ch20, nobeyesdad;
    
    # Relación entre el consumo de snacks (caec) y los niveles de peso:
        SELECT 
            caec, 
            nobeyesdad, 
            COUNT(*) * 100.0 / (SELECT COUNT(*) FROM obesitydataset) AS porcentaje
        FROM obesitydataset
        GROUP BY caec, nobeyesdad;
    
    # Relación entre el uso de transporte público o caminar (mtrans) y el nivel de actividad física (faf):
        SELECT 
            mtrans, 
            faf, 
            COUNT(*) * 100.0 / (SELECT COUNT(*) FROM obesitydataset) AS porcentaje
        FROM obesitydataset
        GROUP BY mtrans, faf;
    
    # Impacto de la autopercepción del consumo de calorías (scc) en los niveles de peso:
        SELECT 
            scc, 
            nobeyesdad, 
            COUNT(*) * 100.0 / (SELECT COUNT(*) FROM obesitydataset) AS porcentaje
        FROM obesitydataset
        GROUP BY scc, nobeyesdad;

    # Distribución de género (gender) en relación con los niveles de peso:
        SELECT 
            gender, 
            nobeyesdad, 
            COUNT(*) * 100.0 / (SELECT COUNT(*) FROM obesitydataset) AS porcentaje
        FROM obesitydataset
        GROUP BY gender, nobeyesdad;
        
    # Edad promedio de las personas en cada nivel de peso:
        SELECT 
            nobeyesdad, 
            AVG(age) AS edad_promedio
        FROM obesitydataset
        GROUP BY nobeyesdad;
        
    # Altura promedio y peso promedio en cada nivel de peso:
        SELECT 
            nobeyesdad, 
            AVG(height) AS altura_promedio, 
            AVG(weight) AS peso_promedio
        FROM obesitydataset
        GROUP BY nobeyesdad;
        
    # Relación entre el tiempo usando tecnología (tue) y los niveles de peso:
        SELECT 
            nobeyesdad, 
            AVG(tue) AS promedio_tue
        FROM obesitydataset
        GROUP BY nobeyesdad;