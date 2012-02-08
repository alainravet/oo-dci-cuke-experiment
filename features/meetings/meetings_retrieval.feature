Feature: Retrieving 1 or many meetings

  The Meeting is the core concept of the Arrrrug application.
  A meeting has at least a date and a location.
  Once a meeting is scheduled, future attendees can register for it and talks
  can be planned.

  Meetings are planned in the future, current, and then archived
  Meetings have lists of attendees and talks.

  Rights :
    - Hidden meetings are only returned to :admin users.

  Background:
    Given meetings with those properties:
        | title        |    _date_    | location | hidden |
        | visible past |    yesterday |   London |  false |
        |  hidden past |    yesterday |   London |   true |
        | visible toda |        today |    Paris |  false |
        |  hidden toda |        today |    Paris |   true |
        | visible futu |     tomorrow | Brussels |  false |
        |  hidden futu |     tomorrow | Brussels |   true |


# retrieving ..
# **ALL** the meetings

  Scenario Outline: retrieving **ALL** the meetings
    Given I am authenticated as <role>
    When I request all the meetings
    Then I obtain <size> meetings with the titles <titles>

    Examples:
      | role  | size |        titles                                                                                |
      | admin | 6    | "visible past", "hidden past", "visible toda", "hidden toda", "visible futu", "hidden futu"  |
      | plain | 3    | "visible past", "visible toda", "visible futu"                                               |
      |  anon | 3    | "visible past", "visible toda", "visible futu"                                               |


# the **PAST** meetings

  Scenario Outline: retrieving **PAST** meetings
    Given I am authenticated as <role>
    When I request all the past meetings
    Then I obtain <size> meetings with the titles <titles>

    Examples:
      | role  | size |        titles                |
      | admin | 2    | "visible past", "hidden past"|
      | plain | 1    | "visible past"               |
      |  anon | 1    | "visible past"               |


# the **CURRENT** meetings

  Scenario Outline: retrieving **CURRENT** meetings
    Given I am authenticated as <role>
    When I request all the current meetings
    Then I obtain <size> meetings with the titles <titles>

    Examples:
      | role  | size |        titles                                                |
      | admin | 4    | "visible toda", "hidden toda", "visible futu", "hidden futu" |
      | plain | 2    | "visible toda", "visible futu"                               |
      |  anon | 2    | "visible toda", "visible futu"                               |


# the **FUTURE** meetings

  Scenario Outline: retrieving **FUTURE** meetings
    Given I am authenticated as <role>
    When I request all the future meetings
    Then I obtain <size> meetings with the titles <titles>

    Examples:
      | role  | size |        titles                  |
      | admin | 2    | "visible futu", "hidden futu"  |
      | plain | 1    | "visible futu"                 |
      |  anon | 1    | "visible futu"                 |
