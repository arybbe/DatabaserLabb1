--CREATE DATABASE BookStoreDb;
--USE BookStoreDb;

--CREATE TABLE Authors (
--	Id int PRIMARY KEY Identity,
--	FirstName nvarchar(40) NOT NULL,
--	LastName nvarchar(40),
--	Birthdate DATE,
--);


--CREATE TABLE Books(
--	ISBN nvarchar(13) PRIMARY KEY,
--	Title nvarchar(max) NOT NULL,
--	Pages int,
--	[Language] nvarchar(50) NOT NULL,
--	Price decimal,
--	IssueDate DATE	
--);

--CREATE TABLE Stores(
--	Id int PRIMARY KEY Identity,
--	[Name] nvarchar(50) NOT NULL,
--	[Address] nvarchar(50) NOT NULL,
--);

--CREATE TABLE Inventory(
--	[StoreId] int NOT NULL,
--	[ISBN] nvarchar(13) NOT NULL,
--	[Quantity] int NOT NULL,
--	CONSTRAINT PK_InventoryBalance PRIMARY KEY ([StoreId], [ISBN]),
--	CONSTRAINT FK_StoreId_Store FOREIGN KEY ([StoreId]) REFERENCES Stores(Id),
--	CONSTRAINT FK_ISBN_Books FOREIGN KEY ([ISBN]) REFERENCES Books(ISBN),
--);

--CREATE TABLE Customers(
--	Id int PRIMARY KEY Identity,
--	FirstName nvarchar(50) NOT NULL,
--	LastName nvarchar(50),
--	City nvarchar(50) NOT NULL,
--);

--CREATE TABLE Orders(
--	Id int PRIMARY KEY Identity,
--	CustomerId int FOREIGN KEY REFERENCES Customers(Id),
--	StoreId int FOREIGN KEY REFERENCES Stores(Id),
--	OrderDate DATE
--);

--CREATE TABLE OrderDetails (
--    OrderId int FOREIGN KEY REFERENCES Orders(Id),
--    ISBN nvarchar(13) FOREIGN KEY REFERENCES Books(ISBN),
--    Quantity int,
--    PRIMARY KEY (OrderId, ISBN)
--);


--CREATE TABLE AuthorBooks (
--    AuthorId int FOREIGN KEY REFERENCES Authors(Id),
--    ISBN nvarchar(13) FOREIGN KEY REFERENCES Books(ISBN),
--    PRIMARY KEY (AuthorId, ISBN)
--);



--CREATE VIEW vTitlesPerAuthor AS
--SELECT 
--    CONCAT(FirstName, ' ', LastName) AS [Name],
--    DATEDIFF(YEAR, Birthdate, GETDATE()) - 
--    CASE 
--        WHEN (MONTH(Birthdate) > MONTH(GETDATE()) OR 
--             (MONTH(Birthdate) = MONTH(GETDATE()) AND DAY(Birthdate) > DAY(GETDATE())))
--        THEN 1
--        ELSE 0
--    END AS Age,
--    COUNT(Books.ISBN) AS Titles,
--    SUM(Inventory.Quantity * Books.Price) AS InventoryValue
--FROM Authors
--JOIN AuthorBooks ON Authors.Id = AuthorBooks.AuthorId
--JOIN Books ON AuthorBooks.ISBN = Books.ISBN
--JOIN Inventory ON Books.ISBN = Inventory.ISBN
--GROUP BY FirstName, LastName, Birthdate;




--INSERT INTO Authors (FirstName, LastName, Birthdate)
--VALUES 
--('Astrid', 'Lindgren', '1907-11-14'),
--('John', 'Tolkien', '1892-01-03'),
--('George', 'Martin', '1948-09-20'),
--('George', 'Lucas', '1944-05-14'),
--('Andrzej', 'Sapkowski', '1948-06-21'),
--('Joanne', 'Rowling', '1965-07-31'),
--('Francis', 'Fitzgerald', '1896-09-24')
--;


--INSERT INTO Books (ISBN, Title, Pages, Language, Price, IssueDate)
--VALUES
--('9789129687316', 'Stora Emilboken', 381, 'Svenska', 199, '2013-03-21'),
--('9789129711929', 'Pippi firar jul', 20, 'Svenska', 79, '2018-10-19'),
--('9789113084930', 'Silmarillion', 400, 'Svenska', 229, '2019-08-28'),
--('9789113084893', 'Hobbiten', 283, 'Svenska', 199, '2019-08-29'),
--('9789113084894', 'Ringens brödraskap', 320, 'Svenska', 219, '2020-02-15'),
--('9789113084895', 'Sagan om de två tornen', 352, 'Svenska', 229, '2020-05-12'),
--('9789113084896', 'Konungens återkomst', 416, 'Svenska', 249, '2020-08-18'),
--('9789129711936', 'Karlsson på taket', 128, 'Svenska', 99, '2015-11-07'),
--('9789129711943', 'Mio, min Mio', 240, 'Svenska', 149, '2016-08-23'),
--('9789129723151', 'Harry Potter och de vises sten', 352, 'Svenska', 199, '2018-03-12'),
--('9789129723168', 'Harry Potter och Hemlighetens kammare', 384, 'Svenska', 219, '2019-01-05'),
--('9789129723175', 'Harry Potter och Fången från Azkaban', 448, 'Svenska', 249, '2020-06-10'),
--('9789129723182', 'Harry Potter och Den flammande bägaren', 672, 'Svenska', 299, '2021-02-28'),
--('9789129723199', 'Harry Potter och Fenixorden', 992, 'Svenska', 349, '2022-01-15'),
--('9789129723205', 'Harry Potter och Halvblodsprinsen', 704, 'Svenska', 319, '2022-09-20'),
--('9789129723212', 'Harry Potter och Dödsrelikerna', 800, 'Svenska', 369, '2023-04-30');

--INSERT INTO Books (ISBN, Title, Pages, Language, Price, IssueDate)
--VALUES
--('9780008307738', 'Fire and Blood', 704, 'Engelska', 449, '2018-11-20'),
--('9780553805444', 'World Of Ice & Fire', 326, 'Engelska', 709, '2014-10-28'),
--('9780345341464', 'Star Wars: A new hope', 224, 'Engelska', 109, '1986-09-12'),
--('9780571203055', 'The Return of the Jedi', 144, 'Engelska', 149, '2000-02-01'),
--('9789198616880', 'Alvblod', 323, 'Svenska', 269, '2020-12-18'),
--('9789198616828', 'Den sista önskningen : berättelser om Geralt av Rivia', 319, 'Svenska', 269, '2020-06-29');
--('9789198379600', 'Natten är ljuv', 432, 'Svenska', 349, '2017-10-20'),
--('9781640322790', 'The Great Gatsby', 88, 'Engelska', 309, '1925-01-01'),

--INSERT INTO AuthorBooks (AuthorId, ISBN)
--VALUES
--(1, '9789129687316'),
--(1, '9789129711929'),
--(1, '9789129711936'),
--(1, '9789129711943');

--INSERT INTO AuthorBooks (AuthorId, ISBN)
--VALUES
--(2, '9789113084930'),
--(2, '9789113084893'),
--(2, '9789113084894'),
--(2, '9789113084895'),
--(2, '9789113084896');

--INSERT INTO AuthorBooks (AuthorId, ISBN)
--VALUES
--(6, '9789129723151'),
--(6, '9789129723168'),
--(6, '9789129723175'),
--(6, '9789129723182'),
--(6, '9789129723199'),
--(6, '9789129723205'),
--(6, '9789129723212');



--INSERT INTO AuthorBooks (AuthorId, ISBN)
--VALUES
--(3, '9780008307738'),
--(3, '9780553805444'),
--(4, '9780345341464'),
--(4, '9780571203055'),
--(5, '9789198616880'),
--(5, '9789198616828'),
--(7, '9789198379600'),
--(7, '9781640322790');



--INSERT INTO Stores ([Name], [Address])
--VALUES
--('SF Bokhandeln', 'Sveavägen 56, 111 34 Stockholm, Sweden'),
--('Akademibokhandeln', 'Mäster Samuelsgatan 36, 111 57 Stockholm, Sweden'),
--('Bookshop', 'Lundagatan 24, 118 58 Stockholm, Sweden');

--INSERT INTO Inventory ([StoreId], [ISBN], [Quantity])
--VALUES
--(1, '9789113084930', 10),
--(1, '9789129687316', 15),
--(1, '9789129711929', 5),
--(1, '9789113084893', 20),
--(1, '9789113084894', 15),
--(2, '9789113084895', 12),
--(2, '9789113084896', 8),
--(2, '9789129711936', 7),
--(2, '9789129711943', 10),
--(3, '9789129723151', 25),
--(3, '9789129723168', 18),
--(3, '9789129723175', 15),
--(3, '9789129723182', 10),
--(3, '9789129723199', 7),
--(3, '9789129723205', 5),
--(3, '9789129723212', 3);

--INSERT INTO Inventory ([StoreId], [ISBN], [Quantity])
--VALUES
--(1, '9781640322790', 10),
--(1, '9789198379600', 15),
--(1, '9780008307738', 5),
--(2, '9780553805444', 20),
--(2, '9780345341464', 15),
--(2, '9780571203055', 12),
--(3, '9789198616880', 8),
--(3, '9789198616828', 10);

--INSERT INTO Customers (FirstName, LastName, City)
--VALUES
--('Adam', 'Ryberg', 'Lindome'),
--('Will', 'Smith', 'Los Angeles'),
--('Sven', 'Andersson', 'Kiruna'),
--('Rikard', 'Andersson', 'Gothenburg'),
--('Ed', 'Sheeran', 'London'),
--('Dejan', 'Kulusevski', 'London'),
--('Alexander', 'Isak', 'Newcastle')
--;

--INSERT INTO Orders (CustomerId, StoreId, OrderDate)
--VALUES
--(1, 1, '2023-05-01'),
--(2, 2, '2023-05-02'),
--(3, 3, '2023-05-03');

--INSERT INTO OrderDetails (OrderId, ISBN, Quantity)
--VALUES
--(1, '9789113084930', 2),
--(1, '9789129687316', 1),
--(2, '9789129711929', 3),
--(2, '9789113084893', 4),
--(3, '9789129723151', 5),
--(3, '9789129723168', 2),
--(3, '9789129723175', 3);
