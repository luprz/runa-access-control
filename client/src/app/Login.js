// Dependencies
import React, { Component } from 'react';
import './assets/stylesheets/Login.css';

class Login extends Component {
  constructor(props) {
    super(props);
    this.state = {
      username: 'admin@admin.com',
      password: ''
    };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    
    this.setState({
      username: event.target.username,
      password: event.target.password
    });
  }

  handleSubmit(event) {
    console.log(this.state );
    event.preventDefault();
  }

  render() {
    return (
      <div className="Login">
        <div className="center-element">
          <div className="card login-card">
            <div className="card-header">
              Sign In
            </div>
            <div className="card-body">
            <form onSubmit={this.handleSubmit} >
              <div className="form-group">
                <label>Email</label>
                <input type="username" 
                       name="username" 
                       className="form-control" 
                       placeholder="Enter email" 
                       value={this.state.username} 
                       onChange={this.handleChange} />
              </div>
              <div className="form-group">
                <label>Password</label>
                <input type="password" 
                       name="password" 
                       className="form-control" 
                       placeholder="Password" 
                       value={this.state.password} 
                       onChange={this.handleChange}/>
              </div>
              <button type="submit" className="btn btn-primary float-right">Login</button>
            </form>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default Login;
