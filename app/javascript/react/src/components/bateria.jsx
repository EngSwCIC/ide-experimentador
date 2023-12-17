import React, { useState, useEffect } from "react";

const BatteryTableComponent  = () => {
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
      const batteryLevels = [];
      const logLines = dado.log.split("\n");
      // Ajuste na expressão regular para capturar números ou strings nos campos x, y e yaw
      const batteryLevelRegex =
      /(\d+\.\d+), \[INFO\], robot[0-9], {'battery-level': '([^']+)'}\s*/;
    
      for (let line of logLines) {
        const match = line.match(batteryLevelRegex);
        if (match) {
            const time =  match[1];
            const levelStr = match[2];
            const level = parseFloat(levelStr);
            
            batteryLevels.push({time, level});
        }
      }
      setDisplay(batteryLevels)
    }catch(error){console.log(error)}

      }, [dado, pivo]); 


    useEffect(() => {
      if (search == ""){
        setPivo(pivo * (-1))
      }
      else{
        const batteryLevels = [];
        const logLines = dado.log.split("\n");
        // Ajuste na expressão regular para capturar números ou strings nos campos x, y e yaw
        const batteryLevelRegex =
        /(\d+\.\d+), \[INFO\], robot[0-9], {'battery-level': '([^']+)'}\s*/;
      
        for (let line of logLines) {
          const match = line.match(batteryLevelRegex);
          if (match && match[1] == search) {
            const time =  match[1];
            const levelStr = match[2];
            const level = parseFloat(levelStr);
            
            batteryLevels.push({time, level});
          }
        }
        setDisplay(batteryLevels)
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
                  <th className="itens_logs">Battery</th>
                </tr>
              </thead>
              <tbody>
                <tr key={index}>
                  <td className="itens_logs">{data.time}</td>
                  <td className="itens_logs">{data.level}</td>
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

export default BatteryTableComponent
