import React from 'react';

const SignUpButton = () => {
  const handleSignUp = () => {
    // Redirect the user to the Devise sign-in route
    window.location.href = '/users/sign_up'; // Update this with your actual Devise route
  };

  return (
    <button onClick={handleSignUp}>
      Sign Up
    </button>
  );
};

export default SignUpButton;