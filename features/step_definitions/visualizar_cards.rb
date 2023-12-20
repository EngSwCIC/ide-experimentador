Dado /^que estou logado como usuário no ide-experimentador$/ do

end
Dado /^que não existem testes no experimento (.+)$/ do |experimento|

end
Dado /^que existem? os? testes? (.+) no experimento (.+)$/ do |testes, experimento|

end
Dado /^que o card do (.+) contém (.+),\s*bateria:\s*(.+),\s*resultado:\s*(.+),\s*runs:\s*(.+)$/ do |teste, posicao, bateria, resultado, execucoes|

end
Dado /^que estou no experimento "(.+)"$/ do |experimento|

end
Dado /^que os? testes? (.+) est(ão|á) selecionados? no experimento (.+)$/ do |testes, dummy, experimento|

end
Dado /que pressionei o botão executar/ do

end
Dado /^que os? testes? (.+) do (.+) fo(i|ram) executado$/ do |testes, experimento|
  step %{que os testes #{testes} estão selecionados no experimento #{experimento}}
  step %{que pressionei o botão executar}
  step %{eu deveria ver o ícone "carregando" nos testes selecionados #{testes}}
  step %{os testes selecionados #{testes} terminarem de executar}
end
Dado /^que estou no teste (.+) do experimento (.+)$/ do |teste, experimento|

end
Dado /o botão (.+) é pressionado/ do |botao|

end
Dado /^que estou visualizando o modal de (.+) do (.+) no (.+)$/ do |botao, teste, experimento|
  step %{que estou no teste "#{teste}" do experimento "#{experimento}"}
  step %{o botão "mais opções" é pressionado}
  step %{uma lista de opções com "#{botao}" deve aparecer}
  step %{eu clicar em "#{botao}"}
end

Quando /^os? testes? selecionados? (.+) terminar(em)? de executar$/ do |testes, dummy|

end
Quando /^eu pressiono o botão (.+)$/ do |botao|

end

Então /^eu deveria ver as? mensage(m|ns) (.+)$/ do |dummy, msg|

end
Então /^eu deveria ver o card (.+),\s*(.+),\s*bateria:\s*(.+),\s*resultado:\s*(.+),\s*runs:\s*(.+)$/ do |teste, posicao, bateria, resultado, execucoes|
  step %{eu deveria ver o nome do teste "#{teste}"}
  step %{o campo "coordenadas" deve ser "#{posicao}"}
  step %{o campo "bateria" deve ser "#{bateria}"}
  step %{o campo "resultado" deve ser "#{resultado}"}
  step %{o campo "runs" deve ser "#{execucoes}"}
end
Então /^eu deveria ver o ícone (.+) nos? testes? selecionados? (.+)$/ do |icone, testes|

end
Então /^eu deveria ver o nome do teste (.+)$/ do |teste|

end
Então /^as? tags? devem? ser (.+)"$/ do |tags|

end
Então /^o campo (.+) deve ser (.+)$/ do |campo, resultado|

end
Então /^uma lista de opções com (.+) deve aparecer$/ do |botao|

end
Então /^eu deveria ver um modal com 4 páginas e uma opção de fechar o modal$/ do

end
Então /^um destaque no ícone de (.+) deveria aparecer$/ do |icone|

end
Então /^a página vazia com futuros detalhes de (.+) deveria aparecer$/ do |aba|

end
Então /^eu estou no experimento (.+)$/ do |experimento|

end
