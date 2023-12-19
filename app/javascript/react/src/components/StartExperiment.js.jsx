import React from "react";
import jsonData from "../../../../../exemploCurtoReq.json";

const StartExperiment = () => {
  const handleClick = () => {
    fetch(`http://localhost:3001/run`, {
      method: "POST",
      headers: {
        'content-type': 'application/json'
    },
      body: JSON.stringify(jsonData),
    })
      .then((response) => {
        if (!response.ok) {
          <span>Falha para iniciar teste</span>;
        }
        return response.json();
      })
      .then((data) => {
        console.log(data);
      });
  };

  return (
    <button onClick={handleClick}>
      <svg
        xmlns="http://www.w3.org/2000/svg"
        width="24"
        height="24"
        viewBox="0 0 24 24"
        fill="none"
      >
        <path
          d="M5 3L19 12L5 21V3Z"
          stroke="#00DE09"
          stroke-width="2"
          stroke-linecap="round"
          stroke-linejoin="round"
        />
      </svg>
    </button>
  );
};

export default StartExperiment;
