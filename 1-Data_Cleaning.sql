
--Data Preprocessing and Cleaning Before Data Analysis
SELECT 	
    -- Assign unique ID per student based on name and year (same student gets same ID)
    DENSE_RANK() OVER (ORDER BY Student_Name, Year) AS StudentID,

    DATE, Date_Only, TIME,
    STUDENT_NAME,NEGATIVE_BEHAVIOUR,
    FORM_GROUP,Year, 
    Staff, Status
FROM (SELECT 
        DATE, 
        STUDENT_NAME,	
        NEGATIVE_BEHAVIOUR,
        -- Extract only date part (remove time)
        CAST([DATE] AS Date) AS Date_Only,
        -- Extract only HH:MM from time
        left(CAST([Date] AS time),5) AS TIME,
        FORM_GROUP,

        -- Extract Year from FORM_GROUP:
        -- If 1st digit <= 3 → take first 2 chars (e.g., "12")
        -- If 1st digit <= 9 → take first 1 char
        -- Else → take first 5 chars
        CASE    
        WHEN TRY_CAST(LEFT(FORM_GROUP,1) AS INT) <= 3  
        THEN LEFT(FORM_GROUP,2)   
        WHEN TRY_CAST(LEFT(FORM_GROUP,1) AS INT) <= 9 
        THEN LEFT(FORM_GROUP,1)
        ELSE LEFT(FORM_GROUP,5)
        END AS YEAR, 

        Staff, Status 

    FROM dbo.harlingtonSheet7 ) JobDone  
-- Filter only Year 12 students (first 2 chars of FORM_GROUP = 12)
WHERE TRY_CAST(LEFT(FORM_GROUP,2) AS INT) = 12