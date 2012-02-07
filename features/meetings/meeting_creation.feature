Feature: creating meetings
  In order to
  As a
  I want

  Background:
    Given meetings with those properties:
        | title     |     _date_   |
        | meeting 0 |    yesterday |


  Scenario: creating 1 meeting
    A meeting has at least a title is visible by default
    Given a meeting with those properties:
        | title     |    _date_    | location |
        | meeting Z |              |          |
    Then it is valid, visible


  Scenario: creating 1 hidden meeting
    Given a meeting with those properties:
        | title     |    _date_    | location | hidden |
        | meeting Z |              |          |   true |
    Then it is valid, hidden

  Scenario Outline: creating a meeting
    When I try to create a meeting with <title>, <location>, and <date>
    Then it is <Valid or Invalid>

    Examples: Success
      | title     | location   | _date_ | Valid or Invalid |
      | meeting 1 | Bruxelles  | today  |            valid |
      | meeting 1 |            | today  |            valid |
      | meeting 1 |            |        |            valid |

    Examples: Invalid titles
      A meeting title must be :present and :unique
      | title     | location   | _date_ | Valid or Invalid |
      |           | Bruxelles  | today  |          invalid |
      | meeting 0 | Bruxelles  | today  |          invalid |
