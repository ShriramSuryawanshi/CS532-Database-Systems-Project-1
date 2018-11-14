SELECT concat(co.dept_code, co.course#) AS course_id, title FROM courses co , classes cl
WHERE co.course# = cl.course# AND cl.year = 2018 AND cl.semester='Spring'
/
