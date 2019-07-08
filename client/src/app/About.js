// Dependencies
import React, { Component } from 'react';
import './assets/stylesheets/About.css';

// Components
import Jumbotron from '../components/Jumbotron/Jumbotron';

class About extends Component {
  render() {
    return (
      <div className="About">
        <Jumbotron title="About Us" parraph="true"/>
      </div>
    );
  }
}

export default About;
