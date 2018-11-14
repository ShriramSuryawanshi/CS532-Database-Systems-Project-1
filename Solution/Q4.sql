SELECT DISTINCT st.sid, st.firstname, st.gpa FROM students st, enrollments en
WHERE status != 'graduate' AND st.sid = en.sid AND en.lgrade = 'A'
/
