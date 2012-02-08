Feature: creating meetings

  Background:
    Given meetings with those properties:
        | title     |     _date_   |
        | meeting 0 |    yesterday |


# Authorization

  Scenario Outline: Only an admin can create a Meeting
     #
     # Only an admin can create a Meeting
     #
    Given I am authenticated as <role>
    When a meeting is created
       * it is a <outcome>

    Examples:
      | role  | outcome   |
      | admin |   success |
      | plain |   failure |
      |  anon |   failure |


# Validation

  Scenario Outline: creation can fail
    Given I am authenticated as admin
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




# visible by default

  Scenario: creating 1 meeting
      A meeting is visible by default
    Given I am authenticated as admin
     When a meeting is created with those properties:
          | title     |    _date_    | location |
          | meeting Z |              |          |
        * it is valid, visible


  Scenario: creating 1 hidden meeting
   Given I am authenticated as admin
    When a meeting is created with those properties:
          | title     |    _date_    | location | hidden |
          | meeting Z |              |          |   true |
       * it is valid, hidden

