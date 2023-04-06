create table employees(
       id serial primary key,
       employee_name varchar(50)
       );
 
select * from employees

alter table employees
alter column employee_name set not null;   


create table salary(
     id serial primary key,
     monthly_salary int
     );
 
alter table salary 
alter column monthly_salary set not null;
 
do $$
BEGIN
    FOR counter IN 1000 .. 2500 BY 100
    LOOP
        insert into salary(monthly_salary) values (counter);
    END LOOP;
END; $$;
 
create table employee_salary(
      id serial primary key,
      employee_id int unique,
      salary_id int
     );
    
alter table employee_salary
alter column employee_id set not null;

alter table employee_salary
alter column salary_id set not null;



select * from employee_salary;

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
     
  
select * from employee_salary;


create table roles(
       id serial primary key,
       role_name int not null unique
       );
  
select * from roles;

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


alter table roles
alter column role_name set not null;

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



