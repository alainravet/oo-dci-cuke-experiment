Feature: Creating talks
  In order to
  As a
  I want

  Background:
    Given meetings with those properties:
        | title     |     when     |
        | meeting 0 |    yesterday |
        | meeting 1 |        today |
        | meeting 2 |     tomorrow |

  Scenario: adding the 1st Talk to a Meeting
    Given a meeting
       * it has 0 talks
    When I add a talk to it
    Then it has 1 talk

    When I add a talk to it
    Then it has 2 talk
