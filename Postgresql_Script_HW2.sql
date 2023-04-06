-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.

select employee_name, monthly_salary 
from employees
join employee_salary
     on employees.id=employee_salary.employee_id
join salary 
     on employee_salary.salary_id=salary.id;


--  2. Вывести всех работников у которых ЗП меньше 2000.
    
select employee_name, monthly_salary 
from employees
join employee_salary
     on employees.id=employee_salary.employee_id
join salary 
     on employee_salary.salary_id=salary.id
where salary.monthly_salary < 2000;


-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. 
--(ЗП есть, но не понятно кто её получает.)

select monthly_salary, employee_id 
from salary 
join employee_salary
     on salary.id=employee_salary.salary_id
where employee_id not in (select employees.id from employees);


-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. 
--(ЗП есть, но не понятно кто её получает.)

select monthly_salary, employee_id 
from salary 
join employee_salary
     on salary.id=employee_salary.salary_id
where monthly_salary < 2000 
and employee_id not in (select employees.id from employees);

-- 5. Найти всех работников кому не начислена ЗП.

select employee_name, monthly_salary 
from employee_salary e_s 
right join employees em 
    on e_s.employee_id = em.id
left join salary s  
    on e_s.salary_id = s.id
where monthly_salary is null;

-- 6. Вывести всех работников с названиями их должности.

select employee_name, role_name
from employees em
join roles_employee r_m
     on r_m.employee_id=em.id 
join roles r 
     on r_m.role_id=r.id; 
 
-- 7. Вывести имена и должность только Java разработчиков.
    
select employee_name, role_name
from employees em
join roles_employee r_m
     on r_m.employee_id=em.id 
join roles r 
     on r_m.role_id=r.id
where role_name like '%Java dev%';

-- 8. Вывести имена и должность только Python разработчиков.

select employee_name, role_name
from roles_employee r_e
join employees em 
     on em.id=r_e.employee_id
join roles r 
     on r.id=r_e.role_id
where role_name like '%Python dev%';

--9. Вывести имена и должность всех QA инженеров.

select employee_name, role_name
from roles_employee r_e
join employees em 
     on em.id=r_e.employee_id
join roles r 
     on r.id=r_e.role_id
where role_name like '%QA% en%';

--10. Вывести имена и должность ручных QA инженеров.

select employee_name, role_name
from roles_employee r_e
join employees em 
     on em.id=r_e.employee_id
join roles r 
     on r.id=r_e.role_id
where role_name like '%Manual% QA% en%';

--11. Вывести имена и должность автоматизаторов QA.

select employee_name, role_name
from roles_employee r_e
join employees em 
     on em.id=r_e.employee_id
join roles r 
     on r.id=r_e.role_id
where role_name like '%Auto%';

-- 12. Вывести имена и зарплаты Junior специалистов

select employee_name, role_name
from roles_employee r_e
join employees em 
     on em.id=r_e.employee_id
join roles r 
     on r.id=r_e.role_id
where role_name like '%Junior%';

-- 13. Вывести имена и зарплаты Middle специалистов

select employee_name, role_name
from roles_employee r_e
join employees em 
     on em.id=r_e.employee_id
join roles r 
     on r.id=r_e.role_id
where role_name like '%Middle%';

-- 14. Вывести имена и зарплаты Senior специалистов

select employee_name, role_name
from roles_employee r_e
join employees em 
     on em.id=r_e.employee_id
join roles r 
     on r.id=r_e.role_id
where role_name like '%Senior%';

--15. Вывести зарплаты Java разработчиков

select monthly_salary, role_name
from roles_employee r_e
join roles r
     on r_e.role_id=r.id 
join employees e
    on  r_e.employee_id=e.id 
join employee_salary e_s 
    on e.id=e_s.employee_id 
join salary s
    on s.id=e_s.salary_id 
where role_name like '%Java dev%';

-- 16. Вывести зарплаты Python разработчиков

select monthly_salary, role_name
from roles_employee r_e
join roles r
     on r_e.role_id=r.id 
join employees e
    on  r_e.employee_id=e.id 
join employee_salary e_s 
    on e.id=e_s.employee_id 
join salary s
    on s.id=e_s.salary_id 
where role_name like '%Python dev%';


-- 17. Вывести имена и зарплаты Junior Python разработчиков

select monthly_salary, role_name
from roles_employee r_e
join roles r
     on r_e.role_id=r.id 
join employees e
    on  r_e.employee_id=e.id 
join employee_salary e_s 
    on e.id=e_s.employee_id 
join salary s
    on s.id=e_s.salary_id 
where role_name like 'Junior Python dev%';

-- 18. Вывести имена и зарплаты Middle JS разработчиков

select monthly_salary, role_name
from roles_employee r_e
join roles r
     on r_e.role_id=r.id 
join employees e
    on  r_e.employee_id=e.id 
join employee_salary e_s 
    on e.id=e_s.employee_id 
join salary s
    on s.id=e_s.salary_id 
where role_name like 'Middle JavaS% dev%';

-- 19. Вывести имена и зарплаты Senior Java разработчиков

select monthly_salary, role_name
from roles_employee r_e
join roles r
     on r_e.role_id=r.id 
join employees e
    on  r_e.employee_id=e.id 
join employee_salary e_s 
    on e.id=e_s.employee_id 
join salary s
    on s.id=e_s.salary_id 
where role_name like 'Senior Java dev%';

-- 20. Вывести зарплаты Junior QA инженеров

select monthly_salary, role_name
from roles_employee r_e
join roles r
     on r_e.role_id=r.id 
join employees e
    on  r_e.employee_id=e.id 
join employee_salary e_s 
    on e.id=e_s.employee_id 
join salary s
    on s.id=e_s.salary_id 
where role_name like '%Junior% QA% en%';

--21. Вывести среднюю зарплату всех Junior специалистов

select avg(monthly_salary)
from roles_employee r_e
join roles r
     on r_e.role_id=r.id 
join employees e
    on  r_e.employee_id=e.id 
join employee_salary e_s 
    on e.id=e_s.employee_id 
join salary s
    on s.id=e_s.salary_id 
where role_name like '%Junior%';

--22. Вывести сумму зарплат JS разработчиков

select sum(monthly_salary)
from roles_employee r_e
join roles r
     on r_e.role_id=r.id 
join employees e
    on  r_e.employee_id=e.id 
join employee_salary e_s 
    on e.id=e_s.employee_id 
join salary s
    on s.id=e_s.salary_id 
where role_name like '%JavaS% dev%';


--23. Вывести минимальную ЗП QA инженеро

select min(monthly_salary) from employee_salary es 
join salary s 
    on es.salary_id = s.id
join employees e 
    on es.employee_id = e.id 
join roles_employee re 
    on re.employee_id = e.id 
join roles r 
    on re.role_id = r.id
where role_name like '%QA%';

--24. Вывести максимальную ЗП QA инженеров

select max(monthly_salary) from employee_salary es 
join salary s 
   on es.salary_id = s.id
join employees e 
   on es.employee_id = e.id 
join roles_employee re 
   on re.employee_id = e.id 
join roles r 
   on re.role_id = r.id
where role_name like '%QA%';

--25. Вывести количество QA инженеров

select count(employee_name) from roles_employee r_e
join employees em 
   on em.id=r_e.employee_id 
join roles r 
   on r.id=r_e.role_id 
where role_name like '%QA%';

--26. Вывести количество Middle специалистов.
select count(employee_name) from roles_employee r_e
join employees em 
   on em.id=r_e.employee_id 
join roles r 
   on r.id=r_e.role_id 
where role_name like '%Middle%';

--27. Вывести количество разработчиков
select count(employee_name) from roles_employee r_e
join employees em 
   on em.id=r_e.employee_id 
join roles r 
   on r.id=r_e.role_id 
where role_name like '%dev%';

--28. Вывести фонд (сумму) зарплаты разработчиков.
select sum(monthly_salary)
from roles_employee r_e
join roles r
     on r_e.role_id=r.id 
join employees e
    on  r_e.employee_id=e.id 
join employee_salary e_s 
    on e.id=e_s.employee_id 
join salary s
    on s.id=e_s.salary_id 
where role_name like '%dev%';

--29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employee_name, role_name, monthly_salary
from roles_employee r_e
join employees em 
   on em.id=r_e.employee_id
join roles r 
   on r.id=r_e.role_id
join employee_salary e_s 
   on e_s.employee_id=em.id 
join salary s
   on s.id=e_s.salary_id 
order by monthly_salary;

--30. Вывести имена, должности и ЗП всех специалистов по возрастанию 
--у специалистов у которых ЗП от 1700 до 2300

select employee_name, role_name, monthly_salary
from roles_employee r_e
join employees em 
   on em.id=r_e.employee_id
join roles r 
   on r.id=r_e.role_id
join employee_salary e_s 
   on e_s.employee_id=em.id 
join salary s
   on s.id=e_s.salary_id 
where monthly_salary between 1700 and 2300
order by monthly_salary;

--31. Вывести имена, должности и ЗП всех специалистов по возрастанию
-- у специалистов у которых ЗП меньше 2300

select employee_name, role_name, monthly_salary
from roles_employee r_e
join employees em 
   on em.id=r_e.employee_id
join roles r 
   on r.id=r_e.role_id
join employee_salary e_s 
   on e_s.employee_id=em.id 
join salary s
   on s.id=e_s.salary_id 
where monthly_salary < 2300
order by monthly_salary;

--32. Вывести имена, должности и ЗП всех специалистов по возрастанию
-- у специалистов у которых ЗП равна 1100, 1500, 2000

select employee_name, role_name, monthly_salary
from roles_employee r_e
join employees em 
   on em.id=r_e.employee_id
join roles r 
   on r.id=r_e.role_id
join employee_salary e_s 
   on e_s.employee_id=em.id 
join salary s
   on s.id=e_s.salary_id 
where monthly_salary in (1100,1500,2000)
order by monthly_salary;
 

