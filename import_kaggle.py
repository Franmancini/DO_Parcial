import json
import zipfile
import os

api_token= {"username":"francomancini","key":"45f832ce6b8476d1ba14a72edccc28c3"}

#Conectar a kaggle
with open('C:/Users/usuario/.kaggle/kaggle.json','w') as file:
    json.dump(api_token, file)

location = 'C:/Users/usuario/Desktop/DataOPS/proyecto_parcial/dataset'

#Validar que la carpeta existe:
if not os.path.exists(location):
    #sino existe la creo
    os.mkdir(location)
else:
    #Si la carpeta si existe, entonces borro su contenido
    for root, dirs, files in os.walk(location, topdown=False):
        for name in files:
            os.remove(os.path.join(root,name)) #elimino todos los archivos
        for name in dirs:
            os.rmdir(os.path.join(root,name)) #elimino todas las carpetas

#descargar dataset de kaggle 
os.system('kaggle datasets download -d henryshan/starbucks -p C:/Users/usuario/Desktop/DataOPS/proyecto_parcial/dataset')

#descomprimir el archivo kaggle
os.chdir(location) 
for file in os.listdir():
    zip_ref = zipfile.ZipFile(file,'r') #lee archivo .zip
    zip_ref.extractall() #extrae archivo .zip
    zip_ref.close() #cierra archivo
    
