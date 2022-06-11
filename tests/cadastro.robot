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

    Go To Use form
    Fill Use form    Mestre Yoda    yoda@jedi.com    Jedi    fevereiro-1970-20    @yoda
    Select Jedi      Cavaleiro Jedi
    Check Accept Communications
    Submmit Use Form
    Toaster Message Should Be    Usuário cadastrado com sucesso!

Email Incorreto
    [Tags]        env_email

    Go To Use form
    Fill Use form    Darth Vader    vader&hotmail.com    Sith    dezembro-1980-15    @vader
    Check Accept Communications
    Submmit Use Form
    Toaster Message Should Be    Oops! O email é incorreto.