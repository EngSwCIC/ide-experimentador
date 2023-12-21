require '/home/andredfs/ide-experimentador-grupo-4/spec/rails_helper.rb'

# CADASTRO COM SUCESSO - HAPPY
Dado("que usuario navega para a pagina de login") do
    visit '/users/sign_in'
  end

  Quando("usuario clica no botao de cadastro") do
    visit '/users/sign_up'
  end
  
  Quando("Usuário preenche dados válidos no formulário de cadastro") do
    fill_in 'user_email', with: 'teste3@email.com' 
    fill_in 'user_password', with: 'Teste123' 
    fill_in 'user_password_confirmation', with: 'Teste123'
  end
  
  Quando("Usuário clica no botão de enviar os dados") do
    click_button 'Sign up'
  end
  
  Então("Cadastro é criado no banco de dados e usuario e redirecionado para home") do
    expect(page).to have_current_path('/') 
    expect(page).to have_content('Welcome! You have signed up successfully.') 
  end


# CADASTRO EMAIL INVALIDO - SAD
Dado("que usuario navega para a pagina de login - email fail") do
  visit '/users/sign_in'
  end

  Quando("usuario clica no botao de cadastro - email fail") do
    visit '/users/sign_up'
  end
  
  Quando("Usuário preenche email inválido") do
    fill_in 'user_email', with: 'invalid_email' 
    fill_in 'user_password', with: 'password' 
    fill_in 'user_password_confirmation', with: 'password'
  end
  
  Quando("Usuário clica no botão de enviar os dados - email fail") do
    click_button 'Sign up'
  end
  
  Então("A aplicação informa ao usuário email invalido") do
    expect(page).to have_current_path('/users/sign_up')  
  end


# CADASTRO SENHA INVALIDA - SAD
Dado("que usuario navega para a pagina de login - email fail") do
  visit '/users/sign_in'
  end

  Quando("usuario clica no botao de cadastro - email fail") do
    visit '/users/sign_up'
  end
  
  Quando("Usuário preenche senha inválida") do
    fill_in 'user_email', with: 'teste3@email.com' 
    fill_in 'user_password', with: 'pas' 
    fill_in 'user_password_confirmation', with: 'pas'
  end
  
  Quando("Usuário clica no botão de enviar os dados - email fail") do
    click_button 'Sign up'
  end
  
  Então("A aplicação informa ao usuário senha invalida") do
    expect(page).to have_current_path('/users/sign_up') 
    expect(page).to have_content('1 error prohibited this user from being saved:')

  end

# USUARIO MUDA A SENHA COM SUCESSO - HAPPY
Dado("que Usuário possui um cadastro") do
  FactoryBot.create(:user, email: 'teste@email.com')
end

  Quando("Usuário navega para a pagina de login") do
    visit '/users/sign_in'
  end

  Quando("Usuário clica em recuperar senha") do
    visit '/users/password/new'
  end

  Quando("Usuário confirma o email") do
    fill_in 'user_email', with: 'teste@email.com'
    click_button 'Send me reset password instructions'
    post '/users/password'
  end

  Então("Usuário deve ver mensagem de envio de instrucoes para recuperar senha") do
    expect(page).to have_current_path('/users/password/new') 
    expect(page).to have_content('You will receive an email with instructions on how to reset your password in a few minutes.') 
  end


# USUARIO DIGITA EMAIL INEXISTENTE PARA RECUPERAR SENHA (SAD)
Dado("que Usuário navega para a pagina de login") do
    visit '/users/sign_in'
  end

  Quando("Usuário clica em recuperar senha - password reset fail") do
    visit '/users/password/new'
  end

  Quando("Usuário insere email nao cadastrado") do
    fill_in 'user_email', with: 'naocadastrado@email.com'
    click_button 'Send me reset password instructions'
  end

  Então("A aplicação informa ao usuário email nao encontrado") do
    expect(page).to have_current_path('/users/password/new') 
    expect(page).to have_content('1 error prohibited this user from being saved:') 
  end  
 








  
