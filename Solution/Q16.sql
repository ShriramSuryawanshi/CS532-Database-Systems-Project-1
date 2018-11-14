    SELECT temp2.course#, temp2.title, temp2.dept_code, NVL(en.lgrade , 'To be assigned') AS grade FROM enrollments en INNER JOIN
  (SELECT cl.classid, cl.course#, temp1.title, cl.dept_code FROM classes cl INNER JOIN
  (SELECT co.course#, co.title FROM courses co) temp1
  ON temp1.course# = cl.course#) temp2
  ON temp2.classid = en.classid
  WHERE en.sid = 'B003'
/
