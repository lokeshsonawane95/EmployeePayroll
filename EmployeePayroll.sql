--Welcome to EmployeePayroll Problem

-- UC1 Create employee_payroll database
create database employee_payroll;

use employee_payroll;

-- UC2 Create employee_payroll table
create table employee_payroll(
-- id is incremented by one starting from 1, primary key(unique and not null)
id int identity(1,1) primary key,
-- name is not null
name varchar(200) not null,
-- salary is not null
salary int not null,
-- startDate stores date which is not null
startDate date not null
);

-- UC3 Insert data into table employee_payroll
insert into employee_payroll values
('John', 30000, '1991-02-04'),
('Lokesh', 40000, '2022-04-05'),
('Vikram', 50000, '2020-07-09'),
('Mina', 45000, '2021-04-05'),
('Isha', 49000, '2019-04-05');

-- UC4 Retrieve all data we have inserted into employee_payroll
select * from employee_payroll;

-- UC5
-- Rettrieve data of a particular employee
select base_pay from employee_payroll where name = 'John';

-- where condition for data
-- getdate() used to get current date
select * from employee_payroll where startDate between CAST('2018-01-01' AS DATE) and GETDATE();

-- UC6
-- Alter table
alter table employee_payroll add gender char(1);

-- updating each row
update employee_payroll set gender = 'M' where name = 'John' or name = 'Lokesh' or name = 'Vikram';

update employee_payroll set gender = 'F' where name = 'Mina' or name = 'Isha';

-- UC7 use aggregate functions

select gender, sum(base_pay) from employee_payroll where gender = 'M' group by gender;

select gender, avg(base_pay) from employee_payroll where gender = 'F' group by gender;

select gender, avg(base_pay) from employee_payroll group by gender;

select gender, count(*) from employee_payroll group by gender;

select min(base_pay) as "Lowest_Salary" from employee_payroll;

select max(base_pay) "Highest_Salary" from employee_payroll;


-- UC8 Extend employee_payroll
alter table employee_payroll add phone bigint;

alter table employee_payroll add address varchar(300) default 'Pune';

alter table employee_payroll add department varchar(100) not null default 'Testing';

update employee_payroll
set phone = 9876543210, address = 'Bangaluru', department = 'HR'
where name = 'John';

update employee_payroll
set phone = 9875913210, address = 'Pune', department = 'IT'
where name = 'Lokesh';

update employee_payroll
set phone = 9875945610, address = 'Pune', department = 'IT'
where name = 'Mina';

update employee_payroll
set phone = 9875913329, address = 'Bangaluru', department = 'Marketing'
where name = 'Vikram';

update employee_payroll
set phone = 9874113210, address = 'Bangaluru'
where name = 'Isha';

select * from employee_payroll;


alter table employee_payroll alter column salary float;
-- UC9 Extend pays

-- changing salary column name to base_pay
Exec sp_rename 'employee_payroll.salary', 'base_pay', 'COLUMN';

alter table employee_payroll add deductions float, taxable_pay float, income_tax float, net_pay float

update employee_payroll set deductions = 100, taxable_pay = 1000, net_pay = base_pay - 500, income_tax = (0.12)*base_pay where name = 'John';

update employee_payroll set deductions = 100, taxable_pay = 1000, net_pay = base_pay - 600, income_tax = (0.15)*base_pay where name = 'Lokesh';

update employee_payroll set deductions = 100, taxable_pay = 1000, net_pay = base_pay - 700, income_tax = (0.16)*base_pay where name = 'Vikram';

update employee_payroll set deductions = 100, taxable_pay = 1000, net_pay = base_pay - 650, income_tax = (0.14)*base_pay where name = 'Mina';

update employee_payroll set deductions = 100, taxable_pay = 1000, net_pay = base_pay - 650, income_tax = (0.14)*base_pay where name = 'Isha';

-- UC10 Adding duplicate names

insert into employee_payroll 
values('John', 44000, '2020-04-22', 'M', 9513264780, 'Mumbai', 'Marketing', 2000, 1000, 200, 18000);