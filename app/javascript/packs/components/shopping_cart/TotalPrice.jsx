import React from "react";

const TotalPrice = ({ subTotal }) => {
  return (
    <div className="col-lg-6 col-sm-6 col-6 total-section text-right">
    <p>
      Total price: <span className="text-info">${subTotal}</span>
    </p>
  </div>
  );
};

export default TotalPrice;
