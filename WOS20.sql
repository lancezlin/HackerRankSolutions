/*
Given a table STATION that holds data for five fields namely ID, CITY, STATE, NORTHERN LATITUDE and WESTERN LONGITUDE.

+-------------+------------+
| Field       |   Type     |
+-------------+------------+
| ID          | INTEGER    |
| CITY        | VARCHAR(21)|
| STATE       | VARCHAR(2) |
| LAT_N       | NUMERIC    |
| LONG_W      | NUMERIC    |
+-------------+------------+
 
Print the median of Northern Latitude values up to 4 decimal places.
*/
SELECT AVG(MIDVAL) FROM 
	(SELECT LAT_N AS MIDVAL FROM STATION ORDER BY LAT_N 
	LIMIT (SELECT IF(COUNT(*)%2=1, 1, 2) FROM STATION)
	OFFSET (SELECT IF(COUNT(*)%2=1, FLOOR(COUNT(*)/2 +1), FLOOR(COUNT(*)/2)) FROM STATION)
    ) AS T;
