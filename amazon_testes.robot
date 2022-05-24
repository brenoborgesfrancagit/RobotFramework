*** Settings ***
Documentation       Essa suite teste o site da amazon.com.br

Resource            amazon_resources.robot

Test Setup          Abrir o navegador
Test Teardown       Fechar o navegador


*** Test Cases ***
Caso de Teste 01 -"Acesso ao menu "Eletrônicos"
    [Documentation]    Esse teste verifica o menu eletronico do site da amazon
    ...    E verifica a categoria computadores.
    [Tags]    menus
    Acessar a home page do site Amazon.com.br
    Entrar no menu "Eletrônicos"
    Verificar se o subtitulo da página aparece "Eletrônicos e Tecnologia"
    Verificar se aparece a categoria "Computadores e Informática"

Caso de teste 02 - "Pesquisa de um Produto"
    [Tags]    buscar_produtos
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox" no campo de pesquisa
    Clicar no botão de pesquisa
    O sistema deve exibir a tela com o resultado da pesquisa,listando o produto pesquisado.
