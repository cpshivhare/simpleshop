import React from "react";

const Item = ({ item }) => {
  return (
    <div className="row cart-detail">
      <div className="col-lg-4 col-sm-4 col-4 cart-detail-img">
        <img src={item.product.image_url} />
      </div>
      <div className="col-lg-8 col-sm-8 col-8 cart-detail-product">
        <p>{item.product.title}</p>
        <span className="price text-info"> ${item.sub_total} </span>{" "}
        <span className="count"> Quantity:{item.quantity}</span>
      </div>
    </div>
  );
};

export default Item;
