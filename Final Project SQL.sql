-- Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

-- This is a 2-part assignment. In the first part, you are asked a series of questions 
-- that will help you profile and understand the data just like a data scientist would. 
-- For this first part of the assignment, you will be assessed both on the correctness 
-- of your findings, as well as the code you used to arrive at your answer. You will be 
-- graded on how easy your code is to read, so remember to use proper formatting and 
-- comments where necessary.

-- In the second part of the assignment, you are asked to come up with your own inferences 
-- and analysis of the data for a particular research question you want to answer. You will 
-- be required to prepare the dataset for the analysis you choose to do. As with the first 
-- part, you will be graded, in part, on how easy your code is to read, so use proper 
-- formatting and comments to illustrate and communicate your intent as required.

-- For both parts of this assignment, use this "worksheet." It provides all the questions 
-- you are being asked, and your job will be to transfer your answers and SQL coding where 
-- indicated into this worksheet so that your peers can review your work. You should be able 
-- to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) 
-- to copy and paste your answers. If you are going to use Word or some other page layout 
-- application, just be careful to make sure your answers and code are lined appropriately.
-- In this case, you may want to save as a PDF to ensure your formatting remains intact for 
-- you reviewer.


							Part 1: Yelp Dataset Profiling and Understanding

-- 1. Profile the data by finding the total number of records for each of the tables below:
	
-- i. Attribute table =  	10000
-- ii. Business table =  	10000
-- iii. Category table =	10000
-- iv. Checkin table =		10000
-- v. elite_years table =	10000
-- vi. friend table = 		10000
-- vii. hours table =		10000
-- viii. photo table = 		10000
-- ix. review table = 		10000
-- x. tip table = 		10000
-- xi. user table =		10000

SELECT COUNT(*) 
AS
all_the_records
FROM attribute;

-- 2. Find the total distinct records by either the foreign key or primary key for each table. 
-- If two foreign keys are listed in the table, please specify which foreign key.

i. Business =		44092
ii. Hours = 		3614
iii. Category =		3355
iv. Attribute =		1285
v. Review =		40568
vi. Checkin = 		697
vii. Photo =		21194
viii. Tip = 		16751
ix. User = 		19251 
x. Friend = 		9426
xi. Elite_years =	2793

-- Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.
-- i. Business =

SELECT COUNT(DISTINCT id) + COUNT(DISTINCT name) + COUNT(DISTINCT neighborhood)    
+ COUNT(DISTINCT address) + COUNT(DISTINCT city)  + COUNT(DISTINCT state)
+ COUNT(DISTINCT postal_code) + COUNT(DISTINCT latitude) + COUNT(DISTINCT longitude)
+ COUNT(DISTINCT stars) + COUNT(DISTINCT review_count) + COUNT(DISTINCT is_open)
AS 
total_business
FROM business;

-- ii. Hours =

SELECT COUNT(DISTINCT hours) + COUNT(DISTINCT business_id)
AS 
total_h
FROM hours;

-- iii. Category =

SELECT COUNT(DISTINCT business_id) + COUNT(DISTINCT category)
AS 
total_category
FROM category;

-- iv. Attribute =

SELECT COUNT(DISTINCT name) + COUNT(DISTINCT business_id) + COUNT(DISTINCT value)                        
AS 
total_Attribute
FROM attribute;

-- v. Review =

SELECT COUNT(DISTINCT id) + COUNT(DISTINCT stars) + COUNT(DISTINCT date)    
+ COUNT(DISTINCT text) + COUNT(DISTINCT useful)  + COUNT(DISTINCT funny)
+ COUNT(DISTINCT cool) + COUNT(DISTINCT business_id) + COUNT(DISTINCT user_id)
AS 
total_review
FROM review;

-- vi. Checkin = 

SELECT COUNT(DISTINCT business_id) + COUNT(DISTINCT date) + COUNT(DISTINCT count)
AS 
total_checkin
FROM checkin;

-- vii. Photo =

SELECT COUNT(DISTINCT id) + COUNT(DISTINCT business_id)+ COUNT(DISTINCT caption)
+ COUNT(DISTINCT label)
AS 
total_photo
FROM photo;

-- viii. Tip =

SELECT COUNT(DISTINCT user_id) + COUNT(DISTINCT business_id) + COUNT(DISTINCT text)
+ COUNT(DISTINCT date) + COUNT(DISTINCT likes)
AS 
total_tip
FROM tip;

-- ix. User = 

SELECT COUNT(DISTINCT id) + COUNT(DISTINCT name) + COUNT(DISTINCT review_count)    
+ COUNT(DISTINCT yelping_since) + COUNT(DISTINCT useful)  + COUNT(DISTINCT useful)
+ COUNT(DISTINCT funny) + COUNT(DISTINCT cool) + COUNT(DISTINCT fans)
+ COUNT(DISTINCT average_stars) + COUNT(DISTINCT compliment_hot) 
+ COUNT(DISTINCT compliment_more) + COUNT(DISTINCT compliment_profile)
+ COUNT(DISTINCT compliment_cute) + COUNT(DISTINCT compliment_list)
+ COUNT(DISTINCT compliment_note)
+ COUNT(DISTINCT compliment_plain)
+ COUNT(DISTINCT compliment_cool)
+ COUNT(DISTINCT compliment_funny)
+ COUNT(DISTINCT compliment_writer)
+ COUNT(DISTINCT compliment_photos)
AS 
total_user
FROM user;

-- x. Friend =

SELECT COUNT(DISTINCT user_id) + COUNT(DISTINCT friend_id) 
AS 
total_friend
FROM friend;

-- xi. Elite_years =

SELECT COUNT(DISTINCT user_id) + COUNT(DISTINCT year) 
AS 
total_elite_years
FROM elite_years;

-- 3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

NO. There is no null values in the Users table.

SELECT id, name, review_count, yelping_since, useful, funny, cool, fans, 
        average_stars, compliment_hot, compliment_more, compliment_profile, 
        compliment_cute, compliment_list, compliment_note, compliment_plain, 
        compliment_cool, compliment_funny, compliment_writer, compliment_photos
FROM  user
WHERE 	id is null
		or name is null
		or review_count is null
		or yelping_since is null
		or useful is null
		or funny is null
		or cool is null
		or fans is null
		or average_stars is null
		or compliment_hot is null
		or compliment_more is null
		or compliment_profile is null
		or compliment_cute is null
		or compliment_list is null
		or compliment_note is null
		or compliment_plain is null
		or compliment_cool is null
		or compliment_funny is null
		or compliment_writer is null
		or compliment_photos is null
		
-- 4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

-- i. Table: Review, Column: Stars
	
	min:1.0         max:5.0 	avg:3.7082 
		
	
-- ii. Table: Business, Column: Stars
	
	min:1.0         max:5.0		avg:3.6549
		
	
-- iii. Table: Tip, Column: Likes
	
	min:0           max:2.0	    	avg:0.0144
		
	
-- iv. Table: Checkin, Column: Count
	
	min:1           max:53		avg:1.9414
		
	
-- v. Table: User, Column: Review_count
	
	min:0     	max:2000	avg:24.2995
	
-- i.

MIN(stars)
,MAX(stars)
,AVG(stars)
FROM review;

-- ii.

SELECT 
MIN(stars)
,MAX(stars)
,AVG(stars)
FROM business;

-- iii.

SELECT 
MIN(likes)
,MAX(likes)
,AVG(likes)
FROM tip;

-- iv.

SELECT 
MIN(count)
,MAX(count)
,AVG(count)
FROM checkin;

-- v.

SELECT 
MIN(review_count)
,MAX(review_count)
,AVG(review_count)
FROM user;

-- 5. List the cities with the most reviews in descending order:

-- SQL code used to arrive at answer:

SELECT 
	city
	,COUNT(review_count) AS most_review
	FROM business
	GROUP BY city
	ORDER BY total_review DESC;	
	
-- Copy and Paste the Result Below:

+-----------------+-------------+
| city            | most_review |
+-----------------+-------------+
| Las Vegas       |        1561 |
| Phoenix         |        1001 |
| Toronto         |         985 |
| Scottsdale      |         497 |
| Charlotte       |         468 |
| Pittsburgh      |         353 |
| Montréal        |         337 |
| Mesa            |         304 |
| Henderson       |         274 |
| Tempe           |         261 |
| Edinburgh       |         239 |
| Chandler        |         232 |
| Cleveland       |         189 |
| Gilbert         |         188 |
| Glendale        |         188 |
| Madison         |         176 |
| Mississauga     |         150 |
| Stuttgart       |         141 |
| Peoria          |         105 |
| Markham         |          80 |
| Champaign       |          71 |
| North Las Vegas |          70 |
| North York      |          64 |
| Surprise        |          60 |
| Richmond Hill   |          54 |
+-----------------+-------------+
(Output limit exceeded, 25 of 362 total rows shown)

-- 6. Find the distribution of star ratings to the business in the following cities:

-- i. Avon

-- SQL code used to arrive at answer:

SELECT
	stars AS [Star_Rating] 
	,COUNT(stars) AS [Count]
	FROM business 
	WHERE city = 'Avon'
	GROUP BY stars

-- Copy and Paste the Resulting Table Below (2 columns-star rating and count):

-- +-------------+-------+
-- | Star_Rating | Count |
-- +-------------+-------+
-- |         1.5 |     1 |
-- |         2.5 |     2 |
-- |         3.5 |     3 |
-- |         4.0 |     2 |
-- |         4.5 |     1 |
-- |         5.0 |     1 |
-- +-------------+-------+

-- ii. Beachwood

-- SQL code used to arrive at answer:

SELECT
	stars AS [Star_Rating] 
	,COUNT(stars) AS [Count]
	FROM business 
	WHERE city = 'Beachwood'
	GROUP BY stars

-- Copy and Paste the Resulting Table Below (2 columns-star rating and count):

+-------------+-------+
| Star_Rating | Count |
+-------------+-------+
|         2.0 |     1 |
|         2.5 |     1 |
|         3.0 |     2 |
|         3.5 |     2 |
|         4.0 |     1 |
|         4.5 |     2 |
|         5.0 |     5 |
+-------------+-------+

-- 7. Find the top 3 users based on their total number of reviews:
		
-- SQL code used to arrive at answer:

SELECT
	name
	,review_count
	FROM user
	ORDER BY review_count DESC; 
	LIMIT 3
		
-- Copy and Paste the Result Below:
		
+-----------+--------------+
| name      | review_count |
+-----------+--------------+
| Gerald    |         2000 |
| Sara      |         1629 |
| Yuri      |         1339 |

-- 8. Does posing more reviews correlate with more fans?

-- Please explain your findings and interpretation of the results:

SELECT name
       ,review_count
       ,fans
	   FROM user
	   ORDER BY fans DESC
       
-- No. Posing more reviews does not correlate with more fans. As we look at 
-- the reults from the table we see that for example Gerald has the most 
-- review counts, however the number of fans for Gerald rank 4th among the 
-- names.
	
+-----------+--------------+------+
| name      | review_count | fans |
+-----------+--------------+------+
| Amy       |          609 |  503 |
| Mimi      |          968 |  497 |
| Harald    |         1153 |  311 |
| Gerald    |         2000 |  253 |
| Christine |          930 |  173 |
| Lisa      |          813 |  159 |
| Cat       |          377 |  133 |
| William   |         1215 |  126 |
| Fran      |          862 |  124 |
| Lissa     |          834 |  120 |
| Mark      |          861 |  115 |
| Tiffany   |          408 |  111 |
| bernice   |          255 |  105 |
| Roanna    |         1039 |  104 |
| Angela    |          694 |  101 |
| .Hon      |         1246 |  101 |
| Ben       |          307 |   96 |
| Linda     |          584 |   89 |
| Christina |          842 |   85 |
| Jessica   |          220 |   84 |
| Greg      |          408 |   81 |
| Nieves    |          178 |   80 |
| Sui       |          754 |   78 |
| Yuri      |         1339 |   76 |
| Nicole    |          161 |   73 |
+-----------+--------------+------+
(Output limit exceeded, 25 of 10000 total rows shown)
	
-- 9. Are there more reviews with the word "love" or with the word "hate" in them?

-- Answer:

+--------+----------+
| pharse | total_No |
+--------+----------+
| hate   |      232 |
| love   |     1780 |
+--------+----------+
	
-- SQL code used to arrive at answer:

SELECT 'love' pharse
       ,COUNT(text) [total_No]
       FROM review
       WHERE TEXT LIKE '%love%'
       UNION
       SELECT 'hate' phrase
       ,COUNT(text) [total_No]
       FROM review
       WHERE TEXT LIKE '%hate%'
	
	
-- 10. Find the top 10 users with the most fans:

-- SQL code used to arrive at answer:
	
SELECT name
       ,fans
       FROM user
	   ORDER BY fans DESC
       LIMIT 10
       	
-- Copy and Paste the Result Below:

+-----------+------+
| name      | fans |
+-----------+------+
| Amy       |  503 |
| Mimi      |  497 |
| Harald    |  311 |
| Gerald    |  253 |
| Christine |  173 |
| Lisa      |  159 |
| Cat       |  133 |
| William   |  126 |
| Fran      |  124 |
| Lissa     |  120 |
+-----------+------+

												Part 2: Inferences and Analysis
												
-- 1. Pick one city and category of your choice and group the businesses 
-- in that city or category by their overall star rating. Compare the 
-- businesses with 2-3 stars to the businesses with 4-5 stars and answer 
-- the following questions. Include your code.
	
	  I picked city of Toronto, and I looked at the Restaurants, Yoga, Spa, and Bar businesses.
	
-- i. Do the two groups you chose to analyze have a different distribution of hours?

	  Yes. They have different distribution of hours.

-- ii. Do the two groups you chose to analyze have a different number of reviews?

      Yes. They have different number of reviews. 
         
-- iii. Are you able to infer anything from the location data provided between these two groups? Explain.

-- SQL code used for analysis:

SELECT
      business.name
      ,business.address
      ,hours.hours
      ,category.category
      ,business.city
      ,business.stars
      ,business.review_count
      FROM (business INNER JOIN category ON business.id = category.business_id) 
            INNER JOIN hours ON hours.business_id = category.business_id
      WHERE business.city = 'Toronto' 
      GROUP BY business.stars;

+-----------------------+-----------------------+----------------------+-----------------------+---------+-------+--------------+
| name                  | address               | hours                | category              | city    | stars | review_count |
+-----------------------+-----------------------+----------------------+-----------------------+---------+-------+--------------+
| 99 Cent Sushi         | 389 Church Street     | Saturday|11:00-23:00 | Restaurants           | Toronto |   2.0 |            5 |
| The Fox & Fiddle      | 535 Danforth Ave      | Saturday|10:00-2:00  | Bars                  | Toronto |   2.5 |           35 |
| The Gym at 99 Sudbury | 99 Sudbury Street     | Saturday|8:00-20:00  | Yoga                  | Toronto |   3.0 |           14 |
| The Charlotte Room    | 19 Charlotte Street   | Saturday|18:00-2:00  | Venues & Event Spaces | Toronto |   3.5 |           10 |
| Edulis                | 169 Niagara Street    | Saturday|18:00-23:00 | Restaurants           | Toronto |   4.0 |           89 |
| Good Gosh Beauty      | 325 Glebemount Avenue | Monday|11:30-18:00   | Beauty & Spas         | Toronto |   4.5 |            6 |
| Innercity MMA         | 403 Dundas Street W   | Monday|17:00-22:00   | Active Life           | Toronto |   5.0 |            3 |
+-----------------------+-----------------------+----------------------+-----------------------+---------+-------+--------------+

-- 2. Group business based on the ones that are open and the ones that are closed. 
-- What differences can you find between the ones that are still open and the ones 
-- that are closed? List at least two differences and the SQL code you used to arrive 
-- at your answer.
		
-- i. Difference 1:
		
		The first difference between an open business and close is that open 
		restaurant have more reviews.
         
         
-- ii. Difference 2:

        The second difference between an open business and close is that open 
		restaurant have more stars. 
         
         
-- SQL code used for analysis:

SELECT
      business.name
      ,business.address
      ,business.is_open
      ,hours.hours
      ,category.category
      ,business.city
      ,business.stars
      ,business.review_count
      FROM (business INNER JOIN category ON business.id = category.business_id) 
            INNER JOIN hours ON hours.business_id = category.business_id
      WHERE business.city = 'Toronto' 
      GROUP BY business.is_open;

-- +---------------+--------------------+---------+----------------------+-------------+---------+-------+--------------+
-- | name          | address            | is_open | hours                | category    | city    | stars | review_count |
-- +---------------+--------------------+---------+----------------------+-------------+---------+-------+--------------+
-- | 99 Cent Sushi | 389 Church Street  |       0 | Saturday|11:00-23:00 | Restaurants | Toronto |   2.0 |            5 |
-- | Edulis        | 169 Niagara Street |       1 | Saturday|18:00-23:00 | Restaurants | Toronto |   4.0 |           89 |
-- +---------------+--------------------+---------+----------------------+-------------+---------+-------+--------------+	  
	
-- 3. For this last part of your analysis, you are going to choose the type of analysis 
-- you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

-- Ideas for analysis include: Parsing out keywords and business attributes for sentiment 
-- analysis, clustering businesses to find commonalities or anomalies between them, 
-- predicting the overall star rating for a business, predicting the number of fans a user 
-- will have, and so on. These are just a few examples to get you started, so feel free to 
-- be creative and come up with your own problem you want to solve. Provide answers, 
-- in-line, to all of the following:
	
-- i. Indicate the type of analysis you chose to do:
        
		Illustrating the correlation between review stars with the review couunts.
         
-- ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:
        
		Two tables of business and reviews have been used for the analysis. The two aforementioned tables were being joined 
		based on the id of the business and review. Then the results, which is the review counts of the business, has 
		been sorted in a descending order. 
		The logic behind choosing the two tables of data for the analysis is that number reviews and stars that the business 
		earned from the reviewers. Star depend on the type of service and how well they provide that specific service.
		We can infer that there is a correlation between the number of stars and the review counts. However the correlation is not 
		strong, which could be related scientifically to the behavioral models of the customers and how was their
		experience of the business. 
		
-- iii. Output of your finished dataset:
  
+-------+--------------+
| stars | review_count |
+-------+--------------+
|     4 |          427 |
|     5 |           20 |
|     3 |            8 |
|     5 |            7 |
|     5 |            7 |
|     1 |            6 |
|     5 |            5 |
|     5 |            5 |
|     5 |            4 |
|     4 |            4 |
|     5 |            4 |
|     4 |            4 |
|     5 |            4 |
|     2 |            3 |
+-------+--------------+  
         
-- iv. Provide the SQL code you used to create your final dataset:

SELECT
    review.stars
    ,business.review_count
    FROM review INNER JOIN business ON business.id= review.id
    ORDER BY business.review_count DESC;
	
	
