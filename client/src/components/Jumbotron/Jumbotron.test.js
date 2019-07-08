import React from 'react';
import ReactDOM from 'react-dom';
import Jumbotron from './Jumbotron';

it('renders without crashing', () => {
  const div = document.createElement('div');
  ReactDOM.render(<Jumbotron />, div);
  ReactDOM.unmountComponentAtNode(div);
});
