*** Settings ***
Documentation    Suite de testes do cadastro de personagens

Resource         ../resources/base.robot
Resource         ../resources/actions.robot

Library          Browser

Test Setup       Start Session
Test Teardown    End Session

*** Test Cases ***
Deve cadastrar um novo personagem
    [Tags]        happy

    &{user}        Create Dictionary
    ...            name=Mestre Yoda
    ...            email=yoda@jedi.com
    ...            ordem=Jedi
    ...            tpjedi=Cavaleiro Jedi
    ...            bdate=fevereiro-1970-20
    ...            instagram=@yoda

    Go To Use form
    Fill Use form    ${user}
    Select Jedi      ${user}[tpjedi]
    Check Accept Communications
    Submmit Use Form
    Toaster Message Should Be    Usuário cadastrado com sucesso!

Email Incorreto
    [Tags]        env_email

    &{user}        Create Dictionary
    ...            name=Darth Vader
    ...            email=vader&hotmail.com
    ...            ordem=Sith
    ...            bdate=dezembro-1980-15
    ...            instagram=@vader

    Go To Use form
    Fill Use form    ${user}
    Check Accept Communications
    Submmit Use Form
    Toaster Message Should Be    Oops! O email é incorreto.