/*
You are given a table, Employees, containing three columns: ID, Name and Salary (employee salary is in $ per month). The value of Salary is < 105.
Column Type
ID      INT
Name    CHAR
Salary  INT
Samantha was appointed to calculate the average salary of all the employees per month. When she copied the values to a new sheet, she didn't type any of the zeroes in the salary and computed the wrong result.

Your task is to find the amount of error in the result. Round up the resulting error to the next integer.
*/
select ceil(avg(e.Salary)-avg(t.fs)) from
(select cast(replace(cast(Salary as CHAR), '0', '') as unsigned) as fs from Employees) as t,
Employees as e;
