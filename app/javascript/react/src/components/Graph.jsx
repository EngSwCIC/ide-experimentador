import React, {useEffect, useState} from 'react'
import styles from './Graph.module.css'

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
      <Component req={req} className={styles.req}></Component>

    </div>
  )                   
}                                                       


export default Graph
