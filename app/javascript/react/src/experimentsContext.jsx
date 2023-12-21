import React, { createContext, useState, useContext } from "react";

const ExperimentsContext = createContext();

function ExperimentsProvider({ children }) {
  const [runActiveTrials, setRunActiveTrials] = useState(false);
  const [runningTrial, setRunningTrial] = useState(false);

  value = {
    runActiveTrials,
    setRunActiveTrials,
    runningTrial,
    setRunningTrial,
  };
  return (
    <ExperimentsContext.Provider value={value}>
      {children}
    </ExperimentsContext.Provider>
  );
}

function useExperiments() {
  return useContext(ExperimentsContext);
}

export { ExperimentsProvider, useExperiments };
