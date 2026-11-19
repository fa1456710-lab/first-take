USE TASK1;
GO

-- السؤال 1: كام منتج عندنا في كل فئة رئيسية؟ (COUNT + JOIN)
SELECT C.[primary], COUNT(P.ID) AS Products_Count
FROM PRODECT P
JOIN CATEGORY C ON P.CATEGOR_ID = C.id
GROUP BY C.[primary];

-- السؤال 2: إجمالي الإعجابات لكل فئة ثانوية؟ (SUM + JOIN)
SELECT C.secondary, SUM(P.LOVES) AS Total_Loves
FROM PRODECT P
JOIN CATEGORY C ON P.CATEGOR_ID = C.id
GROUP BY C.secondary;

-- السؤال 3: متوسط سعر المنتجات في كل فئة؟ (AVG + JOIN)
SELECT C.[primary], AVG(P.PRICE) AS Avg_Price
FROM PRODECT P
JOIN CATEGORY C ON P.CATEGOR_ID = C.id
GROUP BY C.[primary];

-- السؤال 4: أقل وأعلى سعر منتج في كل نوع تنوع؟ (MIN + MAX + JOIN)
SELECT V.TYPE, MIN(P.PRICE) AS Min_Price, MAX(P.PRICE) AS Max_Price
FROM PRODECT P
JOIN VARIATION V ON P.ID = V.PRODUCT_ID
GROUP BY V.TYPE;

-- السؤال 5: إيه المنتجات اللي اسمها يبدأ بـ Cream ومكوناتها إيه؟ (LIKE + JOIN)
SELECT P.NAME AS Product_Name, I.NAME AS Ingredient_Name
FROM PRODECT P
JOIN PRODECT_INGREDIENT PI ON P.ID = PI.PRODECT_ID
JOIN INGREDIENT I ON PI.INGREDIENT_ID = I.ID
WHERE P.NAME LIKE 'Cream%';

-- السؤال 6: إيه المنتجات اللي فيها كلمة Serum وعدد الـ Highlights بتاعتها؟ (LIKE + COUNT + JOIN)
SELECT P.NAME, COUNT(PH.HIGHLIGH_ID) AS Highlights_Count
FROM PRODECT P
JOIN PRODECT_HIGHLIGH PH ON P.ID = PH.PRODUCT_ID
WHERE P.NAME LIKE '%Serum%'
GROUP BY P.NAME;