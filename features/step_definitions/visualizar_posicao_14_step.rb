When ('o usuario estiver na tela de visualizar posição') do
    visit '/logs/index'
end

Given ('que o usuario solicite o status da posição em um instante fora do escopo do teste, como {string}') do |string|
    fill_in 'log_input', with: string
end


Then ('o usuario deveria ver uma mensagem na tela dizendo {string}') do |string|
    assert_selector 'p', text: string
end


Given ('que o usuario solicite o status da posição usando caracteres não numéricos, como {string}') do |string|
    fill_in 'log_input', with: string
end


Given ('que o usuario solicite o status da posição usando dados validos') do
    fill_in 'log_input', with: "19.99"
end

Then ('o usuario deveria ver a posição correspondente desse instante') do
    assert_selector 'td', text: "1"
    assert_selector 'td', text: "19.99"
end

Given ("que eu solicite o status da posição usando dados validos de um trial valido usando um tempo validos") do
    fill_in 'log_input', with: '19.99'
    fill_in 'trial_input', with: '1'
end
