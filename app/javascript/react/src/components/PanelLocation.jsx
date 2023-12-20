import React, { useState, useEffect } from 'react';
import { readLogFile, extractRobotPositionData } from "../logProcessorLocation"; // Importe suas funções

const PanelLocation = () => {
const [data, setData] = useState([{ x: 0, y: 0 }]); 
const [error, setError] = useState(""); // Estado para a mensagem de erro

const stylePanel= {
  color: 'black',
  fontSize: '20px',
  display: 'flex',
  flexDirection: 'column',
  justifyContent: 'center',
  alignItems: 'center',
  backgroundColor: '#FFF',
};

const handleFileUpload = async (event) => {
  const file = event.target.files[0];
  const logData = await readLogFile(file);
  const result = extractRobotPositionData(logData); // Use a função correta aqui
  console.log(result);

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

const escalaX = 4;// Ajuste as escalas para o tamanho desejado do plano cartesiano
const escalaY = 4;// Ajuste as escalas para o tamanho desejado do plano cartesiano

const [index, setIndex] = useState(0);

useEffect(() => {
  const intervalId = setInterval(() => {
    setIndex((prevIndex) => (prevIndex === data.length - 1 ? 0 : prevIndex + 1));
  }, 2000); // Ajuste o intervalo de tempo entre os pontos conforme necessário

  return () => clearInterval(intervalId);
}, [data.length]);

const animatedProps = {
  cx: data[index].x * escalaX + 400,
  cy: -data[index].y * escalaY + 400,
};

return (
  <div style={stylePanel}>
    <h1>Panel Location</h1>
    <input type="file" onChange={handleFileUpload} />
    {error && <div style={{ color: "red" }}>{error}</div>}
    <text x={animatedProps.cx} y={animatedProps.cy} fontSize="12" fill="black">
          x: {data[index].x}, y: {data[index].y}
    </text>
    <svg width="800" height="800" >
      
      {/* Desenhe o plano cartesiano */}
      <line x1="0" y1="400" x2="800" y2="400" stroke="gray" />
      <line x1="400" y1="0" x2="400" y2="800" stroke="gray" />

      {/* Desenhe o ponto com animação */}
      <circle cx={animatedProps.cx} cy={animatedProps.cy} r="8" fill="blue"/>

    </svg>
  </div>
);
};

export default PanelLocation;