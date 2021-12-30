import React from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";

const BASE_URL = "http://localhost:3000";

const ShippingAddressForm = ({ shippingAddress, order }) => {
  const [stateSppingAddress, setstateSppingAddress] = React.useState({});
  const [data, setData] = React.useState([]);
  const navigate = useNavigate();


  const handleForm = (event) => {
    event.preventDefault();
    axios
      .put(`${BASE_URL}/api/v1/orders/${order.id}`, {
        order: {
          id: order.id,
          receiver_name: data.order_receiver_name,
          shipping_address_attributes: {
            id: stateSppingAddress.id,
            user_id: order.user_id,
            zipcode: data.zip,
            country: data.country,
            city: data.city,
            state: data.state,
            address_1: data.address_1,
            address_2: data.address_2,
            telephone: data.telephone,
            default: true
          },
        },
      })
      .then((res) => {
        if(res.status == '200'){
          navigate("/complete-order-page");
        }
      });
  };

  return (
    <div className="col-md-8 order-md-1">
      <h4 className="mb-3">Shipping address</h4>
      <form className="needs-validation" onSubmit={handleForm}>
        <div className="mb-3">
          <label htmlFor="username">Order receiver name</label>
          <div className="input-group">
            <input
              type="text"
              className="form-control"
              id="order_receiver_name"
              name="order_receiver_name"
              placeholder="Order receiver name"
              value={order.receiver_name}
              onChange={(e) =>
                setData({
                  ...data,
                  [`${e.target.name}`]: e.target.value,
                })
              }
            />
          </div>
        </div>
        <div className="mb-3">
          <label htmlFor="address">Address</label>
          <input
            type="text"
            className="form-control"
            id="address_1"
            name="address_1"
            required={true}
            value={stateSppingAddress.address_1}
            onChange={(e) =>
              setData({
                ...data,
                [`${e.target.name}`]: e.target.value,
              })
            }
          />
        </div>
        <div className="mb-3">
          <label htmlFor="address2">
            Address 2 <span className="text-muted">(Optional)</span>
          </label>
          <input
            type="text"
            className="form-control"
            d="address_2"
            name="address_2"
            value={stateSppingAddress.address_2}
            onChange={(e) =>
              setData({
                ...data,
                [`${e.target.name}`]: e.target.value,
              })
            }
          />
        </div>

        <div className="row">
          <div className="col-md-3 mb-3">
            <label htmlFor="zip">Zip</label>
            <input
              type="text"
              className="form-control"
              id="zip"
              name="zip"
              required={true}
              value={stateSppingAddress.zip}
              onChange={(e) =>
                setData({
                  ...data,
                  [`${e.target.name}`]: e.target.value,
                })
              }
            />
          </div>
          <div className="col-md-3 mb-3">
            <label htmlFor="country">Country</label>
            <input
              type="text"
              className="form-control"
              id="country"
              name="country"
              required={true}
              value={stateSppingAddress.country}
              onChange={(e) =>
                setData({
                  ...data,
                  [`${e.target.name}`]: e.target.value,
                })
              }
            />
          </div>
          <div className="col-md-3 mb-3">
            <label htmlFor="state">State</label>
            <input
              type="text"
              className="form-control"
              id="state"
              name="state"
              required={true}
              value={stateSppingAddress.state}
              onChange={(e) =>
                setData({
                  ...data,
                  [`${e.target.name}`]: e.target.value,
                })
              }
            />
          </div>

          <div className="col-md-3 mb-3">
            <label htmlFor="zip">city</label>
            <input
              type="text"
              className="form-control"
              id="city"
              name="city"
              required={true}
              value={stateSppingAddress.city}
              onChange={(e) =>
                setData({
                  ...data,
                  [`${e.target.name}`]: e.target.value,
                })
              }
            />
          </div>
        </div>
        <div className="row">
          <div className="col-md-12 mb-12">
            <label htmlFor="zip">Telephone</label>
            <input
              type="phone"
              className="form-control"
              id="telephone"
              name="telephone"
              required={true}
              value={stateSppingAddress.telephone}
              onChange={(e) =>
                setData({
                  ...data,
                  [`${e.target.name}`]: e.target.value,
                })
              }
            />
          </div>
        </div>
        <hr className="mb-4" />
        <div className="custom-control custom-checkbox">
          <input
            type="checkbox"
            className="custom-control-input"
            id="same-address"
            checked={true}
            disabled={true}
          />
          <label className="custom-control-label" htmlFor="same-address">
            Shipping address will be save for feature
          </label>
        </div>

        <hr className="mb-4" />
        <button className="btn btn-primary btn-lg btn-block" type="submit">
          Continue to checkout
        </button>
      </form>
    </div>
  );
};

export default ShippingAddressForm;
