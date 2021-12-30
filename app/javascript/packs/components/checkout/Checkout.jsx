import React, { useState } from "react";
import Footer from "../Footer";
import axios from "axios";
import ProductDetails from "./ProductDetails";
import ShippingAddressForm from "./ShippingAddressForm";
const BASE_URL = "http://localhost:3000";

const Checkout = (props) => {
  const [order, setOrder] = React.useState({});
  React.useEffect(() => {
    axios.get(`${BASE_URL}/api/v1/orders/current_inprogress`).then((res) => {
      setOrder(res.data);
    });
  }, []);

  console.log('order', order);
  return (
    <>
      <div className="container">
        <div className="py-5 text-center">
          <h2>Checkout form</h2>
          <p className="lead"></p>
        </div>
        <div className="row">
          <ProductDetails order={order} />
          <ShippingAddressForm shippingAddress={ order.shipping_address } order={order} />
        </div>
        <footer className="my-5 pt-5 text-muted text-center text-small">
          <p className="mb-1">© 2017-2018 Company Name</p>
          <ul className="list-inline">
            <li className="list-inline-item">
              <a href="#">Privacy</a>
            </li>
            <li className="list-inline-item">
              <a href="#">Terms</a>
            </li>
            <li className="list-inline-item">
              <a href="#">Support</a>
            </li>
          </ul>
        </footer>
      </div>
      <Footer />
    </>
  );
};

export default Checkout;
