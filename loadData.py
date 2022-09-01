from faker import Faker
from random import randint
from random import choice
import psycopg2

fake = Faker()

try:
    connection = psycopg2.connect(
        host="localhost", user="postgres", password="postgres", database="Aerolineas2")
    cursor = connection.cursor()

    ###### Delete ######
    # Delete all rows from table
    cursor.execute("TRUNCATE TABLE avion CASCADE")
    cursor.execute("TRUNCATE TABLE clase CASCADE")
    cursor.execute("TRUNCATE TABLE cliente CASCADE")
    cursor.execute("TRUNCATE TABLE compania CASCADE")
    cursor.execute("TRUNCATE TABLE compra CASCADE")
    cursor.execute("TRUNCATE TABLE empleado CASCADE")
    cursor.execute("TRUNCATE TABLE modelo CASCADE")
    cursor.execute("TRUNCATE TABLE pais CASCADE")
    cursor.execute("TRUNCATE TABLE viaje CASCADE;")
    cursor.execute("TRUNCATE TABLE vuelo CASCADE")
    connection.commit()

    print('Datos de tablas existentes eleminadas')
    
    ###### Insert ######

    ### PAIS
    for k in range(21):
        cursor.execute(
            "INSERT INTO pais (nombre, id_pais) VALUES(%s,%s)", (fake.country(), k))

    ### CLIENTE
    for k in range(20):
        cursor.execute("INSERT INTO cliente (id_cliente, nombre, id_pais, dni) VALUES(%s,%s,%s,%s)",(k, fake.name(), randint(0, 20), fake.ean(length=8)))

    ### CLASE
    listaclases = ["Economy", "Premium economy", "Business", "First class"]
    id = 0
    for k in listaclases:
        cursor.execute(
            "INSERT INTO clase (id_clase, nombre) VALUES(%s,%s)", (id, k))
        id += 1

    ### MODELO (de AVION)
    listamodelos = ["Boeing 737", "Boeing 747","Airbus 319", "Airbus 320", "Airbus 321"]
    id = 0
    for k in listamodelos:
        cursor.execute(
            "INSERT INTO modelo (id_modelo, nombre) VALUES(%s,%s)", (id, k))
        id += 1

    ### COMPAÑIAS
    listacompanias = ["LATAM Airlines", "Sky Airline", "JetSmart", "United Airlines", "American Airlines", "Air France"]
    id = 0
    for k in listacompanias:
        cursor.execute(
            "INSERT INTO compania (id_compania, nombre) VALUES(%s,%s)", (id, k))
        id += 1
    
    ### AVION
    id = 0
    for k in range(20):
        cursor.execute(
            "INSERT INTO avion (id_avion, id_modelo, id_compania, capacidad) VALUES(%s,%s,%s,%s)", (id, randint(0, len(listamodelos)-1), randint(0, len(listacompanias)-1), randint(160, 480)))
        id += 1
        
    # EMPLEADO
    id = 0
    for k in range(40):
        cursor.execute(
            "INSERT INTO empleado (id_empleado, dni, nombre, sueldo,id_compania) VALUES(%s,%s,%s,%s,%s)", (id, fake.ean(length=8), fake.name(), randint(1000, 8000), randint(0, len(listacompanias)-1)))
        id += 1
        
    # VUELO
    id = 0
    for k in range(20):
        cursor.execute(
            "INSERT INTO vuelo (id_vuelo,embarque,id_origen, id_destino) values(%s,%s,%s,%s)", (id, fake.date_time_between(start_date="-5y", end_date="now", tzinfo=None), randint(0, len(listacompanias)-1), randint(0, len(listacompanias)-1)))
        id += 1

    # PASAJE
    id = 0
    for k in range(20):
        cursor.execute(
            "INSERT INTO pasaje (id_pasaje, id_viaje, id_clase) values(%s,%s,%s)", (id, randint(0, 19), randint(0, len(listaclases)-1)))
        id += 1

    # COMPRA
    id = 0
    for k in range(20):
        cursor.execute(
            "INSERT INTO compra (id_compra, monto, fecha , id_cliente, id_pasaje) values(%s,%s,%s,%s,%s)", (id, randint(1000, 8000), fake.date_time_between(start_date="-5y", end_date="now", tzinfo=None), randint(0, 19), randint(0, 19)))
        id += 1

    # VIAJE
    id = 0
    for k in range(20):
        cursor.execute(
            "INSERT INTO viaje (id_viaje, id_pasaje, id_vuelo) values(%s,%s,%s)", (id, randint(0, 19), randint(0, 19)))
        id += 1

    # log_vuelo_avion

    # log_vuelo_empleado

    connection.commit()
    print('Base de datos rellenada con nuevos datos')

except Exception as e:
    print(e)
