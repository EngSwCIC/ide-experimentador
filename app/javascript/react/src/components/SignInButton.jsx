import React from 'react';

const SignInButton = () => {
  const handleSignIn = () => {
    // Redirect the user to the Devise sign-in route
    window.location.href = '/users/sign_in'; // Update this with your actual Devise route
  };

  return (
    <button onClick={handleSignIn}>
      Sign In
    </button>
  );
};

export default SignInButton;