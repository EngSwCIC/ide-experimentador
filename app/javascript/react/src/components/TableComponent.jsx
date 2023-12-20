import React, { useState } from "react";
import { readLogFile, extractRobotPositionData } from "../logProcessor"; // Importe suas funções

const TableComponent = () => {
  const [data, setData] = useState([]); // Estado para os dados da tabela
  const [error, setError] = useState(""); // Estado para a mensagem de erro

  const handleFileUpload = async (event) => {
    const file = event.target.files[0];
    const logData = await readLogFile(file);
    const result = extractRobotPositionData(logData); // Mudança para a função correta

    if (result.status === "error") {
      // Se houver um erro, definir a mensagem de erro
      setError(result.message);
      setData([]); // Limpar os dados existentes
    } else {
      // Caso contrário, atualizar os dados
      setData(result.data);
      setError(""); // Limpar a mensagem de erro
    }
  };

  return (
    <div>
      <h2>Robot Position Table</h2>
      <input type="file" onChange={handleFileUpload} />
      {error && <div style={{ color: "red" }}>{error}</div>}
      <table>
        <thead>
          <tr>
            <th>Tempo</th>
            <th>X</th>
            <th>Y</th>
            <th>Yaw</th>
          </tr>
        </thead>
        <tbody>
          {data.map((row, index) => (
            <tr key={index}>
              <td>{row.time}</td>
              <td>{row.x}</td>
              <td>{row.y}</td>
              <td>{row.yaw}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default TableComponent;
