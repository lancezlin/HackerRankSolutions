# use partition/rank(), row_number(), dense_rank() to get the third highest salary in each department?
# table T
# -- EE_id int
# -- department varchar(20)
# -- salary double

SELECT *
FROM (
      SELECT EE_id, department, salary,
            RANK() OVER (PARTITION BY department ORDER BY salary ASC) as rank,
            ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary ASC) as rowNum,
            DENSE_RANK() OVER (PARTITION BY department ORDER BY salary ASC) as denseRank
            ORDER BY department, salary) as T1
WHERE T1.rank = 3 OR T1.rownum = 3 OR T1.denseRank = 3
;
