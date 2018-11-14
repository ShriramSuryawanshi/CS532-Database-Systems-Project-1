 (SELECT  temp2.title FROM enrollments en INNER JOIN
 (SELECT cl.course#, temp1.title, cl.classid FROM classes cl INNER JOIN
 (SELECT co.course#, co.title FROM courses co) temp1
 ON temp1.course# = cl.course# ) temp2
 ON temp2.classid = en.classid
 WHERE sid = 'B001')
 MINUS
 (SELECT  temp2.title FROM enrollments en INNER JOIN
 (SELECT cl.course#, temp1.title, cl.classid FROM classes cl INNER JOIN
 (SELECT co.course#, co.title FROM courses co) temp1
 ON temp1.course# = cl.course# ) temp2
 ON temp2.classid = en.classid
 WHERE sid = 'B002')
/
