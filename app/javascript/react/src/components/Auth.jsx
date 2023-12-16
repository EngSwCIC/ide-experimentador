import React from 'react';
import SignInButton from './SignInButton'; // Update with the correct path to your SignInButton component
import '/home/andredfs/ide-experimentador-grupo-4/app/assets/stylesheets/application.css';

const YourPageWithSignIn = () => {
  return (
    <div className="flex flex-col items-center justify-center h-screen bg-gray-100">
      <h1 className="text-3xl font-bold mb-8 text-gray-800">Welcome to Your Page</h1>
      <div className="bg-white shadow-md rounded-lg p-6">
        {/* Use SignInButton */}
        <SignInButton />
      </div>
    </div>
  );
};

export default YourPageWithSignIn;