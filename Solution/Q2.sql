SELECT firstname FROM students
WHERE sid IN
((SELECT sid FROM enrollments en JOIN classes cl ON en.classid = cl.classid AND cl.dept_code = 'Math')
INTERSECT
(SELECT sid FROM enrollments en JOIN classes cl ON en.classid = cl.classid AND cl.dept_code = 'CS'))
/
