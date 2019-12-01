// var express = require('express');
// var router = express.Router();

// const db = mysql.createConnection ({
//   host: 'localhost',
//   user: 'root',
//   password: 'root',
//   database: 'FlipKart'
// });

const fs = require('fs');

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

    let query = "SELECT * FROM product WHERE productID IN (SELECT productID FROM edits NATURAL JOIN inCart WHERE userID = '"+userID+"')"

    db.query(query, (err, result) => {
      if(err) throw err;
      res.render('shoppingcart', {
        products: result});
    })
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
    let userID = res.locals.user.UserID;
    let cartQuery = "SELECT cartID FROM edits WHERE UserID = '"+userID+"'";
    db.query(cartQuery, (err, result) =>{ 
      if(err) throw err;
      let cartID = result[0].cartID;
      console.log(cartID);
      let insertQuery = "INSERT INTO inCart (cartID, productID, quantity) VALUES ('"+cartID+"', '"+productID+"', 1)";
      db.query(insertQuery, (err, result) => {
        if (err) throw err;
        console.log("added to cart");
      })
    })
     
  },

  newUser: (req, res) => {
    let name = req.body.name;
    let email = req.body.email;
    let phonenumber = req.body.phonenumber;
    let password = req.body.password;

    let emailCheck = "SELECT * FROM 'user' WHERE Email = '"+email+"'";

    db.query(emailCheck, function(error, results, fields)
    {
      if(results)
      {
        console.log("email already exists");
        res.render('signup', {message: "Email already exists!"});
      }
      else
      {
        let addQuery = "INSERT INTO user (UserID, Name, Email, PhoneNumber, Password) VALUES (UUID(), '" + name + "', '" + email + "', '" + phonenumber + "', '" + password + "')";
        db.query(addQuery, (err, result) => {
          if (err) throw err;
          console.log("added new user");
          res.redirect('/');
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
      if(results && results[0].Password == password)
      {
        req.session.userId = results[0].UserID;
        req.session.user = results[0];
        res.redirect('/')
        console.log("auth successful");
      }
      else
      {
        console.log("auth unsuccessful");
        res.render('login');
      }
    });
  },

  isAuth(req, res, next){
    if (req.session.userId == null) {
      res.redirect('login');
    } else {
      next();
    }
  },

  notAuth(req, res, next){
    if (req.session.userId == null) {
      res.redirect('login');
    } else {
      next();
    }
  },
}
