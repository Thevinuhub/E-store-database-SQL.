# E-store-database-
Users can perform following operations for retrieving informaton:
**Retrieve the list of all users from the Users table.**

sql
SELECT * FROM Users;
2. Retrieve Items:
**Retrieve the list of all items from the Items table**.

sql
SELECT * FROM Items;
3. Retrieve Interactions:
**Retrieve all user-item interactions from the Interactions table**.

sql
SELECT * FROM Interactions;
4. Recommend Most Popular Items:
**Recommend the top 3 most popular items based on the number of interactions**.

sql
SELECT item_id, COUNT(*) AS interaction_count
FROM Interactions
GROUP BY item_id
ORDER BY interaction_count DESC
LIMIT 3;
5. Recommend Items for a User:
**Recommend items for a specific user based on items interacted with by other users who have similar interactions**.

sql
WITH UserInteractions AS (
    SELECT item_id
    FROM Interactions
    WHERE user_id = 1
)

**Find other users who interacted with the same items**
, SimilarUsers AS (
    SELECT user_id
    FROM Interactions
    WHERE item_id IN (SELECT item_id FROM UserInteractions)
      AND user_id != 1
    GROUP BY user_id
)

**Get items interacted with by similar users, excluding items already interacted with by user_id = 1**
SELECT item_id, COUNT(*) AS interaction_count
FROM Interactions
WHERE user_id IN (SELECT user_id FROM SimilarUsers)
  AND item_id NOT IN (SELECT item_id FROM UserInteractions)
GROUP BY item_id
ORDER BY interaction_count DESC
LIMIT 3;
