 -- إنشاء الجداول بناءً على المابينج (مع مراعاة أسماء الأعمدة والروابط الظاهرة في الرسم)

CREATE TABLE CATEGORY (
    id INT PRIMARY KEY, -- معرف الفئة الأساسي
    [primary] VARCHAR(255), -- الفئة الرئيسية (استخدمنا أقواس مربعة لأن primary كلمة محجوزة في SQL)
    secondary VARCHAR(255), -- الفئة الثانوية[cite: 5]
    tertiary VARCHAR(255) -- الفئة الفرعية الثالثة[cite: 5]
);

CREATE TABLE PRODECT (
    ID INT PRIMARY KEY, -- معرف المنتج الأساسي (مكتوب PRODECT كما في الرسم)[cite: 5]
    NAME VARCHAR(255), -- اسم المنتج[cite: 5]
    SIZE VARCHAR(100), -- حجم المنتج[cite: 5]
    PRICE DECIMAL(10, 2), -- سعر المنتج[cite: 5]
    LOVES INT, -- عدد الإعجابات[cite: 5]
    RATING DECIMAL(3, 2), -- التقييم[cite: 5]
    CATEGOR_ID INT, -- مفتاح أجنبي يشير إلى جدول CATEGORY[cite: 5]
    CONSTRAINT FK_PRODECT_CATEGORY FOREIGN KEY (CATEGOR_ID) REFERENCES CATEGORY(id)
);

CREATE TABLE VARIATION (
    ID INT PRIMARY KEY, -- معرف التنوع الأساسي[cite: 5]
    TYPE VARCHAR(100), -- نوع التنوع[cite: 5]
    VALUE VARCHAR(100), -- قيمة التنوع[cite: 5]
    DESCRIPTION VARCHAR(255), -- وصف التنوع[cite: 5]
    PRODUCT_ID INT, -- مفتاح أجنبي يشير إلى جدول PRODECT[cite: 5]
    CONSTRAINT FK_VARIATION_PRODECT FOREIGN KEY (PRODUCT_ID) REFERENCES PRODECT(ID)
);

CREATE TABLE INGREDIENT (
    ID INT PRIMARY KEY, -- معرف المكون الأساسي[cite: 5]
    NAME VARCHAR(255) -- اسم المكون[cite: 5]
);

CREATE TABLE HIGHLIGHT (
    HIGHLIGHTID INT PRIMARY KEY, -- معرف الميزة/الهايلايت الأساسي (مكتوب HIGHLIGHTID كما في الرسم)[cite: 5]
    NAME VARCHAR(255) -- اسم الهايلايت[cite: 5]
);

CREATE TABLE PRODECT_INGREDIENT (
    PRODECT_ID INT, -- جزء من المفتاح المركب ومفتاح أجنبي لـ PRODECT[cite: 5]
    INGREDIENT_ID INT, -- جزء من المفتاح المركب ومفتاح أجنبي لـ INGREDIENT[cite: 5]
    PRIMARY KEY (PRODECT_ID, INGREDIENT_ID),
    CONSTRAINT FK_PI_PRODECT FOREIGN KEY (PRODECT_ID) REFERENCES PRODECT(ID),
    CONSTRAINT FK_PI_INGREDIENT FOREIGN KEY (INGREDIENT_ID) REFERENCES INGREDIENT(ID)
);

CREATE TABLE PRODECT_HIGHLIGH (
    PRODUCT_ID INT, -- جزء من المفتاح المركب ومفتاح أجنبي لـ PRODECT[cite: 5]
    HIGHLIGH_ID INT, -- جزء من المفتاح المركب ومفتاح أجنبي لـ HIGHLIGHT[cite: 5]
    PRIMARY KEY (PRODUCT_ID, HIGHLIGH_ID),
    CONSTRAINT FK_PH_PRODECT FOREIGN KEY (PRODUCT_ID) REFERENCES PRODECT(ID),
    CONSTRAINT FK_PH_HIGHLIGHT FOREIGN KEY (HIGHLIGH_ID) REFERENCES HIGHLIGHT(HIGHLIGHTID)
);
