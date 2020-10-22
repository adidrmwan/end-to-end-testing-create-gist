*** Settings ***
Library         Selenium2Library
Variables       data/env.py


*** Variable ***
#Element locator for login to github
${sign_in_btn}=             data-ga-click=text:sign-in
${username_field}=          id=login_field
${password_field}=          id=password
${submit_btn}=              name=commit

#Element locator for create new gist
${dropdown_add_btn}=        xpath=/html/body/div[1]/header/div[6]/details/summary/span
${create_gist_menu}=        xpath=/html/body/div[1]/header/div[6]/details/details-menu/a[3]
${description_field}=       name=gist[description]
${filename_field}=          name=gist[contents][][name]
${content_field}=           xpath=//*[@id="gists"]/div[2]/div/div[2]/div/div[5]/div[1]/div/div/div/div[5]/div/pre
${dropdown_select_btn}=     xpath=//*[@id="new_gist"]/div/div[2]/div/details/summary
${gist_public}=             xpath=//*[@id="new_gist"]/div/div[2]/div/details/details-menu/label[2]/div
${submit_new_gist}=         xpath=//*[@id="new_gist"]/div/div[2]/div/button

#Element locator for edit existing gist
${edit_btn}=                xpath=//*[@id="gist-pjax-container"]/div[1]/div/div[1]/ul/li[1]/a
${name_gist_header}=        xpath=//*[@id="gist-pjax-container"]/div[1]/div/div[1]/div/div
${delete_btn}=              xpath=//*[@id="gist-pjax-container"]/div[1]/div/div[1]/ul/li[2]/form/button
${code_menu}=               xpath=//*[@id="gist-pjax-container"]/div[1]/div/div[3]/div[1]/nav/div/a[1]
${revision_menu}=           xpath=//*[@id="gist-pjax-container"]/div[1]/div/div[3]/div[1]/nav/div/a[2]
${existing_gist}=           xpath=//*[@id="gist-pjax-container"]/div[2]/div/div
${update_btn}=              class=btn-primary
${edit_filename_field}=     xpath=//*[@id="gists"]/div[2]/div[2]/div[1]/div[1]/input[2]

#Element locator for list fo gist
${account_menu}=               id=user-links
${my_gist_btn}=             xpath=//*[@id="user-links"]/details/details-menu/a[1]

#credential user
${username}=            yourusername
${password}=            yourpassword

${description_name}=                create new gist
${content_gist}=                    This is an example for create public gist
${file_name}=                       public gist

${description_name_updated}=                create new gist updated
${content_gist_updated}=                    This is an example for create public gist updated
${file_name_updated}=                       public gist updated

*** Keywords ***
Login to Github
    Open Browser                ${url}                  ${browser}
    Maximize Browser Window
    Sleep           2s
    Input Text                  ${username_field}       ${username}
    Input Text                  ${password_field}       ${password}
    Click Element    ${submit_btn}
    sleep           2s

Click Create New Public Gist Menu
    Click Element           ${dropdown_add_btn}
    Sleep           1s
    Click Element           ${create_gist_menu}
    Sleep           1s

Input Gist Description Field
    Input Text      ${description_field}        ${description_name}
    Sleep       1s

Input Gist File Name Field
    Input Text      ${filename_field}        ${file_name}
    Sleep       1s

Input Gist Content Field
    Input Text      ${content_field}        ${content_gist}
    Sleep       1s

Select Public Gist
    Click Element        ${dropdown_select_btn}
    Sleep       1s
    Click Element        ${gist_public}
    Sleep       2s

Submit Create New Gist
    Click ELement        ${submit_new_gist}
    Sleep       2s

#=============================Edit Keywords================================
Click Edit Button
    Click Element           ${edit_btn}
    Sleep       2s

Edit Gist Description Field
    Input Text      ${description_field}        ${description_name_updated}
    Sleep       1s

Edit Gist File Name Field
    Input Text   ${edit_filename_field}         ${file_name_updated}
    Sleep       1s

Edit Gist Content Field
    Input Text      ${content_field}            ${content_gist_updated}
    Sleep       1s

Click Update Button
    CLick ELement           ${update_btn}
    Sleep           2s

#======================= Delete Keywords ==========================
Click Delete Button
    Click Element           ${delete_btn}
    Sleep           2s

Submit Confirmation Delete
    Handle Alert            action=ACCEPT
    sleep   2s

#==================== List Of Gist Keywrods ======================
Click Account Menu
    Click Element           ${account_menu}
    Sleep           2s

Select My Gist Submenu
    Click ELement           ${my_gist_btn}
    Sleep           2s



#===============================Validation Create New Gist==============================
Validation Success Create New Gist
    Page Should Contain Element             ${edit_btn}
    Page Should Contain Element             ${name_gist_header}
    Page Should Contain Element             ${delete_btn}          
    Page Should Contain Element             ${code_menu}
    Page Should Contain Element             ${revision_menu}
    Page Should Contain Element             ${existing_gist}   
