import React from "react";
import ExperimentPage from "./ExperimentPage";
import { DropdownCardProvider } from "../dropdownContext";
import { ExperimentsProvider } from "../experimentsContext";

function Home() {
  return (
    <ExperimentsProvider>
      <DropdownCardProvider>
        <ExperimentPage />
      </DropdownCardProvider>
    </ExperimentsProvider>
  );
}

export default Home;
