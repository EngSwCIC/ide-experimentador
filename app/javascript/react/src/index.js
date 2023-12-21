import { define } from 'remount'      
import Hello from "./components/Hello"
import Graph from "./components/Graph"                                   
import TableComponent from "./components/posicao"
import BatteryTableComponent from "./components/bateria"

define({ 'hello-component': Hello, 'graph-component': Graph, 'table-component': TableComponent, 'battery-table-component': BatteryTableComponent})

