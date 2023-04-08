*** Settings ***
Documentation   Essa suite testa o site da Amazon
Resource        amazon_resources.robot
Test Setup      Abrir o navegador
Test Teardown   Fechar o navegador

*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Livros"
    [Documentation]    Esse teste verifica o menu Livros do site da Amazon
    ...                e verifica o menu loja de livros
    [Tags]             menus  categorias
    Dado que estou na home page da Amazon.com.br
    Quando Entrar no menu "Livros"
    Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    E a categoria "Computadores e Informática" deve ser exibida na página


Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]    Esse teste pesquisa por xbox no site da Amazon
    [Tags]             busca_produtos  Lista_busca
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    E um produto da linha "Xbox Series S" deve ser mostrado na página
    Então o título da página deve ficar "Amazon.com.br : Xbox Series S"


    

