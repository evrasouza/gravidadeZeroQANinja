*** Settings ***
Documentation    Suite de testes do cadastro de personagens

Resource         ../resources/base.robot
Resource         ../resources/actions.robot

Library          Browser
Library          ../resources/factories/users.py

Test Setup       Start Session
Test Teardown    End Session

*** Test Cases ***
Deve cadastrar um novo personagem
    [Tags]        happy

    &{user}       Factory Yoda

    Go To Use form
    Fill Use form    ${user}
    Select Jedi      ${user}[tpjedi]
    Check Accept Communications
    Submmit Use Form
    Toaster Message Should Be    Usuário cadastrado com sucesso!

Email Incorreto
    [Tags]        inv_email

    &{user}       Factory Darth Vader

    Go To Use form
    Fill Use form    ${user}
    Check Accept Communications
    Submmit Use Form
    Toaster Message Should Be    Oops! O email é incorreto.