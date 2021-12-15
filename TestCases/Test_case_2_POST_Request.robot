*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${url}       https://reqres.in
${name1}     hariom

*** Test Cases ***
MY_POST_CREATE_REQUEST
    create session      mysession       ${url}

    ${name}=   convert to string   morpheus
    log to console   "name : " ${name1}
    ${sample_body}=     create dictionary   name=${name1}   job=leader
    ${my_headers}=    create dictionary   Content-Type=application/json

    ${my_response}=   post request   mysession   /api/users   data=${sample_body}   headers=${my_headers}
    log to console   "my_response : " ${my_response}
    log to console   "content : " ${my_response.content}
    log to console   "status_code: " ${my_response.status_code}


    #validation
    ${response_body}=   convert to string   ${my_response.content}
    log to console   ${response_body}
    should contain   ${response_body}   ${name1}

#MY_PUT_UPDATE_REQUEST
#    create session      mysession       ${url}
#
#    ${name}=   convert to string   morpheus
#    log to console      "======================="
#    log to console   "name : " ${name1}
#    ${sample_body}=     create dictionary   name=${name1}   job=leader
#    ${my_headers}=    create dictionary   Content-Type=application/json
#
#    ${my_response}=   put request   mysession   /api/users/2   data=${sample_body}   headers=${my_headers}
#    log to console   "my_response : " ${my_response}
#    log to console   "content : " ${my_response.content}
#    log to console   "status_code: " ${my_response.status_code}
#
#
#    #validation
#    ${response_body}=   convert to string   ${my_response.content}
#    log to console   ${response_body}
#    should contain   ${response_body}   ${name1}


