import React, { useState } from 'react';

const ExperimentList = () => {
  const [experiments, setExperiments] = useState([
    { id: 1, name: 'Experimento 1', isPaused: false },
    { id: 2, name: 'Experimento 2', isPaused: true },
    // ...mais experimentos
  ]);

  const handlePausePlay = (id) => {
    setExperiments((prevExperiments) =>
      prevExperiments.map((exp) =>
        exp.id === id ? { ...exp, isPaused: !exp.isPaused } : exp
      )
    );
  };

  const handleEditName = (id) => {
    const newName = prompt('Novo nome:');
    setExperiments((prevExperiments) =>
      prevExperiments.map((exp) =>
        exp.id === id ? { ...exp, name: newName } : exp
      )
    );
  };

  return (
    <div>
      {experiments.map((experiment) => (
        <div key={experiment.id} className="mb-2">
          <p className="text-white">{experiment.name}</p>
          <button
            onClick={() => handlePausePlay(experiment.id)}
            className="mr-2 p-1 bg-blue-500 text-white rounded"
          >
            {experiment.isPaused ? 'Play' : 'Pause'}
          </button>
          <button
            onClick={() => handleEditName(experiment.id)}
            className="p-1 bg-green-500 text-white rounded"
          >
            Editar Nome
          </button>
        </div>
      ))}
    </div>
  );
};

export default ExperimentList;