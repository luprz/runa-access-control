import React, { Component } from 'react';

import { Route, Redirect } from 'react-router-dom';

class PrivateRoute extends Component {
  constructor() {
    super();

    this.state = {
      login: false
    }
  }

  // RENDER
  render() {
    return (
      <div id="PrivateRoute">
        { this.state.login ? 
          <Route exact path={this.props.path} component={this.props.component} /> : 
          <Redirect to="/sign_in" />
        }        
      </div>
    );
  }
}

export default PrivateRoute;
