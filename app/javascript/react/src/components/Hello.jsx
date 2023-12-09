import React, { useEffect, useState } from "react";
import "../../../../assets/stylesheets/modal.css";
import Modal from "./Modal";

const Hello = (props) => {
  // let [count, setCount] = useState(0);
  // let [req, setReq] = useState("");
  // useEffect(() => {
  //   fetch("/hello/worldGet")
  //     .then(async (res) => {
  //       const parse = await res.text();
  //       console.log(parse);
  //       return parse;
  //     })
  //     .then((res) => setReq(res));
  // }, []);

  const [isModalOpen, setModalOpen] = useState(false);

  function openModal() {
    setModalOpen(true);
  }

  function closeModal() {
    setModalOpen(false);
  }

  return (
    <div>
      <button onClick={() => openModal()}>Abrir modal</button>
      <Modal isModalOpen={isModalOpen} closeModal={closeModal} />
    </div>
  );
};

export default Hello;
