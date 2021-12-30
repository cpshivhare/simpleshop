import React from "react";
import { Link } from "react-router-dom";
import axios from "axios";
import Items from "./Items";
import TotalPrice from "./TotalPrice"
const BASE_URL = "http://localhost:3000";
import { ProductContext } from "../ProductContext";

const ShoppingCart = () => {
  const [show, setShow] = React.useState(false);
  const { cartProductCount } = React.useContext(ProductContext);
  const [order, setOrder] = React.useState([]);

  const handleShoppingCart = () => {
    axios
      .get(`${BASE_URL}/api/v1/order_products`, {})
      .then((res) => res.data)
      .then((data) => {
        setShow(!show);
        setOrder(data);
      });
  };

  return (
    <div className="dropdown">
      <button
        className="btn btn-secondary dropdown-toggle"
        type="button"
        onClick={handleShoppingCart}
        aria-haspopup="true"
        aria-expanded="false"
      >
        <i className="fa fa-shopping-cart">
          <b>{cartProductCount}</b>
        </i>
      </button>
      {show && (
        <div className="cart dropdown-menu show">
          <div className="row total-header-section">
            <div className="col-lg-6 col-sm-6 col-6">
              <i className="fa fa-shopping-cart" aria-hidden="true" />{" "}
              <span className="badge badge-pill badge-danger">3</span>
            </div>
            <TotalPrice subTotal={order.sub_total}/>
            {/* <div className="col-lg-6 col-sm-6 col-6 total-section text-right">
              <p>
                Total: <span className="text-info">$2,978.24</span>
              </p>
            </div> */}
          </div>
          
          {<Items items={order.order_products} />}
          <div className="row">
            <div className="col-lg-12 col-sm-12 col-12 text-center checkout">
            <Link to="/checkout" className="btn btn-primary btn-block">Checkout</Link>
            </div>
          </div>
        </div>
      )}
    </div>
  );
};

export default ShoppingCart;
