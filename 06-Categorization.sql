---- Time-based categorization of student behaviors
WITH TIMEBEHAV AS (
    SELECT 
        Student_Name, 
        CONVERT(VARCHAR(5), TIME, 108) Time,
        NEGATIVE_BEHAVIOUR, 
        FORM_GROUP,
        CASE 
            WHEN TIME >= '14:30' THEN 'AFTER 14:30'
            WHEN TIME >= '11:30' THEN '11.5 TO 14.5'
            WHEN TIME >= '9:30' THEN '9.5 TO 11.5'
            WHEN TIME >= '7:30' THEN '7.5 TO 9.5'	
            WHEN TIME >= '00:00' THEN '6 TO 7.5'
        END 'Time_Of_Behavior'
    FROM dbo.Behavoir7ColumnClean B
) 
SELECT 
    B.NEGATIVE_BEHAVIOUR,
    B.FORM_GROUP,
    COUNT(B.NEGATIVE_BEHAVIOUR) CountBehavior, 
    Time_Of_Behavior
FROM dbo.Behavoir7ColumnClean B
LEFT JOIN TIMEBEHAV T ON B.Student_Name = T.Student_Name
GROUP BY B.NEGATIVE_BEHAVIOUR, B.FORM_GROUP, T.Time_Of_Behavior
HAVING COUNT(B.NEGATIVE_BEHAVIOUR) > 200 
ORDER BY T.Time_Of_Behavior;

---- Disciplinary categorization of students based on total negative records
WITH DISIPLINCAT AS (
    SELECT 
        Student_Name,
        YEAR,
        COUNT(NEGATIVE_BEHAVIOUR) CountOfBehavior,
        CASE 
            WHEN COUNT(NEGATIVE_BEHAVIOUR) >= '50' THEN 'Greater Than 50'
            WHEN COUNT(NEGATIVE_BEHAVIOUR) >= '40' THEN 'Greater Than 40'
            WHEN COUNT(NEGATIVE_BEHAVIOUR) >= '30' THEN 'Greater Than 30'
            WHEN COUNT(NEGATIVE_BEHAVIOUR) >= '20' THEN 'Greater Than 20'
            WHEN COUNT(NEGATIVE_BEHAVIOUR) >= '10' THEN 'Greater Than 10'
            WHEN COUNT(NEGATIVE_BEHAVIOUR) >= '2' THEN 'Greater Than 1'
            WHEN COUNT(NEGATIVE_BEHAVIOUR) <= '1' THEN 'Equal 1'
        END 'Number_Of_Negative_Record'
    FROM dbo.Behavoir7ColumnClean B 
    GROUP BY Student_Name, YEAR
) 
SELECT 
    D.Number_Of_Negative_Record, 
    COUNT(D.Number_Of_Negative_Record) CountBehaviorSegmentation
FROM dbo.Behavoir7ColumnClean B
LEFT JOIN DISIPLINCAT D ON B.Student_Name = D.Student_Name
GROUP BY D.Number_Of_Negative_Record 
HAVING COUNT(B.NEGATIVE_BEHAVIOUR) > 200 
ORDER BY COUNT(D.Number_Of_Negative_Record) DESC;