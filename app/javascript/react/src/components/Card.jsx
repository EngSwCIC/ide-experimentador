import React, { useEffect, useState } from "react";

import "../../../../assets/stylesheets/card.css";

import DropdownCard from "./DropdownCard.jsx";
import PlayButton from "./PlayButton.jsx";
import ToggleButton from "./ToggleButton.jsx";
import Status from "./Status.jsx";

export default function Card({ name, disabled, deleted, runs, trialId }) {
  const [log, setLog] = useState({});
  const [status, setStatus] = useState();
  const [activated, setActivated] = useState(false);
  const [running, setRunning] = useState(false);

  useEffect(() => {
    const path = "/api/trial/" + trialId;
    fetch(path).then(async (res) => {
      const parse = await res.json();
      if (parse != undefined) {
        setStatus(parse[0].status);
        const logJSON = await JSON.parse(parse[0].log);

        const x = logJSON.x;
        const y = logJSON.y;
        const z = logJSON.z;
        const battery = logJSON.battery;
        setLog({ x, y, z, battery });
      }
    });
  }, []);

  function nextStateActivated(nextState) {
    if (!disabled) {
      setActivated(nextState);
    } else {
      setActivated(false);
    }
  }

  function nextRunningState(nextState) {
    setRunning(nextState);
  }

  return (
    <div className={disabled ? "card-disactivated" : "card"}>
      <div className="card-header">
        <div className="test-title">{name}</div>

        <div className="tags">
          <div className="tag">
            <img src="/card-icons/tag1.svg" alt="Tag 1" />
          </div>
          <div className="tag">
            <img src="/card-icons/tag2.svg" alt="Tag2" />
          </div>
        </div>

        <div className="options">
          <ToggleButton
            activated={activated}
            getDesactivated={nextStateActivated}
          />
          <PlayButton
            disabled={disabled}
            activated={activated}
            getRunning={nextRunningState}
          />
          <DropdownCard disabled={disabled} />
        </div>
      </div>

      <div className="card-content">
        <div className="features">
          <img src="/card-icons/map-pin.svg" />
          <p className="features-text">
            X:{log.x} Y:{log.y} Z:{log.z}
          </p>
        </div>

        <div className="features">
          <img src="/card-icons/battery-charging.svg" />
          <p className="features-text">{log.battery}</p>
        </div>
      </div>

      <div className="card-bottom">
        <p className="runs">Runs: {runs}</p>
        <Status status={status} running={running} activated={activated} />
      </div>
    </div>
  );
}
