import { define } from 'remount'      
import Hello from "./components/Hello"
import Graph from "./components/Graph"
import Sidebar from "./components/sidebar"
define({ 'hello-component': Hello, 'graph-component': Graph, 'sidebar-component': Sidebar })
