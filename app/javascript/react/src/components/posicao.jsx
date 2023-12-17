import React, { useState, useEffect } from "react";

const TableComponent  = () => {
    const [dado, setDado] = useState({
    });
    const [display, setDisplay] = useState({
    });
    const [search, setSearch] = useState(['']);
    const [pivo, setPivo] = useState([1]);

    useEffect(() => {
        fetch("/logs/get_all")
        .then((response) => response.json())
        .then((data) => setDado(data))
        .catch(error => console.error('Error fetching data:', error));
  }, []);

    useEffect(() => {
      try{
      const positionData = [];
      const logLines = dado.log.split("\n");
      // Ajuste na expressão regular para capturar números ou strings nos campos x, y e yaw
      const positionRegex =
        /(\d+\.\d+), \[INFO\], robot[0-9], {'y': ('[^']+'|[\d.-]+), 'x': ('[^']+'|[\d.-]+), 'yaw': ('[^']+'|[\d.-]+)}, None, None\s*/;
    
      for (let line of logLines) {
        const match = line.match(positionRegex);
        if (match) {
          const timeStr = match[1];
          const yStr = match[2].replace(/'/g, ""); // Remove as aspas, se houver
          const xStr = match[3].replace(/'/g, ""); // Remove as aspas, se houver
          const yawStr = match[4].replace(/'/g, ""); // Remove as aspas, se houver
    
          const time = parseFloat(timeStr);
          const y = parseFloat(yStr);
          const x = parseFloat(xStr);
          const yaw = parseFloat(yawStr);
          
          positionData.push({ time, y, x, yaw });
        }
      }
      setDisplay(positionData)
    }catch(error){console.log(error)}

      }, [dado, pivo]); 


    useEffect(() => {
      if (search == ""){
        setPivo(pivo * (-1))
      }
      else{
        const positionData = [];
        const logLines = dado.log.split("\n");
        // Ajuste na expressão regular para capturar números ou strings nos campos x, y e yaw
        const positionRegex =
          /(\d+\.\d+), \[INFO\], robot[0-9], {'y': ('[^']+'|[\d.-]+), 'x': ('[^']+'|[\d.-]+), 'yaw': ('[^']+'|[\d.-]+)}, None, None\s*/;
      
        for (let line of logLines) {
          const match = line.match(positionRegex);
          if (match && match[1] == search) {
            const timeStr = match[1];
            const yStr = match[2].replace(/'/g, ""); // Remove as aspas, se houver
            const xStr = match[3].replace(/'/g, ""); // Remove as aspas, se houver
            const yawStr = match[4].replace(/'/g, ""); // Remove as aspas, se houver
      
            const time = parseFloat(timeStr);
            const y = parseFloat(yStr);
            const x = parseFloat(xStr);
            const yaw = parseFloat(yawStr);
            
            positionData.push({ time, y, x, yaw });
          }
        }
        setDisplay(positionData)
      }
    }, [search])
  
return (
    <div className="container_logs">
      <h2 className="title_logs">Robot Position Table</h2>
      <input className="input_log" type="text" defaultValue={search} placeholder="Digite a palavra-chave" onBlur={(e) => setSearch(e.target.value)}></input>
        {display[0] != undefined ? (
          display.map((data, index) => (
            <table className="table_logs">
              <thead>
                <tr>
                  <th className="itens_logs">Time</th>
                  <th className="itens_logs">X Axis</th>
                  <th className="itens_logs">Y Axis</th>
                  <th className="itens_logs">Yaw</th>
                </tr>
              </thead>
              <tbody>
                <tr key={index}>
                  <td className="itens_logs">{data.time}</td>
                  <td className="itens_logs">{data.x}</td>
                  <td className="itens_logs">{data.y}</td>
                  <td className="itens_logs">{data.yaw}</td>
                </tr>
              </tbody>
            </table>
          ))
        ) : (
          <p>Loading...</p>
        )}
  </div>
  );


}

export default TableComponent
