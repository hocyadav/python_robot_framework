*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
#https://reqres.in/api/users/2
${base_url}     https://reqres.in
${id}           2

*** Test Cases ***
GET_Call
#create session : only added space, others uses tab
    create session    my_session_obj  ${base_url}
    ${my_response}=   GET On Session  my_session_obj  /api/users/${id}

    log to console    ${my_response.status_code}
    log to console    ${my_response.content}
    log to console    ${my_response.headers}

#    validations
    ${status_code}=     convert to string       ${my_response.status_code}
    log to console      "status_code: " ${status_code}
    should be equal     ${status_code}      200

    ${response_body}=   convert to string       ${my_response.content}
    should contain      ${response_body}    Janet
    should contain      ${response_body}    janet.weaver@reqres.in
    should contain      ${response_body}    "id":2

#    ${all_headers}=     ${my_response.headers}
    # all_headers is key-value so store in disc data type
    #add --> Library     Collections
    #add --> "get from dictionary"
    ${content_value}=       get from dictionary     ${my_response.headers}      Connection
    log to console      ${content_value}
    should be equal     ${content_value}        keep-alive