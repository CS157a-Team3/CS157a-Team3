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

  logIn: (req, res) => {
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

  storeFrontPhones: (req, res) => {
    let query = "SELECT * FROM product NATURAL JOIN inCat NATURAL JOIN category WHERE categoryName = 'Phones'";
    db.query(query, (err, result) => {
      if(err) throw err;
      res.render('storefront', {
        products: result});
    })
  },

  storeFrontCameras: (req, res) => {
    let query = "SELECT * FROM product NATURAL JOIN inCat NATURAL JOIN category WHERE categoryName = 'Cameras'";
    db.query(query, (err, result) => {
      if(err) throw err;
      res.render('storefront', {
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

    let authCheck = "SELECT Password FROM user WHERE Email = '"+email+"'";
    db.query(authCheck, function(error, results, fields)
    {
      if(results && results[0].Password == password)
      {
        res.redirect('/')
        console.log("auth successful");
      }
      else
      {
        console.log("auth unsuccessful");
        res.render('login');
      }
    });
  }
}
