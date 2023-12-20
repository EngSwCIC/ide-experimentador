export function readLogFile(file) {
  return new Promise((resolve, reject) => {
    const reader = new FileReader();
    reader.onload = (event) => resolve(event.target.result);
    reader.onerror = (error) => reject(error);
    reader.readAsText(file);
  });
}

export function extractRobotPositionData(logData) {
  const positionData = [];
  const logLines = logData.split("\n");
  const positionRegex =
    /(\d+\.\d+), \[INFO\], robot6, {'y': ([\d.-]+), 'x': ([\d.-]+), 'yaw': ([\d.-]+)}, None, None/;

  for (let line of logLines) {
    const match = line.match(positionRegex);
    if (match) {
      const y = parseFloat(match[2]);
      const x = parseFloat(match[3]);

      positionData.push({ x, y });
    }
  }

  return { status: "success", data: positionData };
}