import sqlite3
from pprint import pprint

def main(query):
    connection = sqlite3.connect('HW06.bd')
    cursor = connection.cursor()

    with open(query, 'r') as sql_file:
        sql_query = sql_file.read()
    cursor.execute(sql_query)
    results = cursor.fetchall()
    pprint(results)
    connection.commit()
    cursor.close()
    connection.close()

if __name__ == '__main__':
    #query = "query_1.sql"
    #query = "query_2.sql"
    #query = "query_3.sql"
    #query = "query_4.sql"
    #query = "query_5.sql"
    #query = "query_6.sql"
    #query = "query_7.sql"
    #query = "query_8.sql"
    #query = "query_9.sql"
    #query = "query_10.sql"
    #query = "query_11.sql"
    query = "query_12.sql"

    main(query)