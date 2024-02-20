*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${calculator_url}    https://www.calculator.net/bmi-calculator.html?cage=25&csex=m&cheightfeet=5&cheightinch=10&cpound=160&cheightmeter=180&ckg=65&printit=0&ctype=metric&x=Calculate
${expected_result}    BMI = 25.8 kg/m2
${height}   176
${weight}   80
${speed}   1

*** Test Cases ***

BMI Calculator Test
    [Documentation]    TDD övning
    [Tags]    Test1
    Set Selenium Speed    ${speed}

    Open Browser    browser=Chrome    url=${calculator_url}
    Wait Until Element Is Visible    //h1[normalize-space()='BMI Calculator']


    Input Text    //input[@id='cheightmeter']    ${height}
    Input Text    //input[@id='ckg']    ${weight}
    Click Button    //input[@name='x']

    # Get the text content of the element
    ${actual_result}=    Get Text    //*[@id="content"]/div[4]/div[1]/b      #XPath ?????

    # Compare the actual result with the expected result
    Should Be Equal    ${actual_result}    ${expected_result}


    #Element Text Should Be    //*[@id="content"]/div[4]/div[1]/b     ${expected_result}     #man kan skriva rad 27 och 30 i en rad ????

    Close Browser
