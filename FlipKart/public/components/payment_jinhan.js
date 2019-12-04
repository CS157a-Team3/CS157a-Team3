import React, { Component } from 'react';
import { Link } from 'react-router-dom';

class Payment extends Component {
    constructor(props) {
        super(props);

        this.state = {

            cardnumber: '',
            cardholdername: '',
            expiry_month: '',
            expiry_year: '',
            cvv: ''
        };

        this.update = this.update.bind(this);

        this.displayLogin = this.displayLogin.bind(this);
    }

    update(e) {
        let cardholdername = e.target.cardholdername;
        let value = e.target.value;
        this.setState({
            [cardholdername]: value
        });
    }

    displayLogin(e) {
        e.preventDefault();
        console.log('Creditcard has successfully registered');
        console.log(this.state);
        this.setState({
            cardnumber: '',
            cardholdername: '',
            expiry_month: '',
            expiry_year: '',
            expiry: this.state.expiry_month + this.state.expiry_year,
            cvv: ''
        });
    }


    render() {
        return (
            <div className="payment">
                <form onSubmit={this.displayLogin}>
                    <h2>Payment</h2>

                    <input type="submit" value="Payment" />
                </form>


                    <div className="row-fluid">
                        <form className="form-horizontal">
                            <fieldset>
                                <div id="legend">
                                    <legend className="">Payment</legend>
                                </div>

                                <!-- Name -->
                                <div className="control-group">
                                    <label className="control-label" htmlFor="cardholdername">Card Holder's Name</label>
                                    <div className="controls">
                                        <input type="text"
                                               name="cardholdername"
                                               placeholder="Enter Name"
                                               onChange={this.update}
                                        />
                                    </div>
                                </div>

                                <!-- Card Number -->
                                <div className="control-group">
                                    <label className="control-label" htmlFor="email">Card Number</label>
                                    <div className="number">
                                        <input type="text"
                                               id="email"
                                               name="cardnumber"
                                               placeholder="Enter number"
                                               value={this.state.cardnumber}
                                               onChange={this.update}
                                               />
                                    </div>
                                </div>

                                <!-- Expiry-->
                                <div className="control-group">
                                    <label className="control-label" htmlFor="password">Card Expiry Date</label>
                                    <div className="controls">
                                        <select className="span3" name= "expiry_month" onChange={this.update}>
                                            <option></option>
                                            <option value="01">Jan (01)</option>
                                            <option value="02">Feb (02)</option>
                                            <option value="03">Mar (03)</option>
                                            <option value="04">Apr (04)</option>
                                            <option value="05">May (05)</option>
                                            <option value="06">June (06)</option>
                                            <option value="07">July (07)</option>
                                            <option value="08">Aug (08)</option>
                                            <option value="09">Sep (09)</option>
                                            <option value="10">Oct (10)</option>
                                            <option value="11">Nov (11)</option>
                                            <option value="12">Dec (12)</option>
                                        </select>

                                        <select className="span2" name="expiry_year" onChange={this.update} >
                                            <option value="19">2019</option>
                                            <option value="20">2020</option>
                                            <option value="21">2021</option>
                                            <option value="22">2022</option>
                                            <option value="23">2023</option>
                                            <option value="24">2024</option>
                                            <option value="25">2025</option>
                                            <option value="26">2026</option>
                                            <option value="27">2027</option>
                                            <option value="28">2028</option>
                                            <option value="29">2029</option>

                                        </select>

                                    </div>

                                </div>

                                <!-- CVV -->
                                <div className="control-group">
                                    <label className="password" htmlFor="password_confirm">Card CVV</label>
                                    <div className="controls">
                                        <input type="password"
                                               name="cvv"
                                               placeholder="CVV"
                                               value={this.state.cvv}
                                               onChange={this.update}
                                               />
                                        </div>
                                </div>

                                <!-- Save card -->
                                <div className="control-group">
                                    <div className="controls">
                                        <label className="checkbox" htmlFor="save_card">
                                            <input type="checkbox" id="save_card" value="option1"/>
                                                Save card on file?
                                            </label>
                                    </div>
                                </div>

                                <!-- Submit -->
                                <div className="control-group">
                                    <div className="controls">
                                        <button className="btn btn-success">Add</button>
                                    </div>
                                </div>

                            </fieldset>
                        </form>
                    </div>



            </div>

        );
    }
}

export default Payment;