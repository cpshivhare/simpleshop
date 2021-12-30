import React from "react";
import axios from "axios";
const BASE_URL = "http://localhost:3000";
import { ProductContext } from "../ProductContext";

const BuyProductButton = ({productId}) => {
  const { cartProductCount, setCartProductCount } = React.useContext(ProductContext);
  const handleBuyProduct = () => {
    axios.post(`${BASE_URL}/api/v1/order_products`, 
      { order_product: { 
        product_id: `${productId }`,
        quantity: 1
      }
    })
    .then(res => res.data)
    .then(data => {
      setCartProductCount(data.length)


    });

  };

  return (
    <div className="btn-group">
      <button
        className="btn btn-sm btn-outline-success"
        onClick={handleBuyProduct}
      >
        Buy
      </button>
    </div>
  );
};

export default BuyProductButton;
