import React from "react";
import Product from './Product';
const BASE_URL = "http://localhost:3000"

const Products = () => {
  const [products, setProducts] = React.useState([]);
  React.useEffect(() => {
    fetch(`${BASE_URL}/api/v1/products`)
      .then(results => results.json())
      .then(data => {
        setProducts(data);
      });
  }, []); // <-- Have to pass in [] here!


  return (
    <div className="album py-5 bg-light">
      <div className="container">
        <div className="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
          {
            products.map((product, i) => <Product product={product} key={product.id}/>)
          }
        </div>
      </div>
    </div>
  );
};

export default Products;
