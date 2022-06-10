*** Settings ***
Documentation        Suite de testes para verificar se o app esta Online

Library    Browser

*** Test Cases ***
Yodapp deve estar online
    New Browser     chromium    headless=false    slowMo=00:00:01
    New Page        https://yodapp.vercel.app/

    Get Title       equal    Yodapp | QAninja

    Take Screenshot