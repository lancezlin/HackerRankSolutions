/*
Problem Statement

You are given a table, Occupations, containing two columns:  Name and Occupation.



Occupation is one of the following:

Doctor
Professor
Singer
Actor
You have to generate the two following resulting sets:

List all the names in a sorted alphabetical order followed by one character within a parenthesis denoting the occupation. For example: (P) for professor, (A) for actor, (D) for Doctor or (S) for singer.
List the total count of Doctors, Professors, Singers and Actors. The list should be sorted by ascending numbers.
Write a query to perform the above task.
*/
(select CONCAT(Name, '(', substring(Occupation, 1, 1), ')') as conb from Occupations order by conb)
UNION ALL
(select CONCAT('There are total ', tnum, ' ', Occupation, '.') from 
    (select Occupation, count(Occupation) as tnum from Occupations group by Occupation order by tnum) as T);
