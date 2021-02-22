import psycopg2
import time
import os

user = os.getenv("user")
password = os.getenv("password")

con = psycopg2.connect(database="student", user=user,
                       password=password, host="127.0.0.1", port="5432")

print("Database opened successfully")

cur = con.cursor()


def insert_values(cur):
    cur.execute('''CREATE TABLE CUSTOMER3
           (ID INT PRIMARY KEY     NOT NULL,
           Name           TEXT    NOT NULL,
           Address            TEXT     NOT NULL,
           review        TEXT,
           Blink_id INT NOT NULL,
           Korean_level INT NOT NULL);''')
    print("Table created successfully")
    names_list = ['mark', 'kim', 'roze', 'jenny', 'lisa']
    address = 'Seoul'
    review = 'Seoul'
    for i in range(100000):
        print(i)
        cur.execute("INSERT INTO CUSTOMER3 (ID,Name,Address,review, blink_id, korean_level) VALUES ('"+ str(i)+"','"+names_list[i % len(names_list)]+"','"+address+ str(i)+"','"+review+str(i)+"','"+str(i)+"','"+str(i)+"')")
        con.commit()


def create_b_tree(cur, field):
    cur.execute(f'''CREATE UNIQUE INDEX customer_idx ON CUSTOMER3 USING btree ({field})''')


def test(cur, field, method):
    start_time = time.time()
    cur.execute(f'''EXPLAIN analyze SELECT {field} FROM CUSTOMER3 WHERE CUSTOMER3.{field}>30;''')
    work_time = time.time() - start_time
    print(f"{method} work time for more operation{work_time}")
    start_time = time.time()
    cur.execute(f'''EXPLAIN analyze SELECT {field} FROM CUSTOMER3 WHERE CUSTOMER3.{field}<99970;''')
    work_time = time.time() - start_time
    print(f"{method} work time for less operation{work_time}")
    start_time = time.time()
    cur.execute(f'''EXPLAIN analyze SELECT {field} FROM CUSTOMER3 WHERE CUSTOMER3.{field}=50074;''')
    work_time = time.time() - start_time
    print(f"{method} work time for equals operation{work_time}")


def create_hash(cur, field):
    cur.execute(f'''CREATE INDEX customer_idx ON CUSTOMER3 USING hash ({field}) ''')


# insert_values(cur)
# create_b_tree(cur, "Blink_id")
# create_hash(cur, 'korean_level')
# test(cur, "Blink_id", 'B-tree')
# test(cur, 'korean_level', 'Hash')


"""
output:
B-tree work time for more operation0.016452312469482422
B-tree work time for less operation0.016196727752685547
B-tree work time for equals operation0.007922887802124023
Hash work time for more operation0.016266584396362305
Hash work time for less operation0.01629781723022461
Hash work time for equals operation0.00023746490478515625

So, hashes a bit faster
"""
