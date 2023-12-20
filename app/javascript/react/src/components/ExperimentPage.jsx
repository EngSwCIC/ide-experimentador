import React, { useEffect, useState } from "react";
import Card from "./Card";
import "../../../../assets/stylesheets/experimentPage.css";
import HeaderExperimentPage from "./HeaderExperimentPage";
import ExperimentItemMenu from "./ExperimentItemMenu";
import Modal from "./Modal";
import { useModal } from "../dropdownContext.jsx";
import EmptyListTrials from "./EmptyListTrials.jsx";

export default function ExperimentPage() {
  const [experimentsInfos, setExperimentsInfos] = useState([]);
  const [trials, setTrials] = useState([]);
  const { open: open, setOpen: setOpen } = useModal();

  const [experimentName, setExperimentName] = useState();

  useEffect(() => {
    fetch("/api/experiments/").then(async (res) => {
      const listOfExperiments = await res.json();

      setExperimentsInfos(listOfExperiments);
    });
  }, []);

  function handleOnClick(id, name, disabled) {
    const path = "/api/experiments/" + id + "/trial";
    fetch(path).then(async (trials) => {
      const listOfTrials = await trials.json();
      if (disabled) {
        listOfTrials.map((item) => {
          item.disabled = true;
        });
      }
      setTrials(listOfTrials);
    });

    setExperimentName(name);
  }

  function handleModalClose() {
    setOpen(false);
  }

  return (
    <div className="container">
      <div className="containerMenuExperiments">
        {experimentsInfos.map((experiment) => {
          return (
            <ExperimentItemMenu
              experiment={experiment}
              handleOnClick={() =>
                handleOnClick(
                  experiment.id,
                  experiment.name,
                  experiment.disabled
                )
              }
              key={Math.random()}
            />
          );
        })}
      </div>

      <div className="containerExperimentPage">
        <HeaderExperimentPage name={experimentName} />
        {open && <Modal isModalOpen={open} closeModal={handleModalClose} />}
        {trials.length != 0 && (
          <div className="list-cards">
            {trials.map((trial) => {
              return (
                <Card
                  name={trial.name}
                  disabled={trial.disabled}
                  deleted={trial.deleted}
                  runs={trial.runs}
                  trialId={trial.id}
                  key={Math.random()}
                />
              );
            })}
          </div>
        )}

        {trials.length == 0 && <EmptyListTrials />}
      </div>
    </div>
  );
}
