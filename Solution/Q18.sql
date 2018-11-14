 SELECT firstname, st.sid, NVL(sum1,0) FROM students st LEFT JOIN
 (SELECT en.sid, SUM(temp.credits) AS sum1 FROM enrollments en INNER JOIN
 (SELECT cl.classid, cl.course#, cc.credits FROM classes cl INNER JOIN
 (SELECT course#, credits FROM course_credit) cc
 ON cl.course# = cc.course#) temp
 ON en.classid = temp.classid
 WHERE en.lgrade IS NOT NULL GROUP BY sid) cl
 ON st.sid = cl.sid
/
