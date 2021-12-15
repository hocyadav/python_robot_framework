*** Settings ***
Library     JSONLibrary
Library     os
Library     Collections

*** Test Cases ***
READ_FROM_JSON_FILE
    ${json_data}=   load json from file     /Users/yadav.hariom/PycharmProjects/pythonProjectRobotFramework/TestCases/sample_response.json
    log to console   "all json data : "${json_data}
    ${get_support}=   get value from json   ${json_data}   $.support.url
    log to console   "get_support : "${get_support}
    log to console   "get_support : "${get_support[0]}


