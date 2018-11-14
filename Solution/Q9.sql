SELECT st.* FROM students st
JOIN (SELECT sid FROM enrollments GROUP BY sid HAVING COUNT(classid) > 4) en ON en.sid = st.sid
/
