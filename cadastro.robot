*** Settings ***
Documentation    Suite de testes do cadastro de personagens

Resource         base.robot
Library          Browser

Test Setup       Start Session
Test Teardown    End Session

*** Test Cases ***
Deve cadastrar um novo personagem
    #Dado que acesso o formulario
    Click                      text=Novo

    #Checkpoint (para saber se fomos de fato para a pagina de cadastro)
    Wait For Elements State    css=.card-header-title
    ...                        visible    5

    #Quando preencho este formulario com os dados do Mestre Yoda
    Fill Text                  css=input[placeholder^="Nome"]        Mestre Yoda
    Fill Text                  css=input[placeholder="Email"]        yoda@jedi.com
    
    Select Options By          css=.ordem select        text    Jedi
    Click                      xpath=//input[@value="Cavaleiro Jedi"]/..//span[@class="check"]

    Select Birth Date          fevereiro    1970    20

    Fill Text                  id=insta                              @yoda

    Click                      xpath=//input[@name="comunications"]/..//span[@class="check"]

    #E submeto este formulario
    Click                      css=button >> text=Cadastrar

    #Entao devo ver a mensagem de sucesso
    Wait For Elements State    css=.toast div >> text=Usuário cadastrado com sucesso!
    ...                        visible    5
    # Sleep        1
    # ${html}      Get Page Source
    # Log          ${html}

Email Incorreto
    #Dado que acesso o formulario
    Click                      text=Novo

    #Checkpoint (para saber se fomos de fato para a pagina de cadastro)
    Wait For Elements State    css=.card-header-title
    ...                        visible    5

    #Quando preencho este formulario com os dados do Mestre Yoda
    Fill Text                  css=input[placeholder^="Nome"]        Darth Vader
    Fill Text                  css=input[placeholder="Email"]        vadder&hotmail.com
    
    Select Options By          css=.ordem select        text    Sith

    Select Birth Date          dezembro    1980    15

    Fill Text                  id=insta                              @vader

    Click                      xpath=//input[@name="comunications"]/..//span[@class="check"]

    #E submeto este formulario
    Click                      css=button >> text=Cadastrar

    #Entao devo ver a mensagem de sucesso
    Wait For Elements State    css=.toast div >> text=Oops! O email é incorreto.
    ...                        visible    5
    # Sleep        1
    # ${html}      Get Page Source
    # Log          ${html}

*** Keywords ***
Select Birth Date
    [Arguments]                ${month}    ${year}    ${day}
    Click                      css=input[placeholder^="Data"]

    Select Options By          xpath=(//header[@class="datepicker-header"]//select)[1]
    ...                        text        ${month}

    Select Options By          xpath=(//header[@class="datepicker-header"]//select)[2]
    ...                        text        ${year}

    Click                      //a[contains(@class, "datepicker-cell")]//span[text()="${day}"]