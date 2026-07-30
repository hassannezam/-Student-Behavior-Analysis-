---- For a specific student, which staff recorded which negative behaviors?
SELECT Student_Name, count(Student_Name) CountBehave, Staff, NEGATIVE_BEHAVIOUR
FROM BehavoirStudentID  
GROUP BY Student_Name, Staff, NEGATIVE_BEHAVIOUR
HAVING count(Student_Name) > 0 AND Student_Name = 'ariz kha' 
ORDER BY count(Student_Name) DESC;

---- For each student, which staff recorded which negative behaviors (overall view)?
SELECT Student_Name, count(Student_Name) CountOfBehave, NEGATIVE_BEHAVIOUR, Staff
FROM BehavoirStudentID  
GROUP BY Student_Name, NEGATIVE_BEHAVIOUR, Staff
ORDER BY count(Student_Name) DESC;