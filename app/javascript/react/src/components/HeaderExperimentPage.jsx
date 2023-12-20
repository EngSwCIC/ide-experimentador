import React from "react";
import "../../../../assets/stylesheets/experimentPage.css";

export default function HeaderExperimentPage({ name }) {
  return (
    <div className="headerExperimentPage">
      <p className="title-header-experiment-page">{name}</p>
    </div>
  );
}
