import React, { Component } from 'react';
import PropTypes from 'prop-types/prop-types';
import { Link } from 'react-router-dom'
import './css/Navbar.css';

// Data
import config from './data/config.json'

class Navbar extends Component {
  static propTypes = {
    title: PropTypes.string.isRequired
  };

  render() {
    const { title, theme } = this.props;

    const links = config.links;

    return (
      <div className="Navbar">
        <nav className={ "navbar navbar-expand-lg navbar-"+ theme +" bg-"+ theme } >
          <a className="navbar-brand" href="/">
            { title }            
          </a>
          <button className="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span className="navbar-toggler-icon"></span>
          </button>
          <div className="collapse navbar-collapse" id="navbarNav">
            <ul className="navbar-nav">
              { links && links.map((link, i) => {
                return (
                  <li className="nav-item active" key={i}>
                    <Link className="nav-link" to={link.url}>{link.title}</Link>
                  </li>
                )
              }) }
            </ul>
          </div>
        </nav>
      </div>
    );
  }
}

export default Navbar;
