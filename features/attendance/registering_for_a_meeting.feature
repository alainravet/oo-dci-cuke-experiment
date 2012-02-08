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


  Scenario:
    Given
    When
    Then
