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
select salary from employee_payroll where name = 'John';

-- where condition for data
-- getdate() used to get current date
select * from employee_payroll where startDate between CAST('2018-01-01' AS DATE) and GETDATE();

-- UC6 