import React from 'react';
import SignInButton from './SignInButton'; // Update with the correct path to your SignInButton component
import SignOutButton from './SignOutButton'; // Update with the correct path to your SignOutButton component
//import SignUpButton from './SignUpButton'; // Update with the correct path to your SignUpButton component

const YourPageWithSignIn = () => {
  return (
    <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center', height: '100vh', backgroundColor: '#f7fafc' }}>
      <h1 style={{ fontSize: '1.875rem', fontWeight: 'bold', marginBottom: '2rem', color: '#2d3748' }}>Welcome to Your Page</h1>
      <div style={{ backgroundColor: '#ffffff', boxShadow: '0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06)', borderRadius: '0.375rem', padding: '1.5rem' }}>
        {/* Use SignInButton */}
        <SignInButton />
        {/* Use SignOutButton */}
        <SignOutButton />
      </div>
    </div>
  );
};

export default YourPageWithSignIn;