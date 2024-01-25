
SELECT * FROM couriermanagementsystem.customer_feedback;

DELETE FROM CUSTOMER_FEEDBACK WHERE CustomerID = 1016;

-- Subquery to Get Feedback with the Highest Rating
SELECT * FROM CUSTOMER_FEEDBACK WHERE Rating = (SELECT MAX(Rating) FROM CUSTOMER_FEEDBACK);

-- Subquery to Get Comments with the Lowest Rating
SELECT Comment FROM CUSTOMER_FEEDBACK WHERE Rating = (SELECT MIN(Rating) FROM CUSTOMER_FEEDBACK);

-- Subquery to Get CustomerIDs with Feedback
SELECT DISTINCT CustomerID FROM CUSTOMER_FEEDBACK;

-- Subquery to Get Feedback with Comments
SELECT * FROM CUSTOMER_FEEDBACK WHERE Comment IS NOT NULL;

-- Subquery to Get Feedback with Rating 5
SELECT * FROM CUSTOMER_FEEDBACK WHERE Rating = 5;

-- Subquery to Get Feedback with Ratings Grouped by Rating
SELECT Rating, COUNT(*) AS RatingCount FROM CUSTOMER_FEEDBACK GROUP BY Rating;

ALTER TABLE CUSTOMER_FEEDBACK MODIFY COLUMN Comment VARCHAR(300);

