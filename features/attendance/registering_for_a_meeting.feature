Feature:
  In order to attend a meeting
  As a logged in user
  I want to register for the meeting

  Background:
    Given meetings with those properties:
        | title        |    _date_    | location | hidden |
        | visible past |    yesterday |   London |  false |
        |  hidden past |    yesterday |   London |   true |
        | visible toda |        today |    Paris |  false |
        |  hidden toda |        today |    Paris |   true |
        | visible futu |     tomorrow | Brussels |  false |
        |  hidden futu |     tomorrow | Brussels |   true |


  Scenario: Before the registrations
    Given I am authenticated
      And I select the meeting titled "visible futu"
       * it was found
       * its title is "visible futu"
       * it has 0 attendees
       * I have 0 attendances
       * I am not registered to the meeting titled "visible futu"


  Scenario: Happy path
    Given I am authenticated
    Given I select the meeting titled "visible futu"
     When I register for the meeting
        * it has 1 attendee
        * I have 1 attendance
        * I am registered to the meeting titled "visible futu"


  Scenario: Cannot register twice
    Given I am authenticated
    Given I select the meeting titled "visible futu"
     When I register for the meeting
     When I register for the meeting
        * it has 1 attendee
        * I have 1 attendance
        * I am registered to the meeting titled "visible futu"


  Scenario: Cannot register for a past meeting
    Given I am authenticated
    Given I select the meeting titled "visible past"
     When I register for the meeting
        * it has no attendees
        * I have no attendances
        * I am not registered to the meeting titled "visible futu"


  Scenario: plain user cannot register for a hidden meeting
    Given I am authenticated
    Given I select the meeting titled "hidden futu"
        * it was not found

  Scenario: admin user can register for a hidden meeting
    Given I am authenticated as admin
    Given I select the meeting titled "hidden futu"
        * it was found
    When I register for the meeting
            * it has 1 attendee
            * I have 1 attendance
            * I am registered to the meeting titled "hidden futu"
