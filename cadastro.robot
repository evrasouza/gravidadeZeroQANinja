*** Settings ***
Documentation    Suite de testes do cadastro de eprsonagens

Resource         base.robot
Library          Browser

Test Setup       Start Session
Test Teardown    End Session

*** Test Cases ***
Deve cadastrar um novo personagem
    Click                      text=Novo

    #Checkpoint    
    Wait For Elements State    css=.card-header-title
    ...                        visible    5

    Fill Text                  css=input[placeholder^="Nome"]        Mestre Yoda
    Fill Text                  css=input[placeholder="Email"]        yoda@jedi.com
    Fill Text                  id=insta                              @yoda

    Select Options By          css=.ordem select        text    Jedi

    Select Birth Date          fevereiro    1970    20

*** Keywords ***
Select Birth Date
    [Arguments]                ${month}    ${year}    ${day}
    Click                      css=input[placeholder^="Data"]

    Select Options By          xpath=(//header[@class="datepicker-header"]//select)[1]
    ...                        text        ${month}

    Select Options By          xpath=(//header[@class="datepicker-header"]//select)[2]
    ...                        text        ${year}

    Click                      //a[contains(@class, "datepicker-cell")]//span[text()="${day}"]