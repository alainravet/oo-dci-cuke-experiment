Feature: creating meetings
  In order to
  As a
  I want

  Background:
    Given today is 2011-02-14
    Given meetings with those properties:
        | title     |     when     |
        | meeting 0 |    yesterday |


  Scenario Outline: creating a meeting
    When I try to create a meeting with <title>, <location>, and <date>
    Then the created meeting is <Valid or Invalid>

    Examples: Success
      | title     | location   | date   | Valid or Invalid |
      | meeting 1 | Bruxelles  | today  |            valid |
      | meeting 1 |            | today  |            valid |
      | meeting 1 |            |        |            valid |

    Examples: Invalid title
      A meeting title must be :present and :unique
      | title     | location   | date   | Valid or Invalid |
      |           | Bruxelles  | today  |          invalid |
      | meeting 0 | Bruxelles  | today  |          invalid |
