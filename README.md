# CS157a-Team3

Table Schema  

```
Address:  
+-----------+--------------+------+-----+---------+----------------+
| Field     | Type         | Null | Key | Default | Extra          |
+-----------+--------------+------+-----+---------+----------------+
| AddressId | int(11)      | NO   | PRI | NULL    | auto_increment |
| Address   | varchar(255) | NO   |     | NULL    |                |
| City      | varchar(255) | NO   |     | NULL    |                |
| Country   | varchar(255) | NO   |     | NULL    |                |
| State     | varchar(255) | YES  |     | NULL    |                |
| PostCode  | varchar(11)  | NO   |     | NULL    |                |
+-----------+--------------+------+-----+---------+----------------+
```

PaymentInformation:
+------------------+--------------+------+-----+-------------+----------------+
| Field            | Type         | Null | Key | Default     | Extra          |
+------------------+--------------+------+-----+-------------+----------------+
| PaymentId        | int(11)      | NO   | PRI | NULL        | auto_increment |
| Type             | varchar(255) | NO   |     | Credit Card |                |
| BillingAddressId | int(11)      | NO   | MUL | NULL        |                |
+------------------+--------------+------+-----+-------------+----------------+

CreditCard:
+---------------+--------------+------+-----+---------+-------+
| Field         | Type         | Null | Key | Default | Extra |
+---------------+--------------+------+-----+---------+-------+
| CardNumber    | varchar(19)  | NO   | PRI | NULL    |       |
| CardHolerName | varchar(255) | NO   |     | NULL    |       |
| ExpDate       | date         | NO   |     | NULL    |       |
| CVV           | varchar(3)   | NO   |     | NULL    |       |
| PaymentId     | int(11)      | NO   | PRI | NULL    |       |
+---------------+--------------+------+-----+---------+-------+

Paypal:
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| PaypalId  | varchar(300) | NO   | PRI | NULL    |       |
| PaymentId | int(11)      | NO   | PRI | NULL    |       |
+-----------+--------------+------+-----+---------+-------+

User:
+------------------+--------------+------+-----+---------+----------------+
| Field            | Type         | Null | Key | Default | Extra          |
+------------------+--------------+------+-----+---------+----------------+
| UserId           | int(11)      | NO   | PRI | NULL    | auto_increment |
| Name             | varchar(255) | NO   |     | NULL    |                |
| Email            | varchar(320) | NO   |     | NULL    |                |
| State            | varchar(255) | YES  |     | NULL    |                |
| PhoneNumber      | varchar(30)  | YES  |     | NULL    |                |
| DefaultAddressId | int(11)      | YES  | MUL | NULL    |                |
| DefaultPaymentId | int(11)      | YES  | MUL | NULL    |                |
+------------------+--------------+------+-----+---------+----------------+

ShoppingCart:
+----------+---------------+------+-----+---------+----------------+
| Field    | Type          | Null | Key | Default | Extra          |
+----------+---------------+------+-----+---------+----------------+
| CartId   | int(11)       | NO   | PRI | NULL    | auto_increment |
| Subtotal | decimal(18,2) | NO   |     | 0.00    |                |
| UserId   | int(11)       | No   | MUL | NULL    |                |
+----------+---------------+------+-----+---------+----------------+

Wishlist:
+------------+---------+------+-----+---------+----------------+
| Field      | Type    | Null | Key | Default | Extra          |
+------------+---------+------+-----+---------+----------------+
| WishlistId | int(11) | NO   | PRI | NULL    | auto_increment |
| UserId     | int(11) | No   | MUL | NULL    |                |
+------------+---------+------+-----+---------+----------------+

ProductOrder:
+------------------+---------------+------+-----+---------+----------------+
| Field            | Type          | Null | Key | Default | Extra          |
+------------------+---------------+------+-----+---------+----------------+
| POId             | int(11)       | NO   | PRI | NULL    | auto_increment |
| UserId           | int(11)       | NO   | MUL | NULL    |                |
| Subtotal         | decimal(18,2) | NO   |     | 0.00    |                |
| BillingAddressId | int(11)       | NO   | MUL | NULL    |                |
| PaymentId        | int(11)       | NO   | MUL | NULL    |                |
+------------------+---------------+------+-----+---------+----------------+

Category:
+--------------+--------------+------+-----+---------+----------------+
| Field        | Type         | Null | Key | Default | Extra          |
+--------------+--------------+------+-----+---------+----------------+
| CategoryId   | int(11)      | NO   | PRI | NULL    | auto_increment |
| CategoryName | varchar(255) | NO   |     | NULL    |                |
+--------------+--------------+------+-----+---------+----------------+

Product:
+-------------+---------------+------+-----+---------+----------------+
| Field       | Type          | Null | Key | Default | Extra          |
+-------------+---------------+------+-----+---------+----------------+
| ProductId   | int(11)       | NO   | PRI | NULL    | auto_increment |
| Name        | varchar(255)  | NO   |     | NULL    |                |
| Description | varchar(1000) | YES  |     | NULL    |                |
| ListPrice   | decimal(18,2) | NO   |     | 0.00    |                |
| Image       | varchar(255)  | YES  |     | NULL    |                |
| CategoryId  | int(11)       | NO   | MUL | NULL    |                |
+-------------+---------------+------+-----+---------+----------------+

ProductLine:
+---------------+---------------+------+-----+---------+----------------+
| Field         | Type          | Null | Key | Default | Extra          |
+---------------+---------------+------+-----+---------+----------------+
| ProductLineId | int(11)       | NO   | PRI | NULL    | auto_increment |
| ListPrice     | decimal(18,2) | NO   |     | NULL    |                |
| Discount      | decimal(4,2)  | NO   |     | 0.00    |                |
| UnitPrice     | decimal(18,2) | NO   |     | NULL    |                |
| Quantity      | int(18)       | NO   |     | NULL    |                |
| Total         | decimal(18,2) | NO   |     | NULL    |                |
| ProductId     | int(11)       | NO   | PRI | NULL    |                |
| WishListId    | int(11)       | YES  | MUL | NULL    |                |
| POId          | int(11)       | YES  | MUL | NULL    |                |
| CartId        | int(11)       | YES  | MUL | NULL    |                |
+---------------+---------------+------+-----+---------+----------------+
