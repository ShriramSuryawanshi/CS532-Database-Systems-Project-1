SELECT firstname FROM students
  WHERE sid IN (SELECT sid FROM enrollments WHERE classid IN
  ( SELECT classid FROM enrollments WHERE sid = 'B005'))
/
