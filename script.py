from faker import Faker
from random import randint
from random import choice

fake = Faker()

###PAIS
paises = ""
for k in range(21):
    paises += "INSERT INTO pais (nombre, id_pais) values ('{}','{}') ;\n".format(fake.country(), k)
print(paises)

###CLIENTE
clientes = ""
for k in range(20):
    clientes += "INSERT INTO cliente (id_cliente, nombre, id_pais, dni) values ('{}','{}','{}','{}');\n".format(k, fake.name(), randint(0,20), fake.ean(length=8))
print(clientes)

###CLASE
listaclases = ["Economy", "Premium economy", "Business" , "First class"]
clases = ""
id = 0
for k in listaclases:
    clases += "INSERT INTO clase (id_clase, nombre) values ('{}','{}');\n".format(id, k)
    id+=1
print(clases)

###MODELO (de AVION)
listamodelos = ["Boeing 737", "Boeing 747", "Airbus 319", "Airbus 320", "Airbus 321"]
modelos = ""
id = 0
for k in listamodelos:
    modelos += "INSERT INTO modelo (id_modelo, nombre) values ('{}','{}');\n".format(id, k)
    id+=1
print(modelos)

###COMPAÑIAS
listacompanias = ["LATAM Airlines", "Sky Airline", "JetSmart", "United Airlines", "American Airlines", "Air France"]
companias = ""
id = 0
for k in listacompanias:
    companias += "INSERT INTO compania (id_compania, nombre) values ('{}','{}');\n".format(id, k)
    id+=1
print(companias)

###AVION
aviones = ""
id = 0
for k in range(20):
    aviones += "INSERT INTO avion (id_avion, id_modelo, id_compania, capacidad) values ('{}','{}','{}','{}');\n".format(k, randint(0, len(listamodelos)-1), randint(0, len(listacompanias)-1), randint(160, 480))
    id+=1
print(aviones)

###EMPLEADO
empleados = ""
id = 0
for k in range(40):
    empleados += "INSERT INTO empleado (id_empleado, dni, nombre, sueldo) values ('{}','{}','{}','{}');\n".format(k, fake.ean(length=8), fake.name(), randint(1000, 8000))
    id+=1
print(empleados)

###VUELO
vuelos = ""
id = 0
for k in range(20):
    vuelos += "INSERT INTO vuelo (id_vuelo, embarque, id_origen, id_destino) values ('{}','{}','{}','{}');\n".format(id, fake.date_time_between(start_date="-1y", end_date="now", tzinfo=None), randint(0, len(listamodelos)-1), randint(0, len(listacompanias)-1))
    id+=1
print(vuelos)

###PASAJE
pasajes = ""
id = 0
for k in range(20):
    pasajes += "INSERT INTO pasaje (id_pasaje, id_viaje, id_clase) values ('{}','{}','{}');\n".format(
        id, randint(0, 19), randint(0, len(listaclases)-1))
    id += 1
print(pasajes)


###COMPRA

compra = ""
id = 0
for k in range(20):
    compra += "INSERT INTO compra (id_compra, monto, fecha , id_cliente, id_pasaje) values ('{}','{}','{}','{}','{}');\n".format(id, randint(1000, 8000), fake.date(), randint(0, 19), randint(0, 19))
    id+=1
print(compra) 


###log_vuelo_avion

###log_vuelo_empleado


#JUNTAR_TODO
with open("scriptAerolinea.sql", "w", errors="ignore") as f:
    f.write(paises)

