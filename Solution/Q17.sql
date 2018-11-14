 SELECT co.dept_code, co.course#, co.title FROM courses co INNER JOIN
  (SELECT cl.classid, cl.course#, temp2.sid FROM classes cl INNER JOIN
  (SELECT DISTINCT (en.sid), en.classid FROM enrollments en INNER JOIN
  (SELECT st.sid, st.gpa FROM students st WHERE gpa > 3.25) temp1
  ON en.sid = temp1.sid) temp2
  ON temp2.classid = cl.classid) temp3
  ON temp3.course# = co.course#
  WHERE co.title LIKE '%systems%'
/
