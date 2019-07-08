import React, { Component } from 'react';
import './css/Jumbotron.css';

class Jumbotron extends Component {
  
  // RENDER
  render() {
    return (
      <div className="Jumbotron">
        <div className="jumbotron">
          <h1 className="display-4">{ this.props.title }</h1>
          { this.props.parraph === "true" ? 
            <p className="lead">This is a simple hero unit, a simple jumbotron-style component for calling 
            extra attention to featured content or information.</p>
          : null }  
          { this.props.link === "true" ? 
            <div>
              <a className="btn btn-primary btn-lg" href="/" role="button">Get Started</a>
            </div>
            : null }            
        </div>
      </div>
    );
  }
}

export default Jumbotron;
