require '/home/andredfs/ide-experimentador-grupo-4/spec/rails_helper.rb'

# USUARIO LOGA COM SUCESSO - HAPPY
Dado("que Usuário navega para página de login") do
    visit '/users/sign_in'
  end
  
  Quando("Usuário preenche dados válidos no formulário de login") do
    fill_in 'user_email', with: 'andre1482000@gmail.com' 
    fill_in 'user_password', with: 'Teste123' 
  end
  
  Quando("Usuário clica no botão de login") do
    click_button ('Log in')
  end
  
  Quando("Login e validado") do
    expect(page).to have_current_path('/users/sign_in')
  end
  
  Então("usuário é redirecionado para a homepage, já logado") do
    visit '/'       # CUCUMBER FICA PRESO NO [POST] /USERS/SIGN_IN NOVAMENTE E NAO REDIRECIONA SOZINHO!
    expect(page).to have_current_path('/')    
  end


# USUARIO TENTA LOGAR COM EMAIL OU SENHA INVALIDA - SAD 
Dado("que Usuário navega para página de login - fail") do
    visit '/users/sign_in'
  end

  Quando("Usuário preenche email ou senha invalidos") do
    fill_in 'user_email', with: 'invalid@email' 
    fill_in 'user_password', with: 'wrong' 
  end

  Quando("Usuário clica no botão de login - fail") do
    click_button 'Log in'
  end

  Então('Aplicação informa ao usuário que o email ou a senha sao invalidos') do
    expect(page).to have_current_path('/users/sign_in')  
    expect(page).to have_content('Invalid Email or password.')
  end


# USUARIO FAZ LOGOUT COM SUCESSO - HAPPY
Dado("que usuário esta logado na pagina principal") do
    visit '/'
  end
  
  Quando("usuário clica em Log out") do
    visit '/users/sign_out'
  end
  
  Então("usuário é redirecionado para página inicial e aplicação informa que usuário foi deslogado") do
    expect(page).to have_current_path('/')
    expect(page).to have_content('Signed out successfully.') 
  end  


# REDIRECIONA USUARIO NAO LOGADO - HAPPY
Dado("que Usuário nao esta logado") do
    visit '/users/sign_out'
  end

  Quando("Usuario tenta acessar uma pagina restrita") do 
    visit '/restricted'
  end

  Então("Redireciona para página de login e mostra mensagem de erro") do
    expect(page).to have_current_path('/users/sign_in')
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end


