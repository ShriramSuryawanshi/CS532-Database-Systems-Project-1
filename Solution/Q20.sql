SELECT sid, sum1 / cnt AS cgpa FROM (SELECT sid, SUM(grade) AS sum1, COUNT(classid) AS cnt FROM enrollments en
INNER JOIN (SELECT lgrade, ngrade AS grade FROM grades) gr ON gr.lgrade = en.lgrade GROUP BY sid) ORDER BY cgpa DESC
/
