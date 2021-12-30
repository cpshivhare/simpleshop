import React from "react";
import { Link } from "react-router-dom";

const CompleteOrderPage = () => {
  return (
    <main role="main" className="container">
      <h1 className="mt-5">
        Thanks for using SimpleShop! Your order has been successfully done!
      </h1>
      <Link to="/" className="btn-link">
        Go to shopping page
      </Link>
    </main>
  );
};

export default CompleteOrderPage;
