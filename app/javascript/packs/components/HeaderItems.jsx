import React from "react";
import { Link } from "react-router-dom";
import Signout from "./Signout";
import ShoppingCart from "./shopping_cart/ShoppingCart";

const HeaderItems = () => {
  const token = localStorage.getItem("token");
  const userEmail = localStorage.getItem("userEmail");
  if (token) {
    return (
      <>
        <ShoppingCart />
        <li className="nav-item">
          <Link to="#" className="nav-link">
            {userEmail}
          </Link>
        </li>
        <Signout />
      </>
    );
  } else {
    return (
      <>
        <li className="nav-item">
          <Link to="/signin" className="nav-link">
            Login
          </Link>
        </li>
        <li className="nav-item">
          <Link to="/signup" className="nav-link">
            Signup
          </Link>
        </li>
      </>
    );
  }
};

export default HeaderItems;
