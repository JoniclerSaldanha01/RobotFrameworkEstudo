*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}                    https://www.mercadolivre.com.br/
${CATEGORIAS}            //a[contains(@class,'nav-menu-categories-link')]
${TECNOLOGIA}           //a[@href='#'][contains(.,'Tecnologia')]
${GAME}                //a[contains(.,'Games')]
${TEXTO_JOGOS}          //h2[@class='text__primary'][contains(.,'JOGOS E CONSOLES POR PLATAFORMA')]
${HEADER_LIVROS}          //h2[contains(.,'Loja de Livros')]
${LIVROS_DIREITO}         //img[contains(@alt,'Livros de direito')]

*** Keywords ***

Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser    

Acessar a home page do site Mercado livre
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${CATEGORIAS}
    
    
Entrar no menu "Tecnologia"
    Click Element    locator=${CATEGORIAS}
   Sleep    5s
    Click Element    locator=${TECNOLOGIA}
   Sleep    5s
    Click Element    locator=${GAME}
   Sleep    5s

Verificar se aparece a frase "JOGOS E CONSOLES POR PLATAFORMA"
    Mouse Down    locator=${TEXTO_JOGOS}
    Wait Until Element Is Visible    locator=${TEXTO_JOGOS}
    

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
Dado que estou na home page do Mercado livre   
    Acessar a home page do site Mercado livre
    
Quando Entrar no menu "Tecnologia"    
    Entrar no menu "Tecnologia"
    
Então o título da página deve ficar "JOGOS E CONSOLES POR PLATAFORMA"
    Verificar se aparece a frase "JOGOS E CONSOLES POR PLATAFORMA"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
   

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Livros de direito"        
        
