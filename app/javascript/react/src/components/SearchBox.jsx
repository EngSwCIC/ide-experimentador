import React, { useState } from 'react';

const SearchBox = () => {
  const [searchTerm, setSearchTerm] = useState('');

  const handleSearch = (e) => {
    setSearchTerm(e.target.value);
    // Lógica para filtrar experimentos no componente ExperimentList
  };

  return (
    <div className="mb-4">
      <input
        type="text"
        placeholder="Pesquisar"
        value={searchTerm}
        onChange={handleSearch}
        className="w-full p-2 rounded"
      />
    </div>
  );
};

export default SearchBox;