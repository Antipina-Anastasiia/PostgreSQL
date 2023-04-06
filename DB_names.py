import psycopg2
import names

conn = psycopg2.connect(dbname='qa_ddl_33_227',
                        user='padawan_user_227',
                        password='Pass1@',
                        host='159.69.151.133',
                        port='5056')



for i in range(0,70):

    cursor = conn.cursor()

    employee_name = names.get_full_name()

    if conn:

        base_data = employee_name
        insert_query = """insert into public.employees(employee_name) values(%s)"""

        cursor.execute(insert_query, (base_data,))
        conn.commit()
    cursor.close()
