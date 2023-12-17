import React, {useEffect, useState} from 'react'
import { LineChart, Line, BarChart, Bar, Cell, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer } from 'recharts';
import styles from './Graph.module.css'

function Graph(){                                   
  let [req, setReq] = useState("")
  useEffect(() => {
    fetch("/graph/skillsGet").then(async res=>{
      const parse = await res.text()
      return parse
    }).then(res=>setReq(res))
  }, [])


  return (
    <div>
      <Component req={req} className={styles.req}></Component>
    </div>
  )                   
} 

const Component = ({ req }) => {
  try {
    reqArray = JSON.parse(req);
  } catch (error) {
    console.error('Erro ao fazer parse da string JSON:', error);
    reqArray = [];
  }

  semRepLista = []
  reqArray.forEach(function(key, index){
    switch (index){
    case 0:
      if(key.message == 'Experiment started!'){
        semRepLista.push({"time": 0.00, "message": "Start!"})
      }
      break;
    
    case reqArray.length - 1:
      if(key.message == 'Experiment completed successfully with 130.37 seconds!'){
        semRepLista.push({"time": reqArray[index - 1].time, "message": "Success!"}) 
      }
      break;

    default:
      if(key.time == reqArray[index+1].time && key.message == reqArray[index+1].message){
        if(semRepLista[semRepLista.length-1].message != key.message){
          semRepLista.push(key)
        }
      }

      if(key.time == reqArray[index+1].time && key.message != reqArray[index+1].message){
        if(key.message == 'Sending message to nurse' || key.message == 'Waiting the message get to nurse'){
          if(semRepLista[semRepLista.length-1].message != 'Sending message to nurse'){
            semRepLista.push({"time": key.time, "message":"Sending message to nurse"})
          }
        }
      }

      if(key.message.includes("Message sent to")){
        if(semRepLista[semRepLista.length-1].message != key.message){
          semRepLista.push({"time": key.time, "message":'Message sent!'})
        }
      }
    }  
  })

  console.log(reqArray)
  console.log(semRepLista)
  return (
    <div>
      <LineChart
          width={1300}
          height={300}
          data={semRepLista}
          margin={{
            top: 5,
            right: 30,
            left: 20,
            bottom: 5
          }}
      >
          <CartesianGrid strokeDasharray="3 3" />
          <XAxis dataKey="message"/>
          <YAxis dataKey="time"/>
          <Tooltip />
          <Legend />
          <Line
            type="monotone"
            dataKey="time"
            stroke="#8884d8"
            activeDot={{ r: 8 }}
          />
      </LineChart>
    </div>
  );
};
 
export default Graph 
