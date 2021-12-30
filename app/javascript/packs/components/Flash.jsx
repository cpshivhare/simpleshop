import React from "react";
import FlashMessage from 'react-flash-message'


const Flash = (message, duration = 5000, showMessage = false) =>{
  if(showMessage)
    return(
      <div>
        <FlashMessage duration={duration}>
          <strong>{message}</strong>
        </FlashMessage>
      </div>
    );
  else
    return null;
  end
}

export default Flash;

