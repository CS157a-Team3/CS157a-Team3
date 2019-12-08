// var express = require('express');
// var router = express.Router();

// const db = mysql.createConnection ({
//   host: 'localhost',
//   user: 'root',
//   password: 'root',
//   database: 'FlipKart'
// });

const fs = require('fs');
const uuid = require("uuid");

module.exports = {

  logIn: (req,  res) => {
    res.render('login', {message: "LogIn"});
  },

  signUp: (req, res) => {
    res.render('signup', {message: "Create User"});
  },

  storeFront: (req, res) => {
    let query = "SELECT * FROM product NATURAL JOIN inCat NATURAL JOIN category";
    db.query(query, (err, result) => {
      if(err) throw err;
      res.render('storefront', {
        products: result});
    })
  },

  storeFrontCat: (req, res) => {
    let category = req.params.category;

    let query = "SELECT * FROM product NATURAL JOIN inCat NATURAL JOIN category WHERE categoryName = '"+category+"'";
    db.query(query, (err, result) => {
      if(err) throw err;
      res.render('storefront', {
        products: result});
    })
  },

  cart: (req,res) => {
    let userID = res.locals.user.UserID;
    console.log("user id: " + userID);
    let query = "SELECT * FROM edits NATURAL JOIN inCart NATURAL JOIN product WHERE UserID = '"+userID+"'";
    // let query = "SELECT * FROM product NATURAL JOIN inCart WHERE productID IN (SELECT productID FROM edits NATURAL JOIN inCart WHERE userID = '"+userID+"')"
    
    db.query(query, (err, result) => {
      if(err) throw err;
      res.render('shoppingcart', {
        products: result});
    })
  },

  removeItem: (req, res) => {
    let userID = res.locals.user.UserID;
    let productID = req.body.productID;

    let cartQuery = "SELECT cartID FROM edits WHERE UserID = '"+userID+"'";
    db.query(cartQuery, (err, result) =>{
      if(err) throw err;
      let cartID = result[0].cartID;
      let deleteQuery = "DELETE FROM inCart WHERE cartID = '"+cartID+"' AND productID = '"+productID+"'";
      db.query(deleteQuery, (err, result) =>{
        if (err) throw err;
        res.redirect('/cart');
      })
    })
  },

  checkoutPage(req, res){
    let userID = res.locals.user.UserID;

    let query = "SELECT * FROM edits NATURAL JOIN inCart NATURAL JOIN product WHERE UserID = '"+userID+"'";
    db.query(query, (err, result) =>{
      if(err) throw err;
      res.render('checkout',{
        products:result});
      });
  },

  checkout(req, res){
    let addressID = uuid.v4();
    let userID = res.locals.user.UserID;
    let firstName = req.body.firstName;
    let lastName = req.body.lastName;
    let email = req.body.email;
    let address = req.body.address;
    let city = req.body.city;
    let state = req.body.state;
    let zip = req.body.zip;
    let cardName = req.body.cardName;
    let cardNum = req.body.cardNum;
    let expDate = req.body.expDate;
    let cvv = req.body.cvv;

    let cardID = uuid.v4();

    let addAddress = "INSERT INTO address (addressID, address, state, city, zip, firstName, lastName) VALUES ('"+addressID+"', '"+address+"', '"+state+"', '"+city+"', '"+zip+"', '"+firstName+"', '"+lastName+"')";
    db.query(addAddress, (err, result) =>{
      if(err) throw err;
    })
    let connectAddress = "INSERT INTO shipsTo (userID, addressID) VALUES ('"+userID+"', '"+addressID+"')";
    db.query(connectAddress, (err, result) =>{
      if(err) throw err;
    })
    let addCard = "INSERT INTO creditCard (cardNum, cardName, CVV, expDate, cardID) VALUES ('"+cardNum+"', '"+cardName+"', '"+cvv+"', '"+expDate+"', '"+cardID+"')";
    db.query(addCard, (err, results) =>{
      if(err) throw err;
    })
    let connectCard = "INSERT INTO paysWith (userID, cardID) VALUES ('"+userID+"', '"+cardID+"')";
    db.query(connectCard, (err, results) =>{
      if(err) throw err;
    })
    res.redirect("/storefront");
  },

  productPage: (req, res) => {
    let id = req.params.id;
    let query = "SELECT * FROM product WHERE productId = '"+id+"'";
    db.query(query, (err, result) =>{
      if(err) throw err;
      res.render('productpage', {
        product: result});
    })
  },
  
  addToCart: (req, res) => {
    let productID = req.params.id;
    let qty = req.body.qty;
    console.log(qty);
    let userID = res.locals.user.UserID;
    let cartQuery = "SELECT cartID FROM edits WHERE UserID = '"+userID+"'";
    db.query(cartQuery, (err, result) =>{ 
      if(err) throw err;
      let cartID = result[0].cartID;
      console.log(cartID);
      let insertQuery = "INSERT INTO inCart (cartID, productID, quantity) VALUES ('"+cartID+"', '"+productID+"', '"+qty+"')";
      db.query(insertQuery, (err, result) => {
        if (err) throw err;
        console.log("added to cart");
        res.redirect("/product/" + productID)
      })
    })
  },


  newUser: (req, res) => {
    let name = req.body.name;
    let email = req.body.email;
    let phonenumber = req.body.phonenumber;
    let password = req.body.password;

    let emailCheck = "SELECT * FROM user WHERE Email = '"+email+"'";

    db.query(emailCheck, function(error, results, fields)
    {
      console.log(results);
      if(results.length)
      {
        console.log("email already exists");
        res.render('signup', {message: "Email already exists!"});
      }
      else
      {
        let useruuid = uuid.v4();
        let addQuery = "INSERT INTO user (UserID, Name, Email, PhoneNumber, Password) VALUES ('"+useruuid+"', '" + name + "', '" + email + "', '" + phonenumber + "', '" + password + "')";
        db.query(addQuery, (err, result) => {
          if (err) throw err;

          let cartUUID = uuid.v4();
          let newCartQ = "INSERT INTO carts (cartID) VALUE ('"+cartUUID+"')";
          db.query(newCartQ, (err, result) => {
            if(err) throw err;
            let cartToUser = "INSERT INTO edits (userID, cartID) VALUE ('"+useruuid+"', '"+cartUUID+"')";
            db.query(cartToUser, (err, result) => {
              if(err) throw err;
              console.log("added new user");
              res.redirect('/');
            });
          });
      });
      }
    });
  },

  existingUser:(req, res) => {
    let email = req.body.email;
    let password = req.body.password;

    let authCheck = "SELECT * FROM user WHERE Email = '"+email+"'";
    db.query(authCheck, function(error, results, fields)
    {
      if(results.length)
      {
        if(results[0].Password == password)
        {
          req.session.userId = results[0].UserID;
          req.session.user = results[0];
          res.redirect('/storefront')
          console.log("auth successful");
        }
      }
      else
      {
        console.log("auth unsuccessful");
        res.render('login');
      }
    });
  },

  logOut(req, res){
    req.session.destroy(function(err) {
      res.redirect('/');
    })
  },

  accountPage(req,res){
    let userID = res.locals.user.UserID;
    let query = "SELECT * FROM user WHERE UserID = '"+userID+"'";

    db.query(query, (err, result) =>{
      if(err) throw err;
      res.render('account', {
        user: result[0]
      });
    })
  },

  accountUpdate(req, res){
    let userID = res.locals.user.UserID;  
    let name = req.body.fullName;
    let phoneNumber = req.body.phoneNumber;
    let email = req.body.email;
    let password = req.body.password;

    let query = "UPDATE user SET Name = '"+name+"', PhoneNumber = '"+phoneNumber+"', Email = '"+email+"', Password = '"+password+"' WHERE UserID = '"+userID+"'";
    db.query(query, (err, result) => {
      if(err) throw err;
      console.log("Account updated");
      res.redirect('/myaccount')
    })
  },

  paymentPage(req,res){
    let userID = res.locals.user.UserID;
    let query = "SELECT * FROM user NATURAL JOIN paysWith NATURAL JOIN creditCard WHERE UserID = '"+userID+"'";
    db.query(query, (err, result) => {
      if (err) throw err;
      res.render("payment", {
        cards: result
      });
    })
  },

  paymentUpdate(req,res){
    let userID = res.locals.user.UserID;
    let cardName = req.body.cardName;
    let cardNum = req.body.cardNum;
    let expDate = req.body.expDate;
    let cvv = req.body.cvv;
    let cardID = req.body.cardID;

    let cardQuery = "SELECT cardID FROM paysWith WHERE userID = '"+userID+"'";
    db.query(cardQuery, (err, result) => {
      if(err) throw err;
      let updateCC = "UPDATE creditCard SET cardName = '"+cardName+"', cardNum = '"+cardNum+"', expDate = '"+expDate+"', CVV = '"+cvv+"' WHERE cardID = '"+cardID+"'";
      db.query(updateCC, (err, result) =>{
        if(err) throw err;
        res.redirect('/mypayment');
        // let updatepaysWith = "UPDATE paysWith SET cardNum = '"+cardNum+"' WHERE userID = '"+userID+"'";
        // db.query(updatepaysWith, (err, result) =>{
        //   if(err) throw err;
        //   res.redirect('/mypayment');
        // })
      })
    })
  },

  shippingPage(req,res){
    let userID = res.locals.user.UserID;
    let query = "SELECT * FROM user NATURAL JOIN shipsTo NATURAL JOIN address WHERE UserID = '"+userID+"'";
    db.query(query, (err, result) =>{
      if(err) throw err;
      res.render("shipping", {
        addresses: result
      })
    })
  },

  shippingUpdate(req, res){
    let firstName = req.body.firstName;
    let lastName = req.body.lastName;
    let address = req.body.address;
    let city = req.body.city;
    let state = req.body.state;
    let zip = req.body.zip;
    let addressID = req.body.addressID;

    let updateQuery = "UPDATE address SET firstName='"+firstName+"', lastName='"+lastName+"', address='"+address+"', city='"+city+"', state='"+state+"', zip='"+zip+"' WHERE addressID='"+addressID+"'";
      db.query(updateQuery, (err, result) => {
        if(err) throw err;
        res.redirect("/myshipping")
      })  
  }
}
