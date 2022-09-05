from faker import Faker
from random import randint
from random import choice
from random import sample
import psycopg2

fake = Faker()

try:
    connection = psycopg2.connect(
        host="localhost", user="postgres", password="postgres", database="aero2")
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
    cursor.execute("TRUNCATE TABLE vuelo CASCADE")
    cursor.execute("TRUNCATE TABLE cargo CASCADE")
    cursor.execute("TRUNCATE TABLE pago CASCADE")
    cursor.execute("TRUNCATE TABLE empleado_cargo CASCADE")
    cursor.execute("TRUNCATE TABLE vuelo_avion CASCADE")
    cursor.execute("TRUNCATE TABLE vuelo_empleado CASCADE")
    connection.commit()

    print('Datos de tablas existentes eleminadas')
    
    ###### Insert ######

    ### PAIS
    for k in range(21):
        cursor.execute(
            "INSERT INTO pais (nombre, id) VALUES(%s,%s)", (fake.country(), k))

    ### CLIENTE
    for k in range(20):
        cursor.execute("INSERT INTO cliente (id, nombre, id_pais, dni) VALUES(%s,%s,%s,%s)",(k, fake.name(), randint(0, 20), fake.ean(length=8)))


    ### CLASE
    listaclases = ["Economy", "Premium economy", "Business", "First class"]
    id = 0
    for k in listaclases:
        cursor.execute(
            "INSERT INTO clase (id, nombre) VALUES(%s,%s)", (id, k))
        id += 1

    
    ### MODELO (de AVION)
    listamodelos = ["Boeing 737", "Boeing 747","Airbus 319", "Airbus 320", "Airbus 321"]
    id = 0
    for k in listamodelos:
        cursor.execute(
            "INSERT INTO modelo (id, nombre) VALUES(%s,%s)", (id, k))
        id += 1

    
    ### COMPAÑIAS
    listacompanias = ["LATAM Airlines", "Sky Airline", "JetSmart", "United Airlines", "American Airlines", "Air France"]
    id = 0
    for k in listacompanias:
        cursor.execute(
            "INSERT INTO compania (id, nombre) VALUES(%s,%s)", (id, k))
        id += 1
    
    ### AVION
    id = 0
    for k in range(20):
        cursor.execute(
            "INSERT INTO avion (id, id_modelo, id_compania, capacidad,dia,mes,anno) VALUES(%s,%s,%s,%s,%s,%s,%s)", (id, randint(0, len(listamodelos)-1), randint(0, len(listacompanias)-1), randint(160, 480),randint(1, 31), randint(1, 12), randint(1970, 2020)))
        id += 1
        
     # cargos
    cargos = ["piloto","mecanico","asafata"]
    id = 0
    for k in range(3):
        cursor.execute(
            "INSERT INTO cargo (id, nombre) values(%s,%s)", (id, cargos[id]))
        id += 1

    cantidadempleados = -1
    # EMPLEADO
    id = 0
    for k in range(40):
        cantidadempleados+=1
        cursor.execute(
            "INSERT INTO empleado (id, dni, nombre, sueldo,id_compania,id_cargo,dia,mes,anno) VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s)", (id, fake.ean(length=8), fake.name(), randint(1000, 8000), randint(0, len(listacompanias)-1),randint(0, len(cargos)-1), randint(1, 31), randint(1, 12), randint(1970, 2022)))
        id += 1


     ### PAGO
    for k in range(200):
        cursor.execute("INSERT INTO pago (id, id_empleado, monto, dia, mes, anno) VALUES(%s,%s,%s,%s,%s,%s)",(k, randint(0, 20), randint(100, 5000), randint(1, 31), randint(1, 12), randint(1970, 2022)))


    cantidadvuelos=-1
    # VUELO
    id = 0
    for k in range(20):
        cantidadvuelos+=1
        cursor.execute(
            "INSERT INTO vuelo (id,id_origen, id_destino,dia,mes,anno) values(%s,%s,%s,%s,%s,%s)", (id, randint(0, 20), randint(0, 20), randint(1, 31), randint(1, 12), randint(1970, 2022)))
        id += 1

    id = 0
    def unico(x,L):
      esUnico=True
      for i in range(len(L)):
        if x==L[i]:
          esUnico=False
          break
      return esUnico
    
    L=[]
    j=0
    while j<20:
      x=randint(0,19)
      if unico(x,L):
        L.append(x)
        j+=1
    
    
    
    # PASAJE
    id = 0
    for k in range(20):
        cursor.execute(
            "INSERT INTO pasaje (id,id_vuelo, id_clase) values(%s,%s,%s)", (id, L[k], randint(0, len(listaclases)-1)))
        id += 1

    
   

    # COMPRA
    
    L=[]
    j=0
    while j<20:
      x=randint(0,19)
      if unico(x,L):
        L.append(x)
        j+=1
    
    for k in range(20):
        cursor.execute(
            "INSERT INTO compra (id, monto, id_cliente, id_pasaje,dia,mes,anno) values(%s,%s,%s,%s,%s,%s,%s)", (id, randint(1000, 8000),randint(0, 19),L[k] ,randint(1, 31), randint(1, 12), randint(1970, 2022)))
        id += 1


   
    # log_vuelo_avion
    L=[]
    j=0
    while j<20:
      x=randint(0,19)
      if unico(x,L):
        L.append(x)
        j+=1
 
    
    L2=[]
    j=0
    while j<20:
      x=randint(0,19)
      if unico(x,L2):
        L2.append(x)
        j+=1

    id = 0
    for k in range(20):
        cursor.execute(
            "INSERT INTO vuelo_avion (id, id_vuelo, id_avion) values(%s,%s,%s)", (id,L[k], L2[k]))
        id += 1


    
    #log_vuelo_empleado
    id = 0
    for k in range(20):
        cursor.execute(
            "INSERT INTO vuelo_empleado (id, id_vuelo, id_empleado) values(%s,%s,%s)", (id, randint(0, cantidadvuelos), randint(0, cantidadempleados)))
        id += 1


    # log_empleado_cargo
    id = 0
    for k in range(20):
        cursor.execute(
            "INSERT INTO empleado_cargo (id, id_empleado, id_cargo) values(%s,%s,%s)", (id, randint(0, cantidadempleados), randint(0,2)))
        id += 1

    
    connection.commit()
    print('Base de datos rellenada con nuevos datos')

except Exception as e:
    print(e)
