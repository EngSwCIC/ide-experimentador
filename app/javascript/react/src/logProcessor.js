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
  // Ajuste na expressão regular para capturar números ou strings nos campos x, y e yaw
  const positionRegex =
    /(\d+\.\d+), \[INFO\], robot6, {'y': ('[^']+'|[\d.-]+), 'x': ('[^']+'|[\d.-]+), 'yaw': ('[^']+'|[\d.-]+)}, None, None\s*/;

  for (let line of logLines) {
    const match = line.match(positionRegex);
    if (match) {
      const timeStr = match[1];
      const yStr = match[2].replace(/'/g, ""); // Remove as aspas, se houver
      const xStr = match[3].replace(/'/g, ""); // Remove as aspas, se houver
      const yawStr = match[4].replace(/'/g, ""); // Remove as aspas, se houver

      const time = parseFloat(timeStr);
      const y = parseFloat(yStr);
      const x = parseFloat(xStr);
      const yaw = parseFloat(yawStr);

      // Verifica se algum dos valores não é um número
      if ([time, y, x, yaw].some((val) => isNaN(val))) {
        return {
          status: "error",
          message:
            "Erro: Entrada apresenta dados inválidos - valores não numéricos encontrados no log.",
        };
      }

      positionData.push({ time, y, x, yaw });
    }
  }

  return { status: "success", data: positionData };
}
