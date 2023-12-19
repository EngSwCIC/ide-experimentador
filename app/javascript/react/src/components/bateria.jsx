import React, { useState, useEffect } from "react";

const BatteryTableComponent  = () => {
    const [dado, setDado] = useState({
    });
    const [display, setDisplay] = useState({
    });
    const [search, setSearch] = useState(['']);
    const [trials, setTrials] = useState(['']);
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
        if (trials == ''){
          for (let trial_execution of dado){
            const identification = trial_execution.trial_id
            const logLines = trial_execution.log.split("\n");
            
            const batteryLevelRegex =
            /(\d+\.\d+), \[INFO\], robot[0-999], {'battery-level': '([^']+)'}\s*/;
          
            for (let line of logLines) {
              const match = line.match(batteryLevelRegex);
              if (match) {
                const time =  match[1];
                const levelStr = match[2];
                const level = parseFloat(levelStr);
                
                batteryLevels.push({identification, time, level});
              }
            }
          }
        setDisplay(batteryLevels)
        }

        else{
          for (let trial_execution of dado){
            const identification = trial_execution.trial_id
            const logLines = trial_execution.log.split("\n");

            const batteryLevelRegex =
            /(\d+\.\d+), \[INFO\], robot[0-999], {'battery-level': '([^']+)'}\s*/;

            for (let line of logLines) {
              const match = line.match(batteryLevelRegex);
              if (match && identification == trials) {
                const time =  match[1];
                const levelStr = match[2];
                const level = parseFloat(levelStr);
                
                batteryLevels.push({identification, time, level});
              }
            }
          } 
        setDisplay(batteryLevels)
        }
    }catch(error){console.log(error)}

      }, [dado, pivo]); 


    useEffect(() => {
      if (search == ""){
        setPivo(pivo * (-1))
      }
      else{
        const batteryLevels = [];
        if (trials == ''){
          for (let trial_execution of dado){
            const identification = trial_execution.trial_id
            const logLines = trial_execution.log.split("\n");
            
            const batteryLevelRegex =
            /(\d+\.\d+), \[INFO\], robot[0-999], {'battery-level': '([^']+)'}\s*/;
          
            for (let line of logLines) {
              const match = line.match(batteryLevelRegex);
              if (match && match[1] == search) {
                const time =  match[1];
                const levelStr = match[2];
                const level = parseFloat(levelStr);
                
                batteryLevels.push({identification, time, level});
              }
            }
          }
        setDisplay(batteryLevels)
        }

        else{
          console.log(dado)
          for (let trial_execution of dado){
            const identification = trial_execution.trial_id
            const logLines = trial_execution.log.split("\n");

            const batteryLevelRegex =
            /(\d+\.\d+), \[INFO\], robot[0-999], {'battery-level': '([^']+)'}\s*/;

            for (let line of logLines) {
              const match = line.match(batteryLevelRegex);
              if (match && match[1] == search && identification == trials) {
                const time =  match[1];
                const levelStr = match[2];
                const level = parseFloat(levelStr);
                
                batteryLevels.push({identification, time, level});
              }
            }
          } 
        setDisplay(batteryLevels)
        }
      }
    }, [search, trials])
  
return (
    <div className="container_logs">
      <h2 className="title_logs">Robot Battery Table</h2>
      <input id="trial_input" className="input_log" type="text" defaultValue={trials} placeholder="Digite o id do trial" onChange={(e) => setTrials(e.target.value)}></input>
      <input id="battery_input" className="input_log" type="text" defaultValue={search} placeholder="Digite a palavra-chave" onChange={(e) => setSearch(e.target.value)}></input>
        {display[0] != undefined ? (
          display.map((data, index) => (
            <table className="table_logs">
              <thead>
                <tr>
                  <th className="itens_logs">Trial ID</th>
                  <th className="itens_logs">Time</th>
                  <th className="itens_logs">Battery</th>
                </tr>
              </thead>
              <tbody>
                <tr key={index}>
                  <td className="itens_logs">{data.identification}</td>
                  <td className="itens_logs">{data.time}</td>
                  <td className="itens_logs">{data.level}</td>
                </tr>
              </tbody>
            </table>
          ))
        ) : (
          <p>Não existem dados de bateria para esse momento</p>
        )}
  </div>
  );


}

export default BatteryTableComponent
