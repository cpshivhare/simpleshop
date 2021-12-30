import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Home from "../components/Home";
import Signin from "../components/Signin";
import Signup from "../components/Signup";
import Checkout from "../components/checkout/Checkout";
import history from "../history";
import CompleteOrderPage from "../components/checkout/CompleteOrderPage";

export default (
  <Router history={history}>
    <Routes>
      <Route path="/" exact element={<Home />} />
      <Route path="signin" exact element={<Signin />} />
      <Route path="signup" exact element={<Signup />} />
      <Route path="checkout" exact element={<Checkout />} />
      <Route path="complete-order-page" exact element={<CompleteOrderPage />} />
    </Routes>
  </Router>
);
