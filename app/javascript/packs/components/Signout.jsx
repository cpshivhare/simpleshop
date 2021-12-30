import React from "react";
import { logout } from "../utils";
import { useNavigate } from "react-router-dom";
import axios from "axios";

const BASE_URL = "http://localhost:3000";

const Signout = () => {
  const token = localStorage.getItem("token", );
  const navigate = useNavigate();
  const handleSignout = () => {
    axios.delete(`${BASE_URL}/api/sign_out`).then((res) => {
      logout(res);
      navigate("/signin");
    });
  };

  return (
    <li className="nav-item">
      <button onClick={handleSignout} className="btn btn-link">
        Signout
      </button>
    </li>
  );
};

export default Signout;
