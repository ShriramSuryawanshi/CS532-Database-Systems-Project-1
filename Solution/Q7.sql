SELECT dept_code, course# FROM
(SELECT dept_code, course#, COUNT(*) AS count1 FROM classes GROUP BY dept_code, course#)
WHERE count1 IN (SELECT MAX(COUNT(*)) AS count1 FROM classes GROUP BY dept_code, course#)
/
