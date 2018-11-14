SELECT sid, firstname FROM students
WHERE sid in
((SELECT sid FROM enrollments WHERE lgrade = 'A' AND lgrade IS NOT NULL)
MINUS
(SELECT e.sid FROM enrollments e WHERE e.sid = sid AND e.lgrade != 'A' AND e.lgrade IS NOT NULL))
/
