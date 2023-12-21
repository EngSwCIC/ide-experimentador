import React, { useState, useEffect } from "react";
import { LineChart, Line, CartesianGrid, XAxis, YAxis, Label } from 'recharts'

const BatteryTableComponent  = () => {
    const [dado, setDado] = useState([{status: 'string', log: 'string', trial_id: null, created_at: "string", updated_at: 'string' 
    }]);
    const [display, setDisplay] = useState( [{ identification: null, time: 'string', level: null },]);

    const [trials, setTrials] = useState(['']);

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

      }, [dado]); 

    useEffect(() => {
      const batteryLevels = []
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
    }, [trials])

    try{
    const groupedData = {};
    display.forEach(item => {
      if (!groupedData[item.identification]) {
        groupedData[item.identification] = [];
      }
      groupedData[item.identification].push(item);
    })
    setDisplay(groupedData);}catch{}
    

return (
    <div className="container_logs">
      <h1>Robot Battery Graph</h1>
      <input id="trial_input" className="input_log" type="text" defaultValue={trials} placeholder="Digite o id do trial" onChange={(e) => setTrials(e.target.value)}></input>
      {Object.keys(display).length != 0 ? (
        Object.keys(display).map(identification => (
        <div className="background_logs" key={identification}>
          <h2 className="title_logs">Trial ID: {identification}</h2>
          <LineChart width={800} height={300} data={display[identification]}>
            <Line type="monotone" dataKey="level" stroke="#8884d8" />
            <CartesianGrid stroke="#ccc" />
            <XAxis dataKey="time" >
              <Label className="label_graphX" value="Tempo" offset={-1} position="insideBottom" />
            </XAxis>
            <YAxis>
              <Label className="label_graphY" angle={-90} value="Bateria" offset={20} position="insideLeft" />
            </YAxis>

          </LineChart>
        </div>
      ))): (
        <p>Não existem dados de bateria</p>
      )
      
      }
    </div>
  );
}


export default BatteryTableComponent
