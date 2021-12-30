import React from 'react'

export const ProductContext = React.createContext({
  cartProductCount: 0,
  setCartProductCount: () => {}
});