import React from "react";
import {Link} from 'react-router-dom';
import BuyProductButton from './BuyProductButton'

const BASE_URL = "http://localhost:3000"

const Product = ({product}) => {
  return (
    <div className="col" key={product.id}>
      <div className="card shadow-sm">
        <svg
          className="bd-placeholder-img card-img-top"
          width="100%"
          height={225}
          xmlns={product.image_url}
          role="img"
          aria-label="Placeholder: Thumbnail"
          preserveAspectRatio="xMidYMid slice"
          focusable="false"
        >
          <title>Placeholder</title>
          <rect width="100%" height="100%" fill="#55595c" />
          <image href={product.image_url} height={200} width={200} />
          <text x="50%" y="50%" fill="#eceeef" dy=".3em">
            {product.title}
          </text>
        </svg>
        <div className="card-body">
          <p className="card-text">
            {product.description}
          </p>
          <div className="d-flex justify-content-between align-items-center">
            <BuyProductButton productId={product.id} />
            <small className="text-muted">{product.region.currency}{product.price}</small>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Product;
