import { define } from 'remount'      
import Hello from "./components/Hello"
import Velocity from "./components/Velocity"
import Graph from './components/Graph'
                                      
define({ 'hello-component': Hello, 'velocity-component': Velocity, 'graph-component': Graph })
