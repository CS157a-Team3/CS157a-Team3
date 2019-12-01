const express = require('express');
const fileUpload = require('express-fileupload');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const path = require('path');
var session = require("express-session");
var cookieParser = require('cookie-parser');
const app = express();


const {logIn, signUp, storeFront, storeFrontCat, cart, newUser, existingUser, productPage, addToCart} = require('./routes/index');
// const {addPlayerPage, addPlayer, deletePlayer, editPlayer, editPlayerPage} = require('./routes/player');
const port = 5000;

// create connection to database
// the mysql.createConnection function takes in a configuration object which contains host, user, password and the database name.
const db = mysql.createConnection ({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'Flip_Kart'
});

// connect to database
db.connect((err) => {
    if (err) {
        throw err;
    }
    console.log('Connected to database');
});
global.db = db;

// configure middleware
app.use(express.static(__dirname + '/public'));
app.set('port', process.env.port || port); 
app.set('views', __dirname + '/views');
app.set('view engine', 'ejs'); 
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json()); 
app.use(express.json());
app.use(express.static(path.join(__dirname, 'public'))); 
app.use(fileUpload()); 
app.use(cookieParser());
app.use(express.static(__dirname + '/public'));
app.use(session({
    secret: 'NutellaPringles',
    resave: true,
    saveUninitialized: false
  }));
app.use(function(req, res, next) {
    res.locals.user = req.session.user;
    next();
});

// routes for the app
app.get('/', storeFront);
app.get('/storefront/:category', storeFrontCat);
app.get('/cart', cart);
app.get('/product/:id', productPage);
app.post('/product/:id', addToCart);
app.get('/newUser', signUp)
app.post('/newUser', newUser);
app.get('/logIn', logIn);
app.post('/logIn', existingUser)


// set the app to listen on the port
app.listen(port, () => {
    console.log(`Server running on port: ${port}`);
});
