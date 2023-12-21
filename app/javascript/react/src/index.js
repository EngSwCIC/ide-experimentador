import { define } from 'remount'      
import Hello from "./components/Hello"
import Graph from "./components/Graph"
import Auth from "./components/Auth"
                                      
define({ 'hello-component': Hello, 'graph-component': Graph, 'auth-component': Auth })
