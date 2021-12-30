import React from "react";
import { Link } from "react-router-dom";
import HeaderItems from "./HeaderItems";

const Header = () => {
  return (
    <main>
      <h1 className="visually-hidden">SIMPLESHOP</h1>
      <div className="container">
        <header className="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
          <a
            href="/"
            className="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none"
          >
            <svg className="bi me-2" width={40} height={32}>
              <use xlinkHref="#bootstrap" />
            </svg>
            <span className="fs-4">SIMPLESHOP</span>
          </a>
          <ul className="nav nav-pills">
            <HeaderItems />
          </ul>
        </header>
      </div>
    </main>
  );
};

export default Header;
