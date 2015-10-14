/*
You are given a table, Functions, containing two columns: X and Y. Y is the value of some function F at X -- i.e. Y = F(X).
Column Type
X       integer
Y       integer
Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if X1 = Y2 and X2 = Y1.

Write a query to output all such symmetric pairs in ascending order by the value of X.
*/
select t.X as X, t.Y as Y from
    Functions as t
    inner join
    Functions as m
    on t.Y = m.X
where t.X = m.Y and t.X < t.Y
union
select * from
    (select X, Y from Functions where X=Y) as s
    group by s.X having count(*)>1
order by X
;
