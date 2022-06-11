*** Settings ***
Documentation        Ações customizadas do Yodapp

Resource         ../resources/base.robot

*** Keywords ***
Go To Use form
    #Dado que acesso o formulario
    Click                      text=Novo

    #Checkpoint (para saber se fomos de fato para a pagina de cadastro)
    Wait For Elements State    css=.card-header-title
    ...                        visible    5

Fill Use form
    [Arguments]    ${user}
    #Quando preencho este formulario com os dados do Mestre Yoda
    Fill Text                  css=input[name="nome"]        ${user}[name]
    Fill Text                  css=input[name="email"]       ${user}[email]
    
    Select Options By          css=.ordem select     text    ${user}[ordem]

    Select Birth Date          ${user}[bdate]

    Fill Text                  id=insta                      ${user}[instagram]

Select Jedi
    [Arguments]    ${tpjedi}
    Click          xpath=//input[@value="${tpjedi}"]/..//span[@class="check"]

Check Accept Communications
    Click                      xpath=//input[@name="comunications"]/..//span[@class="check"]

Submmit Use Form
    Click                      css=button >> text=Cadastrar

Select Birth Date
    [Arguments]                ${text_date}

    @{date}                    Split String               ${text_date}        -

    Click                      css=input[placeholder^="Selecione"]

    Select Options By          xpath=(//header[@class="datepicker-header"]//select)[1]
    ...                        text        ${date}[0]

    Select Options By          xpath=(//header[@class="datepicker-header"]//select)[2]
    ...                        text        ${date}[1]

    Click                      //a[contains(@class, "datepicker-cell")]//span[text()="${date}[2]"]

Toaster Message Should Be
    [Arguments]        ${Expect_Message}

    ${element}         Set Variable        css=.toast div

    Wait For Elements State    ${element}    visible        5
    Get Text                   ${element}    equal          ${Expect_Message}
