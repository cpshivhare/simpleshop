export const login = (res) => {
  if(res.status == "200") {
    localStorage.setItem("token", res.headers.authorization);
    localStorage.setItem("userEmail", res.data.data.user.email);
  }
}

export const logout = (res) => {
  if(res.status == "200") {
    localStorage.removeItem('token');
    localStorage.removeItem('userEmail');
  }
}

export const isLogin = () => {
  if (localStorage.getItem('token')) {
    return true;
  }

  return false;
}