import React from 'react';
import SearchBox from './SearchBox';
import ExperimentList from './ExperimentList';

const Sidebar = () => {
  return (
    <div className="w-64 bg-gray-800 p-4">
      <SearchBox />
      <ExperimentList />
    </div>
  );
};

export default Sidebar;