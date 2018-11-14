1. SELECT concat(co.dept_code, co.course#) AS course_id, title FROM courses co , classes cl 
   WHERE co.course# = cl.course# AND cl.year = 2018	 AND cl.semester='Spring';
   
   
   2. SELECT firstname FROM students 
   WHERE sid IN 
   ((SELECT sid FROM enrollments en JOIN classes cl ON en.classid = cl.classid AND cl.dept_code = 'Math')
  intersect 
  (SELECT sid FROM enrollments en JOIN classes cl ON en.classid = cl.classid AND cl.dept_code = 'CS'));
  
  
  3. SELECT dept_code, course# FROM courses 
  MINUS 
  (SELECT dept_code, course# FROM classes WHERE year=2017);
  
  
  4. SELECT distinct st.sid, st.firstname, st.gpa FROM students st, enrollments en 
  WHERE  status != 'graduate' AND st.sid=en.sid AND en.lgrade = 'A';
  
  
  5. SELECT firstname FROM students 
  WHERE sid in
  ((SELECT st.sid FROM students st, enrollments en WHERE st.sid = en.sid) 
  minus 
  (SELECT st.sid FROM students st, enrollments en WHERE st.sid = en.sid AND en.lgrade = 'A'));
  
  
  6. SELECT sid, firstname FROM students 
  WHERE sid IN 
  ((SELECT sid FROM enrollments WHERE lgrade = 'A' AND lgrade IS NOT NULL)
  minus 
  (SELECT e.sid FROM enrollments e WHERE e.sid = sid AND e.lgrade != 'A' AND e.lgrade IS NOT NULL));

  
  7. 
  SELECT * FROM (SELECT dept_code,course#,COUNT(*) AS counttemp FROM classes GROUP BY dept_code,course#)
  WHERE counttemp IN (SELECT MAX(COUNT(*)) AS count FROM classes GROUP BY dept_code, course#);
  
  SELECT dept_code, course# FROM (SELECT dept_code, course#, = FROM classes GROUP BY dept_code, course#)
  WHERE count1 IN (SELECT MAX(COUNT(*)) AS count1 FROM classes GROUP BY dept_code, course#);
  
  
  8. SELECT classid, dept_code, course#, (limit - class_size) AS seats_available FROM classes 
  WHERE year = 2018 AND semester = 'Spring' AND limit != class_size;
  
  SELECT classid, dept_code, course#, (limit - class_size) AS seats_available FROM classes 
  WHERE semester='Spring' AND year=2018 AND classes.limit != classes.class_size;
  
  
  9. SELECT students.* FROM students join (SELECT sid FROM enrollments GROUP BY sid HAVING COUNT(classid)>4) a ON a.sid=students.sid;
   
   SELECT st.* FROM students st join (SELECT sid FROM enrollments GROUP BY sid HAVING COUNT(classid) > 4) en ON en.sid = st.sid;
   
 10.  SELECT * FROM classes c INNER JOIN (SELECT e.classid FROM enrollments e GROUP BY classid HAVING COUNT(classid)<3) a
  ON a.classid=c.classid WHERE semester ='Spring' AND Year =2018 AND dept_code='CS';
  
SELECT cl.* FROM classes cl JOIN (SELECT classid FROM enrollments GROUP BY classid HAVING COUNT(classid) < 3) en
ON en.classid = cl.classid WHERE  cl.dept_code = 'CS' AND cl.year = 2018 AND cl.semester ='Spring';
  
  
  11. SELECT sid, firstname FROM students WHERE sid in( SELECT sid FROM enrollments WHERE classid IN ( SELECT classid FROM classes 
   WHERE dept_code='CS' AND course# >400) GROUP BY sid HAVING COUNT(*) = (SELECT COUNT(*) FROM classes 
   WHERE dept_code = 'CS' AND course# > 400));
   
SELECT sid, firstname FROM students 
WHERE sid IN (SELECT sid FROM enrollments WHERE classid IN 
( SELECT classid FROM classes WHERE dept_code = 'CS' AND course# > 400) GROUP BY sid HAVING COUNT(*) = (SELECT COUNT(*) FROM classes 
WHERE dept_code = 'CS' AND course# > 400));   
   
   12. (SELECT  b.TITLE FROM enrollments e INNER JOIN (SELECT c.course#, a.title AS TITLE, c.classid FROM classes c INNER JOIN 
  (SELECT c1.course#, c1.title FROM courses c1) a ON a.course# = c.course# ) b ON b.classid=e.classid WHERE sid='B001') 
   minus  (SELECT  b.TITLE FROM enrollments e INNER JOIN (SELECT c.course#, a.title AS TITLE, c.classid FROM classes c 
   INNER JOIN (SELECT c1.course#, c1.title FROM courses c1) a ON a.course# = c.course# ) b ON b.classid=e.classid WHERE sid='B002');
   
   
  13. 
  SELECT firstname FROM students 
  WHERE sid IN (SELECT sid FROM enrollments WHERE classid IN 
  ( SELECT classid FROM enrollments WHERE sid = 'B005'));

  
  14. 
SELECT dept_code, course#, semester, year FROM classes GROUP BY dept_code, course#, semester, year HAVING COUNT(course#) >= 2;
   
   
   15. 
SELECT sid, firstname FROM students 
WHERE sid IN 
(SELECT sid FROM enrollments en JOIN (SELECT classid, MIN(lgrade) AS lgrade FROM enrollments GROUP BY classid) en_new
ON en_new.classid = en.classid AND en_new.lgrade = en.lgrade);
  
  
   16.SELECT b.course#, b.title, b.dept_code, NVL(e.lgrade , 'To be assigned') AS grade  FROM enrollments e 
  INNER JOIN (SELECT c.classid, c.course# AS course#, a.title AS title, c.dept_code AS dept_code  FROM classes c
  INNER JOIN (SELECT c1.course#, c1.title AS title FROM courses c1) a ON a.course#=c.course#) b ON b.classid = e.classid 
  WHERE e.sid='B003';
  
  
  17. SELECT c1.dept_code, c1.course#, c1.title FROM courses c1 INNER join 
  (SELECT c.classid, c.course#, b.sid FROM classes c INNER JOIN
  (SELECT distinct (e.sid), e.classid FROM enrollments e INNER JOIN 
  (SELECT s.sid, s.gpa FROM students s WHERE gpa>3.25) a ON e.sid = a.sid) b ON b.classid = c.classid) d ON d.course# = c1.course#
  WHERE c1.title LIKE '%systems%';
  
  
  18. 
  SELECT firstname, s.sid, NVL(Total,0) FROM students s LEFT JOIN (SELECT e.sid, SUM(b.credits) as
  Total FROM enrollments e INNER JOIN (SELECT c.classid, c.course#, a.credits FROM classes c INNER JOIN
  (SELECT course#, credits FROM course_credit) a ON c.course#=a.course#) b ON e.classid = b.classid 
  WHERE e.lgrade IS NOT NULL GROUP BY sid) c ON s.sid=c.sid;
  
 SELECT firstname, st.sid, NVL(sum1,0) FROM students st LEFT JOIN 
 (SELECT e.sid, SUM(b.credits) AS sum1 FROM enrollments en INNER JOIN 
 (SELECT cl.classid, cl.course#, cc.credits FROM classes cl INNER JOIN
 (SELECT course#, credits FROM course_credit) a ON c.course#=a.course#) b ON e.classid = b.classid 
 WHERE e.lgrade IS NOT NULL GROUP BY sid) c ON s.sid=c.sid;
  
  
  19. SELECT Avg(Total) FROM students s Inner JOIN (SELECT e.sid, SUM(b.credits) AS Total FROM enrollments e INNER JOIN
 (SELECT c.classid, c.course#, a.credits FROM classes c INNER JOIN (SELECT course#, credits FROM course_credit) a ON c.course#=a.course#)
 b ON e.classid = b.classid WHERE e.lgrade IS NOT NULL GROUP BY sid) c ON s.sid=c.sid;

 
SELECT AVG(SUM1)  AS avergae_credits FROM students st INNER JOIN 
(SELECT en.sid, SUM(temp.credits) AS SUM1 FROM enrollments en INNER JOIN
(SELECT cl.classid, cl.course#, cc.credits FROM classes cl INNER JOIN 
(SELECT course#, credits FROM course_credit) cc ON cl.course# = cc.course#)
temp ON en.classid = temp.classid WHERE en.lgrade IS NOT NULL GROUP BY sid) cl ON st.sid = cl.sid;

 
 20. SELECT sid, x/y AS gpa FROM (SELECT sid, SUM(grade) AS x , COUNT(classid) AS y FROM enrollments e1 
    INNER JOIN (SELECT g.lgrade, g.ngrade AS grade FROM grades g) a ON a.lgrade = e1.lgrade GROUP BY sid) order by gpa desc;
	
SELECT sid, SUM1 / cnt AS cgpa FROM (SELECT sid, SUM(grade) AS SUM1, COUNT(classid) AS cnt FROM enrollments en 
INNER JOIN (SELECT lgrade, ngrade AS grade FROM grades) gr ON gr.lgrade = en.lgrade GROUP BY sid) ORDER BY cgpa DESC;
  