import { define } from 'remount'      
import Hello from "./components/Hello"
import Graph from "./components/Graph"
import Sidebar from "./components/Sidebar"

define({ 'hello-component': Hello, 'graph-component': Graph, 'sidebar-component': Sidebar })
