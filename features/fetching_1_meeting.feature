Feature: fetching 1 meeting
  In order to
  As a
  I want

  Scenario: fetching 1 meeting
    Given a meeting exists with the title "meeting 1"
    When I request the last meeting
    Then I obtain the meeting
     And the meeting title is "meeting 1"
     And the meeting has no attendees
     And the meeting has no talks
