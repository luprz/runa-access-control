// Dependencies
import React, { Component } from 'react';
import './assets/stylesheets/Home.css';

// Components
import Content from '../components/Content/Content';
import Jumbotron from '../components/Jumbotron/Jumbotron';

class Home extends Component {
  render() {
    return (
      <div className="Home">
        <Jumbotron title="Home Page" parraph="true" link="true"/>
        <Content />
      </div>
    );
  }
}

export default Home;
