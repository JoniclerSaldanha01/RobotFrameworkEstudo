*** Settings ***
Documentation   Essa suite testa o site do Mercado Livre
Resource        mercadoLivre_resources.robot
Test Setup      Abrir o navegador
Test Teardown   Fechar o navegador

*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Games"
    [Documentation]    Esse teste verifica o menu Livros do site da Amazon
    ...                e verifica o menu loja de livros
    [Tags]             menus  categorias
    Dado que estou na home page do Mercado livre
    Quando Entrar no menu "Tecnologia"  
    Então o título da página deve ficar "JOGOS E CONSOLES POR PLATAFORMA"






    

