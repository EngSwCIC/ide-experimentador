import React, {useEffect, useState} from 'react'
import { BarChart, Bar, Cell, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer } from 'recharts';
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

  return (
    <div>
      {reqArray.map((item, index) => (
        <div key={index}>
          {item.hasOwnProperty('time') && (
            <p>Time: {item.time}</p>
          )}
          <p>Message: {item.message}</p>
        </div>
      ))}
      
      <GraphSkills req = {reqArray}/>
    </div>
  );
};
 

const GraphSkills = ({req}) => {
  
  const labelSkills = []
  const dataSkills = []

  try {
      req.forEach(function(key){
          if(!labelSkills.includes(key.message)){
            labelSkills.push(key.message)
            dataSkills[labelSkills.indexOf(key.message)] = 1
      
          } else{
            dataSkills[labelSkills.indexOf(key.message)] += 1
          } 
      })
    } catch (error) {
      console.error('Erro ao fazer parse da string JSON:', error);
    }

  var lista = []
  labelSkills.forEach(function(key){
    lista.push({"label": key, "data": dataSkills[labelSkills.indexOf(key)]})
  })

  
  return (
    <div>
      <BarChart
        width={3000}
        height={700}
        data={lista}
        margin={{
          top: 50,
          right: 30,
          left: 20,
          bottom: 5
        }}
      >
        <CartesianGrid strokeDasharray="3 3" />
        <XAxis dataKey="label" />
        <YAxis />
        <Tooltip />
        <Legend />
        <Bar dataKey="data" fill="#8884d8" />
      </BarChart>
    </div>
  )
}

/* const Graph = () =>{
  let [req, setReq] = useState("")
  useEffect(() => {
    fetch("/graph/skillsGet").then(async res=>{
      const parse = await res.text()
      return parse
    }).then(res=>setReq(res))
  }, [])

  /* reqArray = []

  const labelSkills = []
  const dataSkills = []

  if(req.length > 0){
    reqArray = JSON.parse(req);
    reqArray.forEach(function(key){
        if(!labelSkills.includes(key.message)){
          labelSkills.push(key.message)
          dataSkills[labelSkills.indexOf(key.message)] = 1
    
        } else{
          dataSkills[labelSkills.indexOf(key.message)] += 1
        } 
    })
  }

   const [userData, setUserData] = useState({
    labels: labelSkills,
    datasets: [
      {
        label: "# Times Used",
        data: dataSkills,
      },
    ],
  }); 

  

  return (
    <div>
      <Component req={req} className={styles.req}></Component>
    </div>
) 
}
 */

export default Graph 
