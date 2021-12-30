import React from "react";
import Item from "./Item";

const Items = ({items}) => {
  return (
    <>
      {
        items && items.map((item, i) => <Item item={item} key={item.id} />)
      }
    </>
  )
};

export default Items;