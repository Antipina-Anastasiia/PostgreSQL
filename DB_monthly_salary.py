import psycopg2

conn = psycopg2.connect(dbname='qa_ddl_33_227',
                        user='padawan_user_227',
                        password='Pass1@',
                        host='159.69.151.133',
                        port='5056')

BEGIN
    FOR counter IN 1000 .. 2500 BY 100
    LOOP
        RAISE NOTICE 'monthly_salary: %', counter;
    END LOOP;
END;
    cursor = conn.cursor()

    if conn:

        base_data = salary
        insert_query = """insert into public.employees(monthly_salary) values(int)"""

        cursor.execute(insert_query, (base_data,))
        conn.commit()
    cursor.close()
