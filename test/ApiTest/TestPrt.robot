*** Settings ***
Library           RequestsLibrary
Library           jsonpatch
Library           Collections

*** Variables ***
${host}           http://template-test.wps.com

*** Test Cases ***
Albums
    Create Session    url    ${host}
    ${resp}    Get Request    url    server/pf/home/special/0/list?platform=WEB&start=0&count=20
    log    ${resp.content}
    ${response}    To Json    ${resp.content}
    ${data}    Get From Dictionary    ${response}    data
    Should not Be Empty    ${data}

favor
    ${cookies}    Create Dictionary    wps_sid:7bdf1db0fd1804bf5efa222133cf8ceb67219acc0003dc0b34@test01
    ${header}    Create Dictionary    Accept: application/json
    Create Session    url=${host}     header=${header}     cookies=${cookies}
    ${resp}    Get Request    url    server/pf/user/template/favors?platform=WEB&start=0&count=20
    log    ${resp.content}
    ${response}    To Json    ${resp.content}
    ${data}    Get From Dictionary    ${response}    data
    Should not Be Empty    ${data}
