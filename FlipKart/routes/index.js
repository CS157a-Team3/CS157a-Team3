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
          res.render('login');
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
        console.log("auth successful");
      }
      else
      {
        console.log("auth unsuccessful");
        res.render('login');
      }

      // if(results && results == password)
      // {
      //   console.log("auth successful");
      // }
      // else
      // {
      //   console.log("auth unsuccessful");
      //   res.render('login');
      // }
    });
  }
}
