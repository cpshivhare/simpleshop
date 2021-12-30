import React from 'react';
const DisplayPrice = ({order}) => {
  
 return(
  <>
    <li className="list-group-item d-flex justify-content-between">
      <span>Sub Total</span>
      <strong>{order.sub_total}</strong>
    </li>
    
    <li className="list-group-item d-flex justify-content-between">
      <span>Total (includes tax)</span>
      <strong>{order.total}</strong>
    </li>
  </>
 )
}

export default DisplayPrice;