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
        | title     |     when     |
        | meeting 0 |    yesterday |
        | meeting 1 |        today |
        | meeting 2 |        today |


  Scenario: fetching 1 meeting
    When I request the last meeting
     And the meeting title is "meeting 2"
     And the meeting date is today
     And the meeting has no attendees
     And the meeting has no talks



  Scenario: fetching all the meetings
    When I request all the meetings
    Then I obtain 3 meetings
    And the meetings have those properties:
        | title     |     when     |
        | meeting 0 |    yesterday |
        | meeting 1 |        today |
        | meeting 2 |        today |


  Scenario: fetching all the past meetings
    When I request all the past meetings
    Then I obtain 1 meeting
    And the meeting has those properties:
        | title     |     when     |
        | meeting 0 |    yesterday |


  Scenario: fetching all the current meetings
    When I request all the current meetings
    Then I obtain 2 meetings
    And the meetings have those properties:
        | title     |     when     |
        | meeting 1 |        today |
        | meeting 2 |        today |
