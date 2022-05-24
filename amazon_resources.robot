*** Settings ***
Documentation       Simple example using SeleniumLibrary.

Library             SeleniumLibrary


*** Variables ***
${URL}                      https://www.amazon.com.br/
${MENU_ELETRONICOS}         //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${BROWSER}                  Chrome
${SUBTITULO_ELETRONICO}     //h1[contains(.,'Eletrônicos e Tecnologia')]
${PC_INFO}                  //img[@src='https://images-na.ssl-images-amazon.com/images/G/32/BR-hq/2021/img/Consumer_Electronics/Storefronts/Electronics/956.Storefront_categoria_computadores_icons_240x270.jpg']
${CAMPO_PESQUISA}           //input[contains(@type,'text')]
${TEXTO_XBOX}               XBOX
${RESULTADO PESQUISA}       //span[@class='a-size-medium a-color-base a-text-normal'][contains(.,'RESULTADOS')]


*** Keywords ***
Abrir o navegador
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

 Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}

Verificar se o subtitulo da página aparece "Eletrônicos e Tecnologia"
    Wait Until Element Is Visible    locator=${SUBTITULO_ELETRONICO}

Verificar se aparece a categoria "Computadores e Informática"
    Wait Until Element Is Visible    locator=${PC_INFO}

Digitar o nome de produto "Xbox" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${TEXTO_XBOX}

Clicar no botão de pesquisa
    Click Button    locator=nav-search-submit-button

O sistema deve exibir a tela com o resultado da pesquisa,listando o produto pesquisado.
    Wait Until Element Is Visible    locator=${RESULTADO PESQUISA}