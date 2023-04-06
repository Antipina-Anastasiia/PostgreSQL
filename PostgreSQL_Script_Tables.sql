
--     1) Создать таблицу employees
-- - id. serial,  primary key,
-- - employee_name. Varchar(50), not null

create table employees(
       id serial primary key,
       employee_name varchar(50) not null
       );
 
 
--     2) Наполнить таблицу employee 70 строками.
      
использовала Pytnon скрипт

for i in range(0,70):

    cursor = conn.cursor()

    employee_name = names.get_full_name()

    if conn:

        base_data = employee_name
        insert_query = """insert into public.employees(employee_name) values(%s)"""

        cursor.execute(insert_query, (base_data,))
        conn.commit()
    cursor.close()
    
 -- Таблица salary

--  3) Создать таблицу salary:
--  id. Serial  primary key,
--  monthly_salary. Int, not null
   
create table salary(
	id serial primary key,
	monthly_salary int not null
);

-- 4. Наполнить таблицу salary 15 строками
 
do $$
BEGIN
    FOR counter IN 1000 .. 2500 BY 100
    LOOP
        insert into salary(monthly_salary) values (counter);
    END LOOP;
END; $$;
 
-- 5. Создать таблицу employee_salary
--- id. Serial  primary key,
--- employee_id. Int, not null, unique
--- salary_id. Int, not null
-- 6. Наполнить таблицу employee_salary 40 строками:
--- в 10 строк из 40 вставить несуществующие employee_id

create table employee_salary (
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null
);

insert into employee_salary(employee_id, salary_id)
values(4, 5),
      (3, 12),
      (12, 3),
      (23, 1),
      (33, 11),
      (7, 6),
      (68, 3),
      (51, 2),
      (42, 15),
      (39, 4),
      (50, 14),
      (20, 12),
      (13, 10),
      (56, 7),
      (29, 12),
      (37, 15),
      (16, 6),
      (49, 8),
      (9, 12),
      (1, 9),
      (10, 14),
      (6, 13),
      (18, 2),
      (22, 1),
      (66, 9),
      (34, 14),
      (40, 13),
      (17, 11),
      (19, 3),
      (69, 4),
      (71, 12),
      (345, 13),
      (80, 8),
      (2345, 11),
      (92, 7),
      (81, 10),
      (102, 6),
      (74, 9),
      (342, 4),
      (76, 2);
     
  


--7. 	Создать таблицу roles
--- id. Serial  primary key,
--- role_name. int, not null, unique
--8. Поменять тип столба role_name с int на varchar(30)
--9. Наполнить таблицу roles 20 строками:

create table roles (
	id serial primary key,
	role_name int not null unique
);

ALTER TABLE roles 
ALTER COLUMN role_name TYPE varchar(30);

insert into roles(role_name)
values ('Junior Python developer'),
       ('Middle Python developer'),
       ('Senior Python developer'),
       ('Junior Java developer'),
       ('Middle Java developer'),
       ('Senior Java developer'),
       ('Junior JavaScript developer'),
       ('Middle JavaScript developer'),
       ('Senior JavaScript developer'),
       ('Junior Manual QA engineer'),
       ('Middle Manual QA engineer'),
       ('Senior Manual QA engineer'),
       ('Project Manager'),
       ('Designer'),
       ('HR'),
       ('CEO'),
       ('Sales manager'),
       ('Junior Automation QA engineer'),
       ('Middle Automation QA engineer'),
       ('Senior Automation QA engineer');


--10. Создать таблицу roles_employee
--- id. Serial  primary key,
--- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
--- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
--11. Наполнить таблицу roles_employee 40 строками:      

create table roles_employee(
       id serial primary key,
       employee_id int not null unique,
                foreign key (employee_id) 
                references employees (id),
       role_id int not null,
                foreign key (role_id)
                references roles (id)
       );
      


insert into roles_employee(employee_id,role_id)
values (4, 5),
      (3, 12),
      (12, 3),
      (23, 1),
      (33, 11),
      (7, 6),
      (68, 3),
      (51, 2),
      (42, 15),
      (39, 4),
      (50, 14),
      (20, 12),
      (13, 10),
      (56, 7),
      (29, 12),
      (37, 15),
      (16, 6),
      (49, 8),
      (9, 12),
      (1, 9),
      (47, 14),
      (6, 13),
      (18, 2),
      (22, 1),
      (66, 9),
      (41, 14),
      (40, 13),
      (17, 11),
      (11, 3),
      (69, 4),
      (62, 12),
      (38, 13),
      (60, 8),
      (27, 11),
      (19, 7),
      (28, 10),
      (10, 6),
      (70, 9),
      (34, 4),
      (36, 2);




