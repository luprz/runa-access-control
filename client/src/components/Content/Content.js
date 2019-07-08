import React, { Component } from 'react';
import './css/Content.css';

class Content extends Component {
  constructor() {
    super();
    // STATES
    this.state = {
      count : 0,
      numberOne: 0,
      numberTwo: 0,
      result: 0
    }
    // BINDS
    this.handleCountClick = this.handleCountClick.bind(this);
    this.handleSumTwoNumbers = this.handleSumTwoNumbers.bind(this);
    this.handleInputChanged = this.handleInputChanged.bind(this);
  }

  // CALLBACKS
  componentDidMount() {
    this.setState({
      count: 1
    })
  }

  // FUNCTIONS
  handleCountClick(e) {
    if (e.target.id === "add") {
      this.setState({
        count: this.state.count + 1
      });
    } else if (e.target.id === "substract" && this.state.count > 0) {
      this.setState({
        count: this.state.count - 1
      });
    } else {
      this.setState({
        count: 0
      });
    }
  }

  handleInputChanged(e) {
    if (e.target.id === "numberOne") {
      this.setState({
        numberOne: Number(e.target.value)
      });
    } else {
      this.setState({
        numberTwo: Number(e.target.value)
      });
    }
  }

  handleSumTwoNumbers(e) {
    this.setState({
      result: this.state.numberOne + this.state.numberTwo
    });
  }

  // RENDER
  render() {
    return (
      <div className="Content">
        <section className="container">
          {/* <h1>Counter: { this.state.count }</h1>
          <p>
            <button id="add" onClick={ this.handleCountClick }>+</button>
            <button id="substract" onClick={ this.handleCountClick }>-</button>
            <button id="reset" onClick={ this.handleCountClick }>Reset</button>
          </p>
          <hr></hr>
          <h1>Calculadora</h1>
          <p>
            <input id="numberOne" type="number" value={this.numberOne} onChange={this.handleInputChanged}></input>
            <input id="numberTwo" type="number" value={this.numberTwo} onChange={this.handleInputChanged}></input>
            <button id="result" onClick={ this.handleSumTwoNumbers }>+</button>
          </p>
          <h1>{ this.state.result }</h1>
          <hr></hr> */}
        </section>
      </div>
    );
  }
}

export default Content;
