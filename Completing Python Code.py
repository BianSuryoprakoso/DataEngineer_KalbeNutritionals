# Melakukan import mysql connector
import mysql.connector

# Melakukan percobaan koneksi
conn = mysql.connector.connect(
    user = 'username', password = 'password', host="localhost", database="db_name"
)

# Membuat object cursor sebagai penanda
cursor = conn.cursor()

# Deklarasi SQL Query untuk memasukkan record ke DB (KARYAWAN)
insert_sql = (
    "INSERT INTO KARYAWAN (FIRST_NAME, LAST_NAME, AGE, SEX, INCOME)"
    "VALUES (%s, %s, %s, %s, %s)"
)
values = ("Bian", "Suryoprakoso", 22, "Male", 10000000)

try:
    # Eksekusi SQL Command 
    cursor.execute(insert_sql, values)

    # Melakukan perubahan (commit) pada Database
    conn.commit()
    
except:
    # Roll back apabila ada issue
    conn.rollback()

# Menutup koneksi
conn.close()