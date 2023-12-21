import React from 'react';

const SignOutButton = () => {
  const handleSignOut = () => {
    // Redirect the user to the Devise sign-in route
    window.location.href = '/users/sign_out'; // Update this with your actual Devise route
  };

  return (
    <button onClick={handleSignOut}>
      Sign Out
    </button>
  );
};

export default SignOutButton;