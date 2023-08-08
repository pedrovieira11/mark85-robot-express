*** Settings ***
Documentation        Cenários de tentativa de cadastro com senha muito curta

Resource        ../resources/base.resource
Test Template    Short password

Test Setup           Start Session
Test Teardown        Take Screenshot

*** Test Cases ***
Não deve logar com a senha de 1 digito     1
Não deve logar com a senha de 2 digitos    12
Não deve logar com a senha de 3 digitos    123
Não deve logar com a senha de 4 digitos    1234
Não deve logar com a senha de 5 digitos    12345

*** Keywords ***
Short password
    [Arguments]    ${short_pass}

    ${user}        Create Dictionary
    ...            name=Pedro Nascimento
    ...            email=pedro@qax.com
    ...            password=${short_pass}

    Go to signup page
    Submit signup form    ${user}

    Alert should be    Informe uma senha com pelo menos 6 digitos