Feature: fetching 1 meeting
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
    Given a past meeting exists with the title "meeting 0"
    Given a meeting exists with the title "meeting 1"
    Given a meeting exists with the title "meeting 2"

  Scenario: fetching 1 meeting
    When I request the last meeting
    Then I obtain the last meeting
     And the meeting title is "meeting 2"
     And the meeting date is today
     And the meeting has no attendees
     And the meeting has no talks


  Scenario: fetching all the meetings
    When I request all the meetings
    Then I obtain 3 meetings
    And the first meeting title is "meeting 0"
    And the last meeting title is  "meeting 2"

  Scenario: fetching all the past meetings
    When I request all the past meetings
    Then I obtain 1 meetings
    And the meeting title is "meeting 0"
    And the meeting date is yesterday

  Scenario: fetching all the current meetings
    When I request all the current meetings
    Then I obtain 2 meetings
    And the first meeting title is "meeting 1"
    And the last meeting title is  "meeting 2"
