*** Settings ***
Resource        keywordsGist.robot

Suite Setup             Login to Github
Suite Teardown          Close Browser

*** Test Case ***

#As a user, I want to create a public gist.
Create_New_Gist_On_Github
    Click Create New Public Gist Menu
    Input Gist Description Field
    Input Gist File Name Field
    Input Gist Content Field
    Select Public Gist
    Submit Create New Gist
    Validation Success Create New Gist

#As a user, I want to edit an existing gist.
Edit_An_Existing_Gist
    Click Edit Button
    Edit Gist Description Field
    Edit Gist File Name Field
    Edit Gist Content Field
    Click Update Button

#As a user, I want to delete an existing gist.
Delete_An_Existing_Gist
    Click Delete Button
    Submit Confirmation Delete

#As a user, I want to see my list of gists.
See_My_List_Of_Gist
    Click Account Menu
    Select My Gist Submenu

