*** Settings ***
Library  Selenium2Library
Variables  ../../cfg/credentials.py
#Variables  ../../cfg/cred.py

*** Variables ***
${SERVER}  localhost:5000
${BROWSER}  chrome
#${BROWSER}  firefox
${DELAY}  0
${VALID USER}=  ${credentials["user"]}
${VALID PASSWD}  ${credentials["password"]}
${LOGIN URL}  https://apex.oracle.com/pls/apex/f?p=69537:LOGIN_DESKTOP
${SUCCESS URL}  https://apex.oracle.com/pls/apex/f?p=69537:1


*** Test Cases ***
open Login Page
  Open Browser  ${LOGIN URL}  ${BROWSER}
  Set Selenium Speed  ${DELAY}
  Title Should Be  Laufen - Anmelden

  #Log  cred: ${cred}
  Log  user_json: ${VALID USER}
  Log  password_json: ${VALID PASSWD}

Perform Wrong credentials  
  GO TO  ${LOGIN URL}
  Title Should Be  Laufen - Anmelden
  Page Should Contain TextField  P9999_USERNAME
  Page Should Contain TextField  P9999_PASSWORD
  Input Text  P9999_USERNAME  ${VALID USER}
  Input Password  P9999_PASSWORD  Wrong password
  Click Button  P9999_LOGIN
  Sleep  2
  Page Should Contain  Ungültige Zugangsdaten für die Anmeldung
  Sleep  12

Perform correct credentials
  GO TO  ${LOGIN URL}
  Title Should Be  Laufen - Anmelden
  Page Should Contain TextField  P9999_USERNAME
  Page Should Contain TextField  P9999_PASSWORD
  Input Text  P9999_USERNAME  ${VALID USER}
  Input Password  P9999_PASSWORD  ${VALID PASSWD}
  Click Button  P9999_LOGIN
  Sleep  8
  Location Should contain  ${SUCCESS URL}
  #Title Should Be  Laufen  
  #Page Should Contain  Rundenzeiten

Task Teardown  Close Browser
