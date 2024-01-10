use kaggle
go
--crear la estructura de nuestra tabla
IF NOT EXISTS (SELECT * FROM SYS.TABLES WHERE object_id=OBJECT_ID(N'dbo.starbucks') AND type='U') 
create table dbo.starbucks (
			beverage_category VARCHAR(50),
			beverage VARCHAR(100),
			beverage_prep VARCHAR(50),
			calories DECIMAL (6,3),
			total_fat_g VARCHAR(10),
			trans_fat_g DECIMAL(6,3).
			saturated_fat_g DECIMAL(6,3),
			sodium_mg DECIMAL(6,3),
			total_carbohydrates_g DECIMAL(6,3),
			cholesterol_mg DECIMAL (6,3),
			dietary_fibre_g DECIMAL (6,3),
			sugar_g DECIMAL (6,3),
			protein_g DECIMAL (6,3),
			vitamin_a_pct VARCHAR(10),
			vitamin_c_pct VARCHAR(10),
			calcium_pct VARCHAR(10),
			iron_pct VARHCAR(10),
			caffeine_mg VARCHAR(10),
)
--limpiar la tabla si ya existe 
TRUNCATE TABLE dbo.starbucks;
--importar data desde archivo csv
BULK INSERT dbo.starbucks
FROM 'C:\Users\usuario\Desktop\DataOPS\proyecto_parcial\dataset'
WITH(
	FIRSTROW = 2, --EMPIEZA EN LA SEGUNDA FILA PORQ LA PRIMERA ES LA CABECERA
	FIELDTERMINATOR = ',', --INDICAMOS SEPARADOR DE COLUMNAS 
	ROWTERMINATOR = 'Ox0a' --hace referencia a un salto de linea

)
go
