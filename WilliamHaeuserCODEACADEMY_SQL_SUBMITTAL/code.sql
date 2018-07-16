 
 SELECT DISTINCT response, question
 FROM survey
 GROUP BY 1
 ORDER BY 2 ASC;
 
 
 
 SELECT *
 FROM survey
 LIMIT 10;
 
 
 
 SELECT COUNT(DISTINCT user_id), question
 FROM survey
 WHERE user_id IS NOT NULL
 GROUP BY 2;
 
 SELECT 475.0/500 AS 'Q1 comp rate', 380.0/475 AS 'Q2 comp rate', 361.0/380 AS 'Q3 comp rate', 270.0/361 AS 'Q4 comp rate';

 SELECT *
 FROM quiz
 LIMIT 5;
 
 SELECT *
 FROM home_try_on
 LIMIT 5;
 
 SELECT *
 FROM purchase
 LIMIT 5;

 SELECT DISTINCT quiz.user_id,
   home_try_on.user_id IS NOT NULL AS 'is_home_try_on',
   home_try_on.number_of_pairs,
   purchase.user_id IS NOT NULL AS 'is_purchase'
FROM quiz
LEFT JOIN home_try_on
   ON quiz.user_id = home_try_on.user_id
LEFT JOIN purchase
   ON purchase.user_id = quiz.user_id
LIMIT 10;




SELECT COUNT(DISTINCT quiz.user_id)
FROM quiz;
SELECT COUNT(DISTINCT home_try_on.user_id)
FROM home_try_on;
SELECT COUNT(DISTINCT purchase.user_id)
FROM purchase;


SELECT (495.0/1000)*100 AS 'overall_conv (%)', (750.0/1000)*100 AS 'quiz_to_home_conv (%)', (495.0/750)*100 AS 'home_to_purchase_conv (%)';





WITH joiner AS(
SELECT home_try_on.number_of_pairs, home_try_on.user_id
FROM purchase
LEFT JOIN home_try_on
ON purchase.user_id = home_try_on.user_id)
SELECT COUNT(*) '3 pairs purchase'
FROM joiner
WHERE number_of_pairs = "3 pairs";

WITH joiner AS(
SELECT home_try_on.number_of_pairs, home_try_on.user_id
FROM purchase
LEFT JOIN home_try_on
ON purchase.user_id = home_try_on.user_id)
SELECT COUNT(*) AS '5 pairs purchase'
FROM joiner
WHERE number_of_pairs = "5 pairs";

SELECT (201.0/750)*100 AS '3_pairs_purchase_rate(%)', (294.0/750)*100 AS '5_pairs_purchase_rate(%)';


SELECT COUNT(*) AS 'womens style'
FROM quiz
WHERE style = "Women's Styles";

SELECT COUNT(*) AS 'mens style'
FROM quiz
WHERE style = "Men's Styles";

SELECT COUNT(*) AS 'Im not sure. Lets skip it.'
FROM quiz
WHERE style = "I'm not sure. Let's skip it.";

SELECT COUNT(*) AS 'purchase: womens'
FROM purchase
WHERE style = "Women's Styles";

SELECT COUNT(*) AS 'purchase: mens'
FROM purchase
WHERE style = "Men's Styles";



