import React, {useEffect, useState} from 'react'
import styles from './Graph.module.css'                                                   
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
      <h1 className={styles.req}>{req}</h1>
    </div>
  )                   
}                                                       

export default Graph
