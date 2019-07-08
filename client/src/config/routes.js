// React Dependencies
import React from 'react';
import { Route, Switch } from 'react-router-dom';
import PrivateRoute from './PrivateRoute';

// Components
import Layout from '../app/layouts/Layout';
import Login from '../app/Login';
import Home from '../app/Home';
import About from '../app/About';
import Page404 from '../app/Page404';


const AppRoutes = () => 
  <Layout>
    <Switch>
      <Route exact path="/sign_in" component={Login} />
      <PrivateRoute exact path="/" component={Home} />
      <PrivateRoute exact path="/about" component={About} />
      <Route component={Page404} />
    </Switch>
  </Layout>


export default AppRoutes;