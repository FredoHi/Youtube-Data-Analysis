use youtube_stats;



-- Total Comments for Each Keyword
-- This query calculates the total number of comments for each keyword. 
-- By summing up the "comments" column from the "video_stat" table and grouping the results by the "keyword" column, the query reveals which keywords attract the most user comments

SELECT 
    keyword, SUM(comments) AS num_comments
FROM
    video_stat
GROUP BY keyword
ORDER BY num_comments DESC;


-- Query 2: Total Likes for Each Keyword
-- In this query, the total number of likes for each keyword is calculated. 
-- The "likes" column from the "video_stat" table is summed up, and the results are grouped by the "keyword" column. The query helps identify the keywords that receive the most likes from viewers.
SELECT 
    keyword, SUM(likes) AS num_likes
FROM
    video_stat
GROUP BY keyword
ORDER BY num_likes DESC;



-- Query 3: Total Views for Each Keyword
-- This query calculates the total number of views for each keyword. 
-- By summing up the "views" column from the "video_stat" table and grouping the results by the "keyword" column, the query provides insights into the popularity of videos associated with each keyword.

SELECT 
    keyword,
    SUM(views) AS num_of_views
FROM
    video_stat
GROUP BY keyword
ORDER BY num_of_views DESC;


-- Query 4: Most-Liked Comments
-- This query identifies the most-liked comments for each keyword. 
-- It achieves this by joining the "video_stat" table with the "comment_stat" table on the "VideoID" column and then summing up the "likes" column from the "comment_stat" table.
-- The results are grouped by the "keyword" column from the "video_stat" table, allowing the project team to identify the most engaging comments for each keyword

SELECT 
    v.keyword, SUM(c.likes) AS num_of_comments_liked
FROM
    video_stat v
        JOIN
    comment_stat c ON v.VideoID = c.VideoID
GROUP BY v.keyword
ORDER BY num_of_comments_liked DESC;


-- Query 5: Ratio of Video Views/Likes per Keyword
-- The fifth query calculates the ratio of video views to likes for each keyword.
-- By summing up the "views" and "likes" columns from the "video_stat" table and dividing the total views by the total likes for each keyword, the query provides insights into viewer engagement and preference for specific content.

SELECT 
    keyword,
    SUM(views) AS total_view,
    SUM(likes) AS total_likes,
    Round((SUM(views) / SUM(likes)),2) AS ratio
FROM
    video_stat
GROUP BY keyword;


-- Query 6: Average Sentiment Score in Each Keyword
-- Finally, the sixth query calculates the average sentiment score for each keyword.
-- To achieve this, the "video_stat" table is joined with the "comment_stat" table on the "VideoID" column, and the average sentiment score is calculated using the AVG() function on the "sentiment" column from the "comment_stat" table. 
-- This analysis helps understand the overall sentiment of the comments associated with each keyword, which can guide content creators in tailoring their video content to match viewer preferences.

SELECT 
    V.keyword, AVG(c.sentiment) AS avg_score
FROM
    video_stat v
        JOIN
    comment_stat c ON v.VideoID = c.VideoID
GROUP BY v.keyword;


 