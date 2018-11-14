SELECT AVG(SUM1)  AS avergae_credits FROM students st INNER JOIN
(SELECT en.sid, SUM(temp.credits) AS SUM1 FROM enrollments en INNER JOIN
(SELECT cl.classid, cl.course#, cc.credits FROM classes cl INNER JOIN
(SELECT course#, credits FROM course_credit) cc
ON cl.course# = cc.course#) temp
ON en.classid = temp.classid
WHERE en.lgrade IS NOT NULL GROUP BY sid) cl
ON st.sid = cl.sid
/
