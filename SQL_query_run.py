import sqlite3
from pprint import pprint

def main(query):
    # Підключення до бази даних (замініть 'mydatabase.db' на шлях до вашої бази даних)
    connection = sqlite3.connect('HW06.bd')

    # Створення курсору
    cursor = connection.cursor()

    # Відкриття файлу з SQL-інструкцією
    with open(query, 'r') as sql_file:
        sql_query = sql_file.read()

    # Виконання SQL-інструкції з файлу
    cursor.execute(sql_query)

    # Отримання результатів запиту
    results = cursor.fetchall()

    # Виведення результатів за допомогою pprint
    pprint(results)

    # Збереження змін у базі даних (якщо це необхідно)
    connection.commit()

    # Закриття курсора і з'єднання з базою даних
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