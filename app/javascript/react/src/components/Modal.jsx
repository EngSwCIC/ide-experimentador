import React, { useState } from "react";

import "../../../../assets/stylesheets/modal.css";

import BatteryPage from "../components/ModalPages/BatteryPage";
import LocationPage from "../components/ModalPages/LocationPage";
import SpeedPage from "../components/ModalPages/SpeedPage";
import SkillsPage from "../components/ModalPages/SkillsPage";

export default function Modal({ isModalOpen, closeModal }) {
  const [isBatteryPageOpen, setBatteryPageOpen] = useState(true);
  const [isLocationPageOpen, setLocationPageOpen] = useState(false);
  const [isSpeedPageOpen, setSpeedPageOpen] = useState(false);
  const [isSkillsPageOpen, setSkillsPageOpen] = useState(false);

  return (
    <div>
      {isModalOpen && (
        <div onClick={closeModal} className="modal-overlay">
          <div onClick={(e) => e.stopPropagation()} className="modal">
            <button className="close-button" onClick={closeModal}>
              <img
                className="close"
                src={"/modal_close.svg"}
                alt="Close"
                onClick={closeModal}
              />
            </button>
            <button
              onClick={() => {
                setBatteryPageOpen(true);
                setLocationPageOpen(false);
                setSpeedPageOpen(false);
                setSkillsPageOpen(false);
              }}
            >
              <img
                className="battery"
                src={"/modal_battery.svg"}
                alt="Battery"
              />
            </button>
            <button
              onClick={() => {
                setBatteryPageOpen(false);
                setLocationPageOpen(true);
                setSpeedPageOpen(false);
                setSkillsPageOpen(false);
              }}
            >
              <img
                className="location"
                src={"/modal_location.svg"}
                alt="Location"
              />
            </button>
            <button
              onClick={() => {
                setBatteryPageOpen(false);
                setLocationPageOpen(false);
                setSpeedPageOpen(true);
                setSkillsPageOpen(false);
              }}
            >
              <img className="speed" src={"/modal_speed.svg"} alt="Speed" />
            </button>
            <button
              onClick={() => {
                setBatteryPageOpen(false);
                setLocationPageOpen(false);
                setSpeedPageOpen(false);
                setSkillsPageOpen(true);
              }}
            >
              <img className="skills" src={"/modal_skills.svg"} alt="Skills" />
            </button>
            <div className="modal-container">
              {isBatteryPageOpen && <BatteryPage />}
              {isLocationPageOpen && <LocationPage />}
              {isSpeedPageOpen && <SpeedPage />}
              {isSkillsPageOpen && <SkillsPage />}
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
