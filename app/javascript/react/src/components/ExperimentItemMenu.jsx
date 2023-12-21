import React from "react";
import "../../../../assets/stylesheets/experimentPage.css";
import PlayButton from "./PlayButton.jsx";

export default function ExperimentItemMenu({ experiment, handleOnClick }) {
  return (
    <div className="menuExperimentPage">
      <div
        key={experiment.name}
        onClick={() => handleOnClick(experiment.id, experiment.name)}
      >
        {experiment.name}
      </div>
      <PlayButton
        disabled={experiment.disabled}
        type="exp-button"
        getRunning={() => {}}
      />
    </div>
  );
}
