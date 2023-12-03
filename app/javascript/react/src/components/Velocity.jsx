import React, {useEffect, useState} from 'react'
import { LineChart, Line, CartesianGrid, XAxis, YAxis } from 'recharts'

const Velocity = () => {
  const data = []; // <- lista de dicionarios

  const renderLineChart = (
      <LineChart width={400} height={400} data={data}>
        <Line type="monotone" dataKey="uv" stroke="#8884d8" />
      </LineChart>
  );

  let [req, setReq] = useState("")

  useEffect(() => {fetch(`/velocity/getData/${10}`).then(async res=>{
    const parse = await res.text()
    console.log(parse)
    return parse
    }).then(res=>setReq(res))
  }, [])

  return (
    <div>
        <LineChart width={600} height={300} data={data}>
            <Line type="monotone" dataKey="uv" stroke="#8884d8" />
            <CartesianGrid stroke="#ccc" />
            <XAxis dataKey="name" />
            <YAxis />
        </LineChart>
    </div>
  )
}

export default Velocity
