*** Settings ***
Documentation    Aqui não é suite, mas o arquivo principal do projeto

Library          Browser
Library          String

*** Variables ***
${BASE_URL}        https://yodapp-testing.vercel.app/

*** Keywords ***
Start Session
    New Browser     chromium    headless=false    slowMo=00:00:00
    New Page        ${BASE_URL}

End Session
    Take Screenshot