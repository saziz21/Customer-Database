DROP TABLE Customer CASCADE CONSTRAINTS;
DROP TABLE CUSTOMERS CASCADE CONSTRAINTS;
DROP TABLE PRODUCTLINES CASCADE CONSTRAINTS;
DROP TABLE Territory CASCADE CONSTRAINTS;
DROP TABLE TERRITORY1 CASCADE CONSTRAINTS;
DROP TABLE SalesPerson CASCADE CONSTRAINTS;
DROP TABLE DoesBusinessIn CASCADE CONSTRAINTS;
DROP TABLE ProductLine CASCADE CONSTRAINTS;
DROP TABLE Product CASCADE CONSTRAINTS;
DROP TABLE Orderr CASCADE CONSTRAINTS;
DROP TABLE OrderLine CASCADE CONSTRAINTS;
DROP TABLE PriceUpdate CASCADE CONSTRAINTS;

/*create the table Customer*/
CREATE TABLE Customer (
    CustomerID 			INTEGER CONSTRAINT Customer_cusid_pk PRIMARY KEY,
    CustomerName		CHAR(40),
    CustomerAddress		CHAR(60),
    CustomerCity		CHAR(20),
    CustomerState		CHAR(2),
    CustomerPostalCode	CHAR(10),
    CustomerEmail 		CHAR(40),
    CustomerUserName	CHAR(15),
    CustomerPassword		CHAR(15));

INSERT INTO Customer VALUES ( 1, 'Contemporary Casuals', '1355 S Hines Blvd', 'Gainesville', 'FL', '32601-2871', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 2, 'Value Furnitures', '15145 S.W. 17th St.', 'Plano', 'TX', '75094-7734', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 3, 'Home Furnishings', '1900 Allard Ave', 'Albany', 'NY', '12209-1125', 'homefurnishings?@gmail.com', 'CUSTOMER1', 'CUSTOMER1#' );
INSERT INTO Customer VALUES ( 4, 'Eastern Furniture', '1925 Beltline Rd.', 'Carteret', 'NJ', '07008-3188', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 5, 'Impressions', '5585 Westcott Ct.', 'Sacramento', 'CA', '94206-4056', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 6, 'Furniture Gallery', '325 Flatiron Dr.', 'Boulder', 'CO', '80514-4432', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 7, 'New Furniture', 'Palace Ave', 'Farmington', 'NM', '', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 8, 'Dunkins Furniture', '7700 Main St', 'Syracuse', 'NY', '31590', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 9, 'A Carpet', '434 Abe Dr', 'Rome', 'NY', '13440', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 12, 'Flanigan Furniture', 'Snow Flake Rd', 'Ft Walton Beach', 'FL', '32548', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 13, 'Ikards', '1011 S. Main St', 'Las Cruces', 'NM', '88001', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 14, 'Wild Bills', 'Four Horse Rd', 'Oak Brook', 'Il', '60522', NULL, NULL, NULL );
INSERT INTO Customer VALUES ( 15, 'Janet''s Collection', 'Janet Lane', 'Virginia Beach', 'VA', '10012', NULL, NULL, NULL);
INSERT INTO Customer VALUES ( 16, 'ABC Furniture Co.', '152 Geramino Drive', 'Rome', 'NY', '13440', NULL, NULL, NULL );

	
/*Order table*/

CREATE TABLE Orderr (
    OrderID INTEGER CONSTRAINT Orderr_oid_pk PRIMARY KEY,
    OrderDate DATE,
    CustomerID NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES customer(CustomerID));
    
INSERT INTO Orderr VALUES ( 1001, Date '2016-8-21', 1 );
INSERT INTO Orderr VALUES ( 1002, Date '2016-7-21', 8 );
INSERT INTO Orderr VALUES ( 1003, Date '2016-8-22' , 15 );
INSERT INTO Orderr VALUES ( 1004, Date '2016-10-22', 5 );
INSERT INTO Orderr VALUES ( 1005, Date '2016-7-24', 3 );
INSERT INTO Orderr VALUES ( 1006, Date '2016-10-24', 2 );
INSERT INTO Orderr VALUES ( 1007, Date '2016-8-27', 5 );
INSERT INTO Orderr VALUES ( 1008, Date '2016-10-30', 12 );
INSERT INTO Orderr VALUES ( 1009, Date '2016-11-05', 4 );
INSERT INTO Orderr VALUES ( 1010, Date '2016-11-05', 1 );



/*Territory table*/
CREATE TABLE Territory (
    TerritoryID INTEGER CONSTRAINT SaleTerritory_terid_pk PRIMARY KEY,
    TerritoryName CHAR(30));
 
    
INSERT INTO Territory VALUES ( 1, 'SouthEast' );
INSERT INTO Territory VALUES ( 2, 'SouthWest' );
INSERT INTO Territory VALUES ( 3, 'NorthEast' );
INSERT INTO Territory VALUES ( 4, 'NorthWest' );
INSERT INTO Territory VALUES ( 5, 'Central' );

   
/*DoesBusinessIn table*/
CREATE TABLE DoesBusinessIn (
    CustomerID INTEGER NOT NULL,
    TerritoryID INTEGER NOT NULL,
    PRIMARY KEY(CustomerID, TerritoryID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (TerritoryID) REFERENCES Territory(TerritoryID));    
	

INSERT INTO DoesBusinessIn VALUES ( 1, 1 );
INSERT INTO DoesBusinessIn VALUES ( 2, 2 );
INSERT INTO DoesBusinessIn VALUES ( 3, 3 );
INSERT INTO DoesBusinessIn VALUES ( 4, 4 );
INSERT INTO DoesBusinessIn VALUES ( 5, 5 );
INSERT INTO DoesBusinessIn VALUES ( 6, 1 );
INSERT INTO DoesBusinessIn VALUES ( 7, 2 );


/*SalesPerson table*/
CREATE TABLE SalesPerson (
    SalespersonID INTEGER CONSTRAINT Saleperson_perid_pk PRIMARY KEY,
    SalespersonName CHAR(30),
    SalespersonPhone CHAR(10),
    SalespersonEmail CHAR(40),
    SalespersonUserName CHAR(15),
    SalespersonPassword CHAR(15),
    TerritoryID INTEGER NOT NULL,
    FOREIGN KEY (TerritoryID) REFERENCES Territory(TerritoryID));
	
INSERT INTO SalesPerson VALUES ( 1, 'Doug Henny', '8134445555', 'salesperson?@gmail.com', 'SALESPERSON', 'SALESPERSON#', 1 );
INSERT INTO SalesPerson VALUES ( 2, 'Robert Lewis', '8139264006', '', '', '', 2 );
INSERT INTO SalesPerson VALUES ( 3, 'William Strong', '5053821212', '', '', '', 3 );
INSERT INTO SalesPerson VALUES ( 4, 'Julie Dawson', '4355346677', '', '', '', 4 );
INSERT INTO SalesPerson VALUES ( 5, 'Jacob Winslow', '2238973498', '', '', '', 5 );


/*ProductLine table*/	
CREATE TABLE ProductLine (
    ProductLineID INTEGER CONSTRAINT ProductLine_plid_pk PRIMARY KEY ,
    ProductLineName CHAR(20));
    
INSERT INTO ProductLine VALUES ( 1, 'Cherry Tree' );
INSERT INTO ProductLine VALUES ( 2, 'Scandinavia' );
INSERT INTO ProductLine VALUES ( 3, 'Country Look' );


/*Product table*/
CREATE TABLE Product (
    ProductID INTEGER CONSTRAINT Product_prodid_pk PRIMARY KEY,
    ProductName CHAR(20),
    ProductFinish CHAR(20),
    ProductStandardPrice INTEGER,
    ProductLineID INTEGER NOT NULL,
    Photo CHAR(10),
    FOREIGN KEY (ProductLineID) REFERENCES productline(ProductLineID));

INSERT INTO Product VALUES ( 1, 'End Table', 'Cherry', 175, 1, 'table.jpg' );
INSERT INTO Product VALUES ( 2, 'Coffee Table', 'Natural Ash', 200, 2, NULL );
INSERT INTO Product VALUES ( 3, 'Computer Desk', 'Natural Ash', 375, 2, NULL );
INSERT INTO Product VALUES ( 4, 'Entertainment Center', 'Natural Maple', 650, 3, NULL );
INSERT INTO Product VALUES ( 5, 'Writers Desk', 'Cherry', 325, 1, NULL );
INSERT INTO Product VALUES ( 6, '8-Drawer Desk', 'White Ash', 750, 2, NULL );
INSERT INTO Product VALUES ( 7, 'Dining Table', 'Natural Ash', 800, 2, NULL );
INSERT INTO Product VALUES ( 8, 'Computer Desk', 'Walnut', 250, 3, NULL );

/*OrderLine table*/
CREATE TABLE OrderLine (
    OrderID INTEGER NOT NULL,
    ProductID INTEGER NOT NULL,
    OrderedQuantity INTEGER,
    SalePrice INTEGER,
    PRIMARY KEY(OrderID, ProductID),
    FOREIGN KEY(OrderID) REFERENCES Orderr(OrderID),
    FOREIGN KEY(ProductID) REFERENCES Product(ProductID));
 
INSERT INTO OrderLine VALUES ( 1001, 1, 2, NULL );
INSERT INTO OrderLine VALUES ( 1001, 2, 2, NULL );
INSERT INTO OrderLine VALUES ( 1001, 4, 1, NULL );
INSERT INTO OrderLine VALUES ( 1002, 3, 5, NULL );
INSERT INTO OrderLine VALUES ( 1003, 3, 3, NULL );
INSERT INTO OrderLine VALUES ( 1004, 6, 2, NULL );
INSERT INTO OrderLine VALUES ( 1004, 8, 2, NULL );
INSERT INTO OrderLine VALUES ( 1005, 4, 4, NULL );
INSERT INTO OrderLine VALUES ( 1006, 4, 1, NULL );
INSERT INTO OrderLine VALUES ( 1006, 5, 2, NULL );
INSERT INTO OrderLine VALUES ( 1006, 7, 2, NULL );
INSERT INTO OrderLine VALUES ( 1007, 1, 3, NULL );
INSERT INTO OrderLine VALUES ( 1007, 2, 2, NULL );
INSERT INTO OrderLine VALUES ( 1008, 3, 3, NULL );
INSERT INTO OrderLine VALUES ( 1008, 8, 3, NULL );
INSERT INTO OrderLine VALUES ( 1009, 4, 2, NULL );
INSERT INTO OrderLine VALUES ( 1009, 7, 3, NULL );
INSERT INTO OrderLine VALUES ( 1010, 8, 10, NULL );
   
   
CREATE TABLE PriceUpdate (
    PriceUpdateID INTEGER CONSTRAINT PriceUpdate_puid_pk PRIMARY KEY,
    DateChanged DATE,
    OldPrice INTEGER,
    NewPrice INTEGER
);
	
/*6 VIEWS*/
/*Product Line Sales Comparison REPORT*/
/*drop view for Product Line Sales Comparison REPORT*/
DROP VIEW Product_Line_Sales_Comparison;
/*create view for Product Line Sales Comparison REPORT*/
CREATE VIEW Product_Line_Sales_Comparison AS
  SELECT PL.ProductLineID, PR.ProductID, PR.ProductName, SUM(OL.OrderedQuantity) AS sumquantity
  FROM Product PR 
  JOIN ProductLine PL ON (PR.ProductLineID = PL.ProductLineID) 
  JOIN OrderLine OL ON (PR.ProductID = OL.ProductID)
  GROUP BY PL.ProductLineID, PR.ProductID, PR.ProductName;
  
/*Total Value for Products REPORT*/
/*drop view for Total Value for Products REPORT*/
DROP VIEW Total_Value_for_Products;
/*create view for Total Value for Products REPORT*/
CREATE VIEW Total_Value_for_Products AS
  SELECT O.OrderID, PR.ProductID, PR.ProductName, SUM(OL.SalePrice) AS sumprice
  FROM OrderLine OL 
  JOIN Orderr O ON (OL.OrderID = O.OrderID) 
  JOIN Product PR ON (OL.ProductID = PR.ProductID)
  GROUP BY O.OrderID, PR.ProductID, PR.ProductName;
  
  
/*Data for Customer REPORT*/
/*drop view for Data for Customer REPORT*/
DROP VIEW Data_for_Customer;
/*create view for Data for Customer REPORT*/
CREATE VIEW Data_for_Customer AS
  SELECT ST.TerritoryID, PR.ProductID, PR.ProductStandardPrice
  FROM Territory ST, Customer CU, Orderr O, OrderLine OL, Product PR, DoesBusinessIn DB
  WHERE ST.TerritoryID = DB.TerritoryID AND DB.CustomerID = CU.CustomerID 
    AND CU.CustomerID = O.CustomerID AND O.OrderID = OL.OrderID AND OL.ProductID = PR.ProductID;
  
/*Customer by States Shipment REPORT*/
/*drop view for Customer by States Shipment REPORT*/
DROP VIEW Customer_by_States_Shipment;
/*create view for Customer by States Shipment REPORT*/
CREATE VIEW Customer_by_States_Shipment AS
  SELECT COUNT(CustomerID) AS customercount, CustomerAddress, CustomerCity, CustomerState
  FROM Customer
  GROUP BY CustomerAddress, CustomerCity, CustomerState;
  
/*Past Purchase History REPORT*/
/*drop view for Past Purchase History REPORT*/
DROP VIEW Past_Purchase_History;
/*create view for Past Purchase History REPORT*/
CREATE VIEW Past_Purchase_History AS
  SELECT O.OrderID, O.OrderDate, OL.OrderedQuantity, PR.ProductName, PR.ProductStandardPrice
  FROM OrderLine OL 
  JOIN Orderr O ON (OL.OrderID = O.OrderID) 
  JOIN Product PR ON (OL.ProductID = PR.ProductID);
  
/*Product Manager Support*/
/*drop view for Product Manager Support*/
DROP VIEW Product_Manager_Support;
/*create view for Product Manager Support*/
CREATE VIEW Product_Manager_Support AS
  SELECT Cu.CustomerID, Cu.CustomerName, Cu.CustomerPostalCode, Pr.ProductID, Pr.ProductName, Pr.ProductFinish, Pr.ProductStandardPrice, 
          Pr.ProductLineID, Pl.ProductLineName, O.OrderID, O.OrderDate, O.CustomerID orderredCustomerid, Ol.OrderID orderlineOrderid, 
          Ol.ProductID orderlineProdid, Ol.OrderedQuantity
  FROM Customer Cu, Product Pr, ProductLine Pl, Orderr O, OrderLine Ol
  WHERE (Cu.CustomerID = O.CustomerID) AND (O.OrderID = Ol.OrderID) AND (Ol.ProductID = Pr.ProductID) AND (Pr.ProductLineID = Pl.ProductLineID);
  
/*1 TRIGGER*/
/*write the trigger StandardPriceUpdate*/

*/
CREATE OR REPLACE TRIGGER StandardPriceUpdate AFTER UPDATE ON Product
  FOR EACH ROW
  BEGIN
    INSERT INTO PriceUpdate(PriceUpdateID,DateChanged,OldPrice,NewPrice) 
      VALUES (1, NULL, 0, 0);
END;

/*Part 1. Stored Procedures*/
/*Create new column SalePrice in table Product*/

BEGIN 
    EXECUTE IMMEDIATE 'ALTER TABLE Product DROP COLUMN SalePrice';
    EXECUTE IMMEDIATE 'ALTER TABLE Product ADD SalePrice DECIMAL(6,2)';
END;

/*1.a) Create the procedure*/
--set serveroutput on;
CREATE OR REPLACE PROCEDURE ProductLineSale
IS

  /*declare the variables that store the sale price, the standard price and the product id*/  
  Sale Product.SalePrice%type;
  Price Product.ProductStandardPrice%type;
  PID Product.ProductID%type;
  
  /*use cursor to select all product id and standard price from product table*/
  CURSOR get_price IS
    SELECT ProductID, ProductStandardPrice FROM Product;
  
BEGIN
  /*open the cursor */  
  OPEN get_price;
  LOOP
    /*store product id and price at a row into variables and exit loop if no more data retrieved*/ 
    FETCH get_price INTO PID, Price;
    EXIT WHEN get_price%NOTFOUND;
    
    /*if the price >= 400, the sale price is 90% of price; otherwise, 85% of the price*/  
    IF Price >= 400 THEN 
      Sale := 0.90 * Price;
    ELSE 
      Sale := 0.85 * Price; 
    END IF; 

    /*update the new values to SalePrice column*/
    UPDATE Product SET SalePrice = Sale WHERE ProductID = PID; 
  END LOOP;
  COMMIT;
END ProductLineSale;
/

BEGIN
  ProductLineSale();
END;

DROP TRIGGER StandardPriceUpdate;
DROP TABLE PriceUpdate;

/*Create table PriceUpdate*/
CREATE TABLE PriceUpdate (
  UpdateProductID   INTEGER,
  DateChanged DATE,
  OldPrice INTEGER,
  NewPrice INTEGER
);

/*create the trigger after the product table is updated*/
CREATE OR REPLACE TRIGGER StandardPriceUpdate
AFTER UPDATE ON Product
FOR EACH ROW
BEGIN
  /*insert new data row to PriceUpdate table*/
  INSERT INTO PriceUpdate (UPDATEPRODUCTID, DATECHANGED, OLDPRICE, NEWPRICE) VALUES (:OLD.ProductID, SYSDATE, :OLD.ProductStandardPrice, :NEW.ProductStandardPrice);
END;
/