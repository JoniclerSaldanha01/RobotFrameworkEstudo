*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}                    https://www.amazon.com.br
${MENU_LIVROS}            //a[contains(.,'Livros')]
${TEXTO_HEADER_LIVROS}    Loja de Livros  
${HEADER_LIVROS}          //h2[contains(.,'Loja de Livros')]

*** Keywords ***

Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Close Browser    

Acessar a home page do site Amazon.com.br 
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_LIVROS}
    
    
Entrar no menu "Livros"
    Click Element    locator=${MENU_LIVROS}

Verificar se aparece a frase "Loja de Livros"
    Wait Until Page Contains    text=${TEXTO_HEADER_LIVROS}
    Wait Until Element Is Visible    locator=${HEADER_LIVROS}     
       


