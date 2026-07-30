---- Which students have more than 20 behavior records and what is their color frequency (Status)?
SELECT Student_Name, YEAR, count(Student_Name) CountOfRecord, Status
FROM BehavoirStudentID  
GROUP BY Student_Name, YEAR, Status
HAVING count(Student_Name) > 20 
ORDER BY Status DESC;

--- Which students have more than 20 behavior records, their color frequency (Status), 
---- with unique ID based on year and group
SELECT Student_Name, YEAR, count(Student_Name) CountOfRecord, Status
FROM dbo.Behavoir7ColumnCleanID 
GROUP BY Student_Name, YEAR, Status
HAVING count(Student_Name) > 20 
ORDER BY Status DESC;