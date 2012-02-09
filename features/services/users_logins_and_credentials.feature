Feature: Users logins and credentians
  In order to perform some protected actions
  As a system user
  I want to log in


  Scenario: the system has just started
       * nobody is logged in


  Scenario: Failed login (invalid credentials)
    When I log in with invalid credentials
    Then nobody is logged in


  Scenario: Successful login
    When I log in with valid :plain user credentials
    Then somebody is logged in
       * my user rights are :plain

    When I log out
    Then nobody is logged in



  Scenario: Successful login as :admin
    When I log in with valid :admin user credentials
    Then somebody is logged in
       * my user rights are :admin

    When I log out
    Then nobody is logged in


