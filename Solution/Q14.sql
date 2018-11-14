SELECT dept_code, course#, semester, year FROM classes GROUP BY dept_code, course#, semester, year HAVING COUNT(course#) >= 2
/
