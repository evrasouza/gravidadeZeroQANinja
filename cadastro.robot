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