import React from "react";
import { Link } from "react-router-dom";
import Header from './Header'
import Footer from './Footer'
import Products from './products/Products'
import { ProductContext } from "./ProductContext";

export default () => {
  const [cartProductCount, setCartProductCount] = React.useState(0);

  return (
  <ProductContext.Provider value={{ cartProductCount, setCartProductCount }} >
    <Header />
    <Products />
    <Footer />
    </ProductContext.Provider>
  )
};