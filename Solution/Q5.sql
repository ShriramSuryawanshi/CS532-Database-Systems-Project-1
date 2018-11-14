SELECT firstname FROM students
WHERE sid in
((SELECT st.sid FROM students st, enrollments en WHERE st.sid = en.sid)
MINUS
(SELECT st.sid FROM students st, enrollments en WHERE st.sid = en.sid AND en.lgrade = 'A'))
/
