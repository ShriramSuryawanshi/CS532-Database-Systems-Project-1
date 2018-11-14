SELECT cl.* FROM classes cl JOIN (SELECT classid FROM enrollments GROUP BY classid HAVING COUNT(classid) < 3) en
ON en.classid = cl.classid WHERE  cl.dept_code = 'CS' AND cl.year = 2018 AND cl.semester ='Spring'
/
