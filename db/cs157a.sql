/*Use database cs157*/
use cs157a;

/*Create Address table primary key AddressId*/
CREATE TABLE IF NOT EXISTS Address (
    AddressId INT AUTO_INCREMENT PRIMARY KEY,
    Address VARCHAR(255) NOT NULL,
    City VARCHAR(255) NOT NULL,
    Country VARCHAR(255) NOT NULL,
    State VARCHAR(255),
    PostCode VARCHAR(11) NOT NULL
);

/*Create PaymentInformation table primary key PaymentId, 
Foreign Key BillingAddressId*/
CREATE TABLE IF NOT EXISTS PaymentInformation (
	PaymentId INT AUTO_INCREMENT PRIMARY KEY,
    Type VARCHAR(255) NOT NULL DEFAULT 'Credit Card',
    BillingAddressId INT(11) NOT NULL,
    FOREIGN KEY (BillingAddressId)
        REFERENCES Address (AddressId)
        ON UPDATE RESTRICT
        ON DELETE CASCADE
);

/*Create CreditCard table primary key CardNumber and PaymentId */
CREATE TABLE IF NOT EXISTS CreditCard (
	CardNumber VARCHAR(19),
	CardHolerName VARCHAR(255) NOT NULL,
	ExpDate DATE NOT NULL,
	CVV VARCHAR(3) NOT NULL,
	PaymentId INT(11), 
    PRIMARY KEY (CardNumber, PaymentId)
);

/*Create Paypal table primary key PaypalId and PaymentId */
CREATE TABLE IF NOT EXISTS Paypal(
	PaypalId VARCHAR(300),
	PaymentId INT(11), 
    PRIMARY KEY (PaypalId, PaymentId)
);

/*Create User table primary key UserId, 
Foreign Key DefaultAddressId and DefaultPaymentId*/
CREATE TABLE IF NOT EXISTS User(
	UserId INT AUTO_INCREMENT PRIMARY KEY,
	Name VARCHAR(255) NOT NULL,
	Email VARCHAR(320) NOT NULL,
	State VARCHAR(255),
	PhoneNumber VARCHAR(30),
	DefaultAddressId INT(11),
	FOREIGN KEY (DefaultAddressId)
        REFERENCES Address (AddressId)
        ON UPDATE RESTRICT
        ON DELETE CASCADE,
	DefaultPaymentId INT(11),
    FOREIGN KEY (DefaultPaymentId)
        REFERENCES PaymentInformation (PaymentId)
        ON UPDATE RESTRICT
        ON DELETE CASCADE
);
/*Create ShoppingCart table primary key CartId, 
Foreign Key UserId */
CREATE TABLE IF NOT EXISTS ShoppingCart(
	CartId INT AUTO_INCREMENT PRIMARY KEY,
    Subtotal DECIMAL(18,2) NOT NULL DEFAULT '0.00',
	UserId INT(11) NOT NULL,
    FOREIGN KEY (UserId)
		REFERENCES User (UserId)
        ON UPDATE RESTRICT
        ON DELETE CASCADE
);

/*Create Wishlist table primary key WishlistId, 
Foreign Key UserId */
CREATE TABLE IF NOT EXISTS Wishlist(
	WishlistId INT AUTO_INCREMENT PRIMARY KEY,
    UserId INT(11) NOT NULL,
    FOREIGN KEY (UserId)
		REFERENCES User(UserId)
        ON UPDATE RESTRICT 
        ON DELETE CASCADE
);

/*Create Category table primary key CategoryId */
CREATE TABLE IF NOT EXISTS Category(
	CategoryId INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(255) NOT NULL
);

/*Create Product table primary key ProductId, 
Foreign Key CategoryId */
CREATE TABLE IF NOT EXISTS Product(
	ProductId INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Description VARCHAR(1000),
    ListPrice DECIMAL(18,2) NOT NULL DEFAULT'0.00',
    Image VARCHAR(255),
    CategoryId INT(11) NOT NULL,
		FOREIGN KEY (CategoryId)
		REFERENCES Category (CategoryId)
        ON UPDATE RESTRICT 
        ON DELETE CASCADE
);