import React, { useState } from "react";
import "../../../../assets/stylesheets/card.css";
import { useExperiments } from "../experimentsContext";

export default function PlayButton({ disabled, activated, type, getRunning }) {
  const [canRun, setCanRun] = useState(false);
  const { runActiveTrials, setRunActiveTrials, setRunningTrial } =
    useExperiments();

  function handlePlayButton() {
    if (!disabled) {
      setCanRun(!canRun);
      getRunning(!canRun);
    }

    if (type == "exp-button") {
      setRunningTrial(!canRun);
      setRunActiveTrials(!runActiveTrials);
    }
  }

  return (
    <div onClick={handlePlayButton}>
      {disabled ? (
        <img
          src="/card-icons/play-unactivated.svg"
          alt="Executar"
          className="play-button"
        />
      ) : (
        <img
          src={
            canRun || (runActiveTrials && activated)
              ? "/card-icons/running-stop.svg"
              : "/card-icons/play.svg"
          }
          alt="Executar"
          className={canRun ? "running-button" : "play-button"}
        />
      )}
    </div>
  );
}
