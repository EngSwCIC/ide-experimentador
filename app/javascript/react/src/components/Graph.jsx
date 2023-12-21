import React, {useEffect, useState} from 'react'
import { LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, Legend } from 'recharts';

const Graph = () => {
  const pathSegments = window.location.pathname.split('/');
  const id = pathSegments[pathSegments.length - 1]; // pegar ID do log
  
  let [req, setReq] = useState("")
  useEffect(() => {
    fetch(`/graph/skillsGet/${id}`).then(async res=>{
      const parse = await res.text()
      return parse
    }).then(res=>setReq(res))
  }, [])


  return (
    <div>
      <Component req={req}></Component>
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
  errorList = []
  reqArray.forEach(function(key, index){
    switch (index){
    case 0: // primeira message tem que ser start
      if(key.message == 'Experiment started!'){
        semRepLista.push({"time": 0.00, "message": "Start!"})
      }
      else{
        semRepLista.push({"time": 0.00, "message": "NOT STARTED!"}) // se nao, nao comecou
        errorList.push({"time": 0.00, "message": "Error in start"})
      }
      break;
    
    case reqArray.length - 1: // última message tem que ser sucesso
      if(key.message.includes('Experiment completed successfully')){
        semRepLista.push({"time": key.time, "message": "Success!"}) 
      }

      else{
        if(key.message.includes('Skill')){  // ou falhou em alguma skill
          errorList.push({"time": key.time, "message": key.message.substring(5)})
        }

        if(key.message.includes('Experiment failed')){  // ou faltou skill
          errorList.push({"time": key.time, "message": key.message})
        }

        if(key.message.includes('TIMEOUT')){  // ou deu TIMEOUT
          errorList.push({"time": reqArray[index - 1].time, "message": key.message})
        }

        if(key.message.includes('Battery')){  // ou acabou a bateria
          errorList.push({"time": reqArray[index - 1].time, "message": key.message})
        }

        else if(errorList.length == 0){
          errorList.push({"time": reqArray[index - 1].time, "message": 'No action taken.'})
        }
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

      <div>
        {errorList.length > 0 ? (
          errorList.map((item, index) => (
            <div key={index}>
              <p>Experiment failed at {item.time} seconds: {item.message}</p>
            </div>
          ))
          ) : semRepLista.length <= 1 ? (
            <p>Experimento sem ações!</p>
        ) : (
          <p>Sucesso!</p>
        )}
      </div>


    </div>
  );
};
 
export default Graph 