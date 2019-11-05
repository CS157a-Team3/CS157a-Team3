
import React, { Component } from 'react';
import { Route } from 'react-router-dom';
import Login from './components/Login';
import Register from './components/Register';
//import ShoppingCart from './components/ShoppingCart';

import './App.css';

class App extends Component {
    render() {
        return (
<div>
        <div className= "headerr">
                <div className="headerone">

                <nav>
                    <h3><a href="/" className="logo">CS157a Team3</a></h3>
                    <div className="navLinksWrapper">
                        <a href="#">About</a>
                        <a href="#">Contact</a>
                        <a href="#">Shop</a>
                        <a href="#">Category</a>
                        <a href="#">cart</a>
                        <a href="#" className="button">Sign&nbsp;Up/log&nbsp;in</a>

                        <input type="email2" placeholder="youremail@gmail.com"/>

                        <input type="password2" placeholder="password"/>

                    </div>
                </nav>

                    <div className="headerCopy">
                        <h1>E commerce web</h1>
                    </div>
                </div>
        </div>
                <div className="container">
                    <Route exact path="/" component={Login} />
                    <Route path="/register" component={Register} />
                </div>

</div>


        );
    }
}

export default App;
