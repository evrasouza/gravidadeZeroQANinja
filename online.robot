*** Settings ***
Documentation    Suite de testes para verificar se o app esta Online

Library          Browser

Test Setup       Start Session
Test Teardown    End Session

*** Test Cases ***
Yodapp deve estar online
    Get Title       equal    Yodapp | QAninja

Deve exibir mensagens de boas vindas
    Wait For Elements State
    ...             css=.navbar-item >> text=Que a Força (qualidade) esteja com você!
    ...             visible    5

*** Keywords ***
Start Session
    New Browser     chromium    headless=false    slowMo=00:00:01
    New Page        https://yodapp.vercel.app/

End Session
    Take Screenshot