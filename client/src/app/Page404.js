// Dependencies
import React, { Component } from 'react';
import './assets/stylesheets/Page404.css';

// Components
import Jumbotron from '../components/Jumbotron/Jumbotron';

class Page404 extends Component {
  render() {
    return (
      <div className="Page404">
        <Jumbotron title="Error 404: Page no Found"/>  
      </div>
    );
  }
}

export default Page404;
