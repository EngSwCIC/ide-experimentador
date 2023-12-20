import { define } from 'remount'      
import Hello from "./components/Hello"
import Graph from "./components/Graph"
import StartExperiment from "./components/StartExperiment.js";
import StopButton from "./components/StopButton.js";

define({ "hello-component": Hello, "graph-component": Graph });
define({ "start-button": StartExperiment, "stop-button": StopButton });
