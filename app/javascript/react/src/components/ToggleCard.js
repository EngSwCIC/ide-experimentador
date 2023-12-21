window.onload = function () {
  // Pegar as classes do toggle switch e do botão play
  var toggleSwitch = document.querySelector(".toggle-switch");
  var playButton = document.querySelector(".play-button");

  if (toggleSwitch && playButton) {
    // Adicionar event listener de click para o toggle switch
    toggleSwitch.addEventListener("click", function () {
      // Atribuir classe ativada para o toggle switch (o card está ativado)
      toggleSwitch.classList.toggle("card-activated");

      // Checar se o switch está no estado ativado
      var isCardActivated = toggleSwitch.classList.contains("card-activated");

      // Condição para ver se o switch tá ativado
      if (isCardActivated) {
        // Mudar a imagem base do toggle switch e do play para ativo
        toggleSwitch.src = "/card-icons/toggle-activated.svg";
        playButton.src = "/card-icons/play.svg";
        // Event listener pro botão play
        playButton.addEventListener("click", function () {
          // Atribuir classe ativada para o botão play (o teste do card tá rodando)
          playButton.classList.toggle("play-activated");
          // Checar se o botão está no estado ativado
          var isPlayActivated = playButton.classList.contains("play-activated");
          // Condição para ver se o botão tá ativado
          if (isPlayActivated) {
            // Mudar a imagem base do play para running
            playButton.src = "/card-icons/running-stop.svg";
          } else {
            // Mudar a imagem base do running para play
            playButton.src = "/card-icons/play.svg";
          }
        });
      } else {
        // Mudar a imagem base do toggle switch e do play para inativo
        toggleSwitch.src = "/card-icons/toggle-right.svg";
        playButton.src = "/card-icons/play-unactivated.svg";
      }
    });
  }

  // Muda icone da lista de experimentos
  var playButtonXpPage = document.querySelector(".play-button-xp-page");

  if (playButtonXpPage) {
    playButtonXpPage.src = "/card-icons/play.svg";
    playButtonXpPage.addEventListener("click", function () {
      // Atribuir classe ativada para o botão play (o batch teste dos cards tá rodando)
      playButtonXpPage.classList.toggle("play-activated-xp-page");
      // Checar se o botão está no estado ativado
      var isPlayXpActivated = playButtonXpPage.classList.contains(
        "play-activated-xp-page"
      );
      // Condição para ver se o botão tá ativado
      if (isPlayXpActivated) {
        // Mudar a imagem base do play para running
        playButtonXpPage.src = "/card-icons/running-stop.svg";

        // Condição para rodar os cards ativos
        if (document.querySelector(".toggle-switch").classList.contains("card-activated")) {
          // Roda os testes dos cards que estão ativos
          document.querySelector(".play-button").src = "/card-icons/running-stop.svg";

          // Função para rodar testes...
        }
      } else {
        // Mudar a imagem base do running para play
        playButtonXpPage.src = "/card-icons/play.svg";
        document.querySelector(".play-button").src = "/card-icons/play.svg";

        // Função para interromper testes...
      }
    });
  }
};
