---- Behavior pattern of a specific student within a form group, with frequency > 4
SELECT Student_Name, count(Student_Name) CountBehave, NEGATIVE_BEHAVIOUR, FORM_GROUP
FROM BehavoirStudentID  
GROUP BY Student_Name, NEGATIVE_BEHAVIOUR, FORM_GROUP
HAVING count(Student_Name) > 0 AND Student_Name = 'ariz kha'
ORDER BY count(Student_Name) DESC;

---- Behavior pattern comparison between two different students
SELECT Student_Name, count(Student_Name) CountBehave, NEGATIVE_BEHAVIOUR
FROM BehavoirStudentID  
GROUP BY Student_Name, NEGATIVE_BEHAVIOUR
HAVING Student_Name = 'amze yousu' OR Student_Name = 'ariz kha'
ORDER BY count(Student_Name) DESC;

---- Behavior pattern of top 10 different students
SELECT TOP(10) Student_Name, count(Student_Name) CountBehave, NEGATIVE_BEHAVIOUR, DATE
FROM BehavoirStudentID  
GROUP BY Student_Name, NEGATIVE_BEHAVIOUR, DATE
ORDER BY count(Student_Name) DESC;