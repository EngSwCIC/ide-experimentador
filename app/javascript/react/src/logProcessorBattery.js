export function readLogFile(file) {
  return new Promise((resolve, reject) => {
    const reader = new FileReader();
    reader.onload = (event) => resolve(event.target.result);
    reader.onerror = (error) => reject(error);
    reader.readAsText(file);
  });
}

export function extractBatteryData(logData) {
  const batteryLevels = [];
  const logLines = logData.split("\n");
  // Ajuste na expressão regular para capturar qualquer valor no campo de nível da bateria
  const batteryLevelRegex =
    /(\d+\.\d+), \[INFO\], robot6, {'battery-level': '([^']+)'}\s*/;

  for (let line of logLines) {
    const match = line.match(batteryLevelRegex);
    if (match) {
      const levelStr = match[2];
      const level = parseFloat(levelStr);

      // Verifica se o nível não é um número ou é negativo
      if (isNaN(level) || level < 0) {
        return {
          status: "error",
          message:
            "Erro: Entrada apresenta dados inválidos - valores não numéricos ou negativos encontrados no log.",
        };
      }

      batteryLevels.push({
        time: parseFloat(match[1]),
        level: level,
      });
    }
  }

  return { status: "success", data: batteryLevels };
}
