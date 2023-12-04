import React from 'react'

const StopButton = (props) => {

    const handleClick = () => {
        fetch(`http://localhost:3001/stop/${props.id}`, {
            method: 'DELETE',
            headers: {
                'Content-type': 'application/json'
            },
        }).then(response => {
            if (!response.ok) {
                <span>Teste não encontrado</span>
            }
            return response.json()
        }).then(data => {
            console.log(data)
        })
    }

    return (
        <button onClick={handleClick}>
            <svg xmlns="http://www.w3.org/2000/svg" width="17" height="17" viewBox="0 0 17 17" fill="none">
                <path d="M14.3333 1H2.66667C1.74619 1 1 1.74619 1 2.66667V14.3333C1 15.2538 1.74619 16 2.66667 16H14.3333C15.2538 16 16 15.2538 16 14.3333V2.66667C16 1.74619 15.2538 1 14.3333 1Z" stroke="#DE0000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
        </button>
    )
}

export default StopButton