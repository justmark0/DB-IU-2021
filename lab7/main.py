# Task 1
import psycopg2
from geopy.geocoders import Nominatim
geolocator = Nominatim(user_agent="db_assignment")

conn = psycopg2.connect(
    host="localhost",
    database="dvdrental",
    user="postgres",
    password="postgres")
cur = conn.cursor()

# SQL function
"""
CREATE OR REPLACE FUNCTION retreive_addresses()
RETURNS TABLE(address VARCHAR(50), address2 VARCHAR(50)) AS
$$
BEGIN
RETURN QUERY
SELECT address.address, address.address2 FROM address
WHERE address.address_id > 400 AND address.address_id < 600
AND (address.address LIKE '%11%' OR address.address2 LIKE '%11%');
END; 
$$
LANGUAGE plpgsql;
"""

cur.execute("SELECT * FROM retreive_addresses()")
records = cur.fetchall()

for rec in records:
    addr, addr2 = rec
    long, lati = 0, 0
    if addr is not None:
        location = geolocator.geocode(addr)
        if location is not None:
            long, lati = location.latitude, location.longitude
    if long == 0 and lati == 0 and addr2 is not None:
        location = geolocator.geocode(addr2)
        if location is not None:
            long, lati = location.latitude, location.longitude
    print(long, lati) # Pront the longitude and latitude in console

cur.close()
conn.close()
