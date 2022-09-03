from faker import Faker
from random import randint
from random import choice
import psycopg2

fake = Faker()

try:
    connection = psycopg2.connect(
        host="localhost", user="postgres", password="postgres", database="Aerolinea")
    cursor = connection.cursor()

    ###### Delete ######
    # Delete all rows from table
    cursor.execute("TRUNCATE TABLE avion CASCADE")
    cursor.execute("TRUNCATE TABLE clase CASCADE")
    cursor.execute("TRUNCATE TABLE cliente CASCADE")
    cursor.execute("TRUNCATE TABLE compania CASCADE")
    cursor.execute("TRUNCATE TABLE compra CASCADE")
    cursor.execute("TRUNCATE TABLE empleado_vuelo CASCADE")
    cursor.execute("TRUNCATE TABLE modelo CASCADE")
    cursor.execute("TRUNCATE TABLE pasaje CASCADE")
    cursor.execute("TRUNCATE TABLE sueldo CASCADE")
    cursor.execute("TRUNCATE TABLE empleado CASCADE")
    cursor.execute("TRUNCATE TABLE vuelo CASCADE")
    cursor.execute("TRUNCATE TABLE vuelo_cliente CASCADE")
    connection.commit()

    print('Datos de tablas existentes eleminadas')
    
    ###### Insert ######

    ### CLIENTE
    for k in range(20):
        cursor.execute("INSERT INTO cliente (id_cliente, nombre, dni, pais, id_vuelo) VALUES(%s,%s,%s,%s,%s)", (k, fake.name(), fake.ean(length=8), fake.country(), randint(0,20)))

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
            "INSERT INTO compania (id_compania, nombre, id_cliente, fecha) VALUES(%s,%s,%s,%s)", (id, k, randint(0,19), fake.date()))
        id += 1
    
    ### AVION
    id = 0
    for k in range(20):
        cursor.execute(
            "INSERT INTO avion (id_avion, id_modelo, capacidad, id_compañia)  VALUES(%s,%s,%s,%s)", (id, randint(0,4), randint(100, 500), randint(0,4)))
        id += 1
        
    # EMPLEADO
    id = 0
    for k in range(40):
        cursor.execute(
            "INSERT INTO empleado (id_empleado, dni, nombre, id_compania, id_avion, cargo) VALUES(%s,%s,%s,%s,%s,%s)", (k, fake.ean(length=8), fake.name(), randint(0,4), randint(0,19), choice(["Piloto", "Azafata", "Jefe de vuelo", "Jefe de mantenimiento", "Mantenimiento"])))
        id += 1

    # PASAJE
    id = 0
    for k in range(20):
        cursor.execute(
            "INSERT INTO pasaje(id_pasaje, id_clase, valor) VALUES(%s,%s,%s)", (id, randint(0,3), randint(100, 500)))
        id += 1

    # VUELO
    id = 0
    for k in range(20):
        cursor.execute(
            "INSERT INTO vuelo(id_vuelo, embarque, id_pasaje, pais_destino, pais_origen) VALUES(%s,%s,%s,%s,%s)", (id, fake.date(), randint(0,19), fake.country(), fake.country()))
        id += 1

    # sueldo
    id = 0
    for k in range(40):
        cursor.execute(
            "INSERT INTO sueldo(id_empleado, monto, fecha) VALUES(%s,%s,%s)", (id, randint(100, 500), fake.date()))
        id += 1
    
    # compra
    id = 0
    for k in range(20):
        cursor.execute(
            "INSERT INTO compra(monto, fecha, id_compra, id_cliente, id_pasaje) VALUES(%s,%s,%s,%s,%s)", (randint(100, 500), fake.date(), id, randint(0,19), randint(0,19)))
        id += 1
    
    # empleado_vuelo(id_empleado, id_vuelo)

    # vuelo_cliente(id_vuelo, id_cliente)

    connection.commit()
    print('Base de datos rellenada con nuevos datos')

except Exception as e:
    print(e)
