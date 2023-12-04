import React, {useEffect, useState} from 'react'
import styles from './Graph.module.css'

const YourComponent = ({ req }) => {
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
          <p>Time: {item.time}</p>
          <p>Message: {item.message}</p>
        </div>
      ))}
    </div>
  );
};

const Graph = (props) => {                                   
  
  let [req, setReq] = useState("")
  useEffect(() => {
    fetch("/graph/skillsGet").then(async res=>{
      const parse = await res.text()
      console.log(parse)
      return parse
    }).then(res=>setReq(res))
  }, [])

  return (
    <div>
      <YourComponent req={req} className={styles.req}></YourComponent>

    </div>
  )                   
}                                                       


export default Graph
