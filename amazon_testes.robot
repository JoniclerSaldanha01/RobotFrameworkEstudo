*** Settings ***
Documentation   Essa suite testa o site da Amazon
Resource        amazon_resources.robot
Test Setup      Abrir o navegador
#Test Teardown   Fechar o navegador

*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Livros"
    [Documentation]    Esse teste verifica o menu Livros do site da Amazon
    ...                e verifica o menu loja de livros
    [Tags]             menus  categorias
    Acessar a home page do site Amazon.com.br
    Entrar no menu "Livros"
    Verificar se aparece a frase "Loja de Livros"
#    Verificar se o título da página fica "Livros | amazon.com.br"

#    Verificar se aparece a categoria "Inglês e Outras Línguas"

#Caso de Teste 02 - Pesquisa de um Produto
#    [Documentation]    Esse teste pesquisa por xbox no site da Amazon
#    [Tags]             busca_produtos  Lista_busca
#    Acessar a home page do site Amazon.com.br 
#    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
#    Clicar no botão de pesquisa
#    Verificar o resultado da pesquisa se está listando o produto pesquisado

