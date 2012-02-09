# TODO :
#  plain users cannot add talks

Feature: Creating talks
  In order to
  As a
  I want

  Background:
    Given meetings with those properties:
        | title     |     _date_   |
        | meeting 0 |    yesterday |
        | meeting 1 |        today |
        | meeting 2 |     tomorrow |
    Given I am authenticated

  Scenario: adding the 1st Talks to a Meeting
    Given a meeting
       * it has 0 talks
    When I add a talk to it titled "my-first-talk"
    Then it has 1 talk

    When I add a talk to it titled "my-second-talk"
    Then it has 2 talk
