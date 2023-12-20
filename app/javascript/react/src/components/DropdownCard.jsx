import React, { useState } from "react";
import "../../../../assets/stylesheets/card.css";
import { useModal } from "../dropdownContext";

export default function DropdownCard({ disabled }) {
  const [dropdownOpen, setDropdownOpen] = useState(false);
  const { open, setOpen } = useModal();

  function handleDropwdonOpen() {
    if (!disabled) {
      setDropdownOpen(!dropdownOpen);
    } else {
      setDropdownOpen(false);
    }
  }

  function handleModalOpen() {
    setOpen(!open);
  }

  return (
    <div>
      <button onClick={handleDropwdonOpen} className="dropdown-card">
        <img
          src="/card-icons/more-horizontal.svg"
          alt="Mais"
          className="drop-down"
        />
        {dropdownOpen ? (
          <ul className="dropdown-menu">
            <li className="dropdown-item">
              <div onClick={handleModalOpen}>Mais opções</div>
            </li>
          </ul>
        ) : null}
      </button>
    </div>
  );
}
