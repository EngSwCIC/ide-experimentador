import React, {useEffect, useState} from 'react'
import { LineChart, Line, CartesianGrid, XAxis, YAxis } from 'recharts'

const Velocity = () => {
    let [req, setReq] = useState("")

  useEffect(() => {fetch(`/velocity/getData/${0}`).then(async res=>{
    const parse = await res.json()
    return parse
    }).then(res=>setReq(res))
  }, [])

  //console.log(window.location.href)
  if (Object.keys(req).length == 0) {
      return (
        <div>
          <h1>Erro</h1>
        </div>
      )

    } else {
      
      var lista = []
      Object.keys(req).forEach(function(key){
          lista.push({"x": key, "y": req[key]})
      })
      

      const data = lista; // <- lista de dicionarios

      const renderLineChart = (
          <LineChart width={400} height={400} data={data}>
              <Line type="monotone" dataKey="uv" stroke="#8884d8" />
          </LineChart>
      );
    console.log(lista)
    return (
      <div>
          <LineChart width={600} height={300} data={data}>
              <Line type="monotone" dataKey="y" stroke="#8884d8" />
              <CartesianGrid stroke="#ccc" />
              <XAxis dataKey="x" />
              <YAxis />
          </LineChart>
      </div>
    )
  }
}
export default Velocity
