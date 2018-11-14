SELECT classid, dept_code, course#, (limit - class_size) AS seats_available FROM classes
WHERE year = 2018 AND semester = 'Spring' AND limit != class_size
/
