Feature: Retrieving 1 or many meetings

  The Meeting is the core concept of the Arrrrug application.
  A meeting has at least a date and a location.
  Once a meeting is scheduled, future attendees can register for it and talks
  can be planned.

  Meetings are planned in the future, current, and then archived
  Meetings have lists of attendees and talks.

  In order to
  As a
  I want


  Background:
    Given meetings with those properties:
        | title     |    _date_    |
        | meeting 0 |    yesterday |
        | meeting 1 |        today |
        | meeting 2 |     tomorrow |


  Scenario: fetching all the meetings
    When I request all the meetings
    Then I obtain 3 meetings
    And their properties are:
        | title     |      _date_  |
        | meeting 0 |    yesterday |
        | meeting 1 |        today |
        | meeting 2 |     tomorrow |


  Scenario: fetching all the past meetings
    When I request all the past meetings
    Then I obtain 1 meeting
    And their properties are:
        | title     |     _date_   |
        | meeting 0 |    yesterday |


  Scenario: fetching all the current meetings
    When I request all the current meetings
    Then I obtain 2 meetings
    And their properties are:
        | title     |     _date_   |
        | meeting 1 |        today |
        | meeting 2 |     tomorrow |

  Scenario: fetching all the future meetings
    When I request all the future meetings
    Then I obtain 1 meeting
    And their properties are:
        | title     |     _date_   |
        | meeting 2 |     tomorrow |
