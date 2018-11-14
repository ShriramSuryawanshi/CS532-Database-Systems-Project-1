SELECT sid, firstname FROM students
WHERE sid IN (SELECT sid FROM enrollments WHERE classid IN
(SELECT classid FROM classes WHERE dept_code = 'CS' AND course# > 400) GROUP BY sid
HAVING COUNT(*) =
(SELECT COUNT(*) FROM classes WHERE dept_code = 'CS' AND course# > 400))
/
