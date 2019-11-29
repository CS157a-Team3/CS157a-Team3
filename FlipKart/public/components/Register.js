import React, { Component } from 'react';
import { Link } from 'react-router-dom';

class Register extends Component {
    constructor(props) {
        super(props);

        this.state = {
            Username: '',
            Email: '',
            Phonenumber: '',
            Password: ''
        };

        this.update = this.update.bind(this);

        this.displayLogin = this.displayLogin.bind(this);
    }

    update(e) {
        let name = e.target.name;
        let value = e.target.value;
        this.setState({
            [name]: value
        });
    }

    displayLogin(e) {
        e.preventDefault();
        console.log('You have successfully registered');
        console.log(this.state);
        this.setState({
            Username: '',
            Email: '',
            Phonenumber: '',
            Password: ''
        });
    }

    render() {
        return (
            <div className="register">
                <form onSubmit={this.displayLogin}>
                    <h2>Register</h2>

                    <div className="name">
                        <input
                            type="text"
                            placeholder="Full Name"
                            name="Username"
                            value={this.state.Username}
                            onChange={this.update}
                        />
                    </div>

                    <div className="email">
                        <input
                            type="text"
                            placeholder="Enter your email"
                            name="Email"
                            value={this.state.Email}
                            onChange={this.update}
                        />
                    </div>


                    <div className="phonenumber">
                        <input
                            type="number"
                            placeholder="Enter your phone number"
                            name="Phonenumber"
                            value={this.state.Phonenumber}
                            onChange={this.update}
                        />
                    </div>


                    <div className="pasword">
                        <input
                            type="password"
                            placeholder="Password"
                            name="Password"
                            value={this.state.Password}
                            onChange={this.update}
                        />
                    </div>

                    <div className="password">
                        <input type="password" placeholder="Confirm Password" name="password1" />
                    </div>



                    <input type="submit" value="Signup" />
                </form>


                    <a className = "linklogin" href="/">Login Here</a>
                    <a className = "linkpayment" href="/">Add Payment Info</a>

             </div>

        );
    }
}

export default Register;