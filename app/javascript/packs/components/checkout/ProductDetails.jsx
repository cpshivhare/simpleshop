import React from "react";
import Product from "./Product";
import DisplayPrice from "./DisplayPrice";


const ProductDetails = ({ order }) => {
  const [orderProducts, setOrderProducts] = React.useState();

  React.useEffect(() => {
    setOrderProducts(order.order_products);
  }, [order]);

  return (
    <div className="col-md-4 order-md-2 mb-4">
      <h4 className="d-flex justify-content-between align-items-center mb-3">
        <span className="text-muted">Your cart</span>
        <span className="badge badge-secondary badge-pill">3</span>
      </h4>
      <ul className="list-group mb-3">
        {orderProducts &&
          orderProducts.map((orderProduct, i) => (
            <Product product={orderProduct.product} key={orderProduct.id} />
          ))}

        {<DisplayPrice order={order} />}
      </ul>
    </div>


  );
};

export default ProductDetails;
