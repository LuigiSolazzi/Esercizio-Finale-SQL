-- Creazione database ToysGroup;
create database ToysGroup;
use Toysgroup;

-- Creazione tabella Product;
create table Product (
	ProductID int unsigned not null auto_increment ,
	ProductName varchar(50) not null,
	UnitCost decimal(5,2) not null,
	Category varchar(50) not null,
	primary key (ProductID)
);

-- Creazione tabella Region;
create table Region (
	RegionID int unsigned not null auto_increment ,
	RegionName varchar(50) not null,
	primary key (RegionID)
);

-- Creazione tabella Sales;
CREATE TABLE Sales (
    SalesID int unsigned not null auto_increment,
    Date date not null,
    ProductID int unsigned not null,
    RegionID int unsigned not null,
    Quantity int not null, 
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (RegionID) REFERENCES Region(RegionID),
    PRIMARY KEY (SalesID)
);

-- Popolamento della tabella Product
INSERT INTO Product (ProductName, UnitCost, Category) VALUES
('Action Figure', 12.99, 'Toys'),
('Doll', 9.99, 'Toys'),
('Board Game', 19.99, 'Games'),
('LEGO Set', 29.99, 'Toys'),
('Puzzle', 8.99, 'Games'),
('Stuffed Animal', 14.99, 'Toys'),
('Remote Control Car', 24.99, 'Toys'),
('Building Blocks', 17.99, 'Toys'),
('Model Kit', 21.99, 'Hobbies'),
('Educational Toy', 11.99, 'Toys'),
('Toy Train', 18.99, 'Toys'),
('Outdoor Playset', 249.99, 'Outdoor'),
('Toy Kitchen Set', 39.99, 'Toys'),
('Art Set', 16.99, 'Crafts'),
('Remote Control Drone', 49.99, 'Toys'),
('Musical Instrument', 29.99, 'Toys'),
('Sports Equipment', 34.99, 'Sports'),
('Model Train Set', 59.99, 'Hobbies'),
('Toy Robot', 22.99, 'Toys'),
('Educational Puzzle', 13.99, 'Toys');

-- Popolamento della tabella Region
INSERT INTO Region (RegionName) VALUES
('Italia'),
('Spagna'),
('Francia'),
('Germania'),
('Belgio'),
('Olanda'),
('Brasile'),
('Cina'),
('Giappone'),
('Australia');

-- Popolamento della tabella Sales da ripetere ogni volta per un anno diverso
INSERT INTO Sales (Date, ProductID, RegionID, Quantity)
SELECT 
    DATE_ADD('2020-01-01', INTERVAL FLOOR(RAND() * 365) DAY), -- Data casuale nell'anno 
    FLOOR(RAND() * 20) + 1 AS ProductID, -- ProductID casuale tra 1 e 20
    FLOOR(RAND() * 10) + 1 AS RegionID, -- RegionID casuale tra 1 e 10
    FLOOR(RAND() * 50) + 1 AS Quantity -- Quantità casuale tra 1 e 50
FROM
    (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL
     SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10) AS a,
    (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL
     SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10) AS b
LIMIT 500;

INSERT INTO Sales (Date, ProductID, RegionID, Quantity)
SELECT 
    DATE_ADD('2021-01-01', INTERVAL FLOOR(RAND() * 365) DAY), -- Data casuale nell'anno 
    FLOOR(RAND() * 20) + 1 AS ProductID, -- ProductID casuale tra 1 e 20
    FLOOR(RAND() * 10) + 1 AS RegionID, -- RegionID casuale tra 1 e 10
    FLOOR(RAND() * 50) + 1 AS Quantity -- Quantità casuale tra 1 e 50
FROM
    (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL
     SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10) AS a,
    (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL
     SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10) AS b
LIMIT 500;

INSERT INTO Sales (Date, ProductID, RegionID, Quantity)
SELECT 
    DATE_ADD('2022-01-01', INTERVAL FLOOR(RAND() * 365) DAY), -- Data casuale nell'anno 
    FLOOR(RAND() * 20) + 1 AS ProductID, -- ProductID casuale tra 1 e 20
    FLOOR(RAND() * 10) + 1 AS RegionID, -- RegionID casuale tra 1 e 10
    FLOOR(RAND() * 50) + 1 AS Quantity -- Quantità casuale tra 1 e 50
FROM
    (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL
     SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10) AS a,
    (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL
     SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10) AS b
LIMIT 500;

INSERT INTO Sales (Date, ProductID, RegionID, Quantity)
SELECT 
    DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND() * 365) DAY), -- Data casuale nell'anno 
    FLOOR(RAND() * 20) + 1 AS ProductID, -- ProductID casuale tra 1 e 20
    FLOOR(RAND() * 10) + 1 AS RegionID, -- RegionID casuale tra 1 e 10
    FLOOR(RAND() * 50) + 1 AS Quantity -- Quantità casuale tra 1 e 50
FROM
    (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL
     SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10) AS a,
    (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL
     SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10) AS b
LIMIT 500;

INSERT INTO Sales (Date, ProductID, RegionID, Quantity)
SELECT 
    DATE_ADD('2024-01-01', INTERVAL FLOOR(RAND() * 365) DAY), -- Data casuale nell'anno 
    FLOOR(RAND() * 20) + 1 AS ProductID, -- ProductID casuale tra 1 e 20
    FLOOR(RAND() * 10) + 1 AS RegionID, -- RegionID casuale tra 1 e 10
    FLOOR(RAND() * 50) + 1 AS Quantity -- Quantità casuale tra 1 e 50
FROM
    (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL
     SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10) AS a,
    (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL
     SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10) AS b
LIMIT 500;