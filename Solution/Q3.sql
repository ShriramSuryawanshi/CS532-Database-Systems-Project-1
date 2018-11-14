SELECT dept_code, course# FROM courses
MINUS
(SELECT dept_code, course# FROM classes WHERE year = 2017)
/
