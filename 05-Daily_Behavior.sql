---- Daily behavior pattern of students with frequency > 4 for a specific form group
SELECT Student_Name, FORM_GROUP, NEGATIVE_BEHAVIOUR, COUNT(NEGATIVE_BEHAVIOUR) CountBehave, DATE
FROM BehavoirStudentID 
GROUP BY Student_Name, FORM_GROUP, NEGATIVE_BEHAVIOUR, DATE   
HAVING COUNT(NEGATIVE_BEHAVIOUR) > 3 
ORDER BY FORM_GROUP;

---- Daily behavior pattern of classes with the lowest frequency (less than 2), filtered by Year 9
SELECT YEAR, NEGATIVE_BEHAVIOUR, COUNT(NEGATIVE_BEHAVIOUR) CountBehave, DATE
FROM BehavoirStudentID 
GROUP BY YEAR, NEGATIVE_BEHAVIOUR, DATE   
HAVING COUNT(NEGATIVE_BEHAVIOUR) < 2 AND YEAR = 9 
ORDER BY YEAR;

