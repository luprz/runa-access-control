// Dependencies
import React, { Component } from 'react';
import PropTypes from 'prop-types/prop-types';
import '../assets/stylesheets/Layout.css';

// Components
import Navbar from '../../components/Navbar/Navbar';

class Layout extends Component {
  static propTypes = {
    children: PropTypes.object.isRequired
  };
  
  render() {
    const { children } = this.props;

    return (
      <div className="Layout">
        <Navbar title="Check Control" theme="runa"/>
        { children }
      </div>
    );
  }
}

export default Layout;
