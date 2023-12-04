import React from 'react'

const StartExperimentByTag = (props) => {
    // Precisava ter uma rota do aplicativo que retornava todos os experimentos com uma dada tag, mas olhei rapidamente e o grupo com a issue relacionada a isso não criou essa rota :(
    // Por enquanto só faz várias requisições, uma para cada teste que tá dentro do JSON recebido. Como esse JSON com os dados de todos os testes é gerado não sei
    const handleClick = () => {
        for (i = 0; i < props.count(); i++) {
            fetch(`http://localhost:3001/run`, {
                method: 'POST',
                headers: {
                    'Content-type': 'application/json'
                },
                body: props[i],
            }).then(response => {
                if (!response.ok) {
                    <span>Falha para iniciar teste</span>
                }
                return response.json()
            }).then(data => {
                console.log(data)
            })
        }
    }

    return (
        <button onClick={handleClick}>
            {/* <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
                <path d="M5 3L19 12L5 21V3Z" stroke="#00DE09" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg> */}
            Executar por tag
        </button>
    )
}

export default StartExperimentByTag