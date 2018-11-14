SELECT sid, firstname FROM students
WHERE sid IN
(SELECT sid FROM enrollments en JOIN (SELECT classid, MIN(lgrade) AS lgrade FROM enrollments GROUP BY classid) en_new
ON en_new.classid = en.classid AND en_new.lgrade = en.lgrade)
/
