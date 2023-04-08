*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}                    https://www.amazon.com.br
${MENU_LIVROS}            //a[contains(.,'Livros')]
${TEXTO_HEADER_LIVROS}    Loja de Livros  
${HEADER_LIVROS}          //h2[contains(.,'Loja de Livros')]
${LIVROS_DIREITO}         //img[contains(@alt,'Livros de direito')]

*** Keywords ***

Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser    

Acessar a home page do site Amazon.com.br 
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_LIVROS}
    
    
Entrar no menu "Livros"
    Click Element    locator=${MENU_LIVROS}

Verificar se aparece a frase "Loja de Livros"
    Wait Until Page Contains    text=${TEXTO_HEADER_LIVROS}
    Wait Until Element Is Visible    locator=${HEADER_LIVROS}     

Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}
       
Verificar se aparece a categoria "Livros de direito"
    Sleep     10
    Scroll Element Into View    locator=//img[contains(@alt,'Livros de direito')]
    Sleep     10
    Wait Until Element Is Visible    locator=${LIVROS_DIREITO} 
    #Element Should Be Visible  Locator=//img[contains(@alt,'Livros de direito')]
    Sleep     10


Digitar o nome de produto "${PRODUTO_PESQUISA}" no campo de pesquisa
    Input Text    locator=field-keywords    text=${PRODUTO_PESQUISA}

Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button
    

Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=(//span[contains(.,'${PRODUTO}')])[2]
    Capture Element Screenshot    locator=(//span[contains(.,'Console Xbox Series S')])[2]

#GHERKIN STEPS
Dado que estou na home page da Amazon.com.br    
    Acessar a home page do site Amazon.com.br 
    
Quando Entrar no menu "Livros"    
    Entrar no menu "Livros"
    Verificar se aparece a frase "Loja de Livros"
    
