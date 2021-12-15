*** Settings ***
Library     RequestsLibrary
Library     Collections
Library     JSONLibrary

*** Variables ***
#https://reqres.in/api/users/2
${base_url}     https://reqres.in
${id}           2

*** Test Cases ***
GET_Call
#create session : only added space, others uses tab
    create session    my_session_obj  ${base_url}
    ${my_response}=   GET On Session  my_session_obj  /api/users/${id}
    log to console   "actual response : "${my_response}

    ${content_in_json}=   to json   ${my_response.content}
    log to console   "content in json : "${content_in_json}

    ${json_path_url}=   get value from json   ${content_in_json}  $.support.url
    #json path output will be always in list
    log to console   "json_path_url : "${json_path_url}
    log to console   "json_path_url : "${json_path_url[0]}


