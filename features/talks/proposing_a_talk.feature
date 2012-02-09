Feature: A User propose to talk at a meeting
  In order to
  As a
  I want

#------------------------------------------------------------------------
  Background:
    Given meetings with those properties:
        | title          |    _date_    | location | hidden |
        | visible future |     tomorrow | Brussels |  false |
    Given I am authenticated
    Given I select the meeting titled "visible future"

#------------------------------------------------------------------------

  Scenario: Situation before making the proposal
        * it was found
        * it has no proposals
        * it has no talks
        * I have no proposals


  Scenario: Happy path : making a valid proposal
     When I make a proposal titled "my-proposal"

     Then the meeting has 1 proposal
        * the meeting has no talks
        * I have 1 proposal
        * the meeting has 1 proposal titled "my-proposal"
        * I have 1 proposal titled "my-proposal"


  Scenario: No duplication (based on the title)
     When I make a proposal titled "my-proposal"
      And I make a proposal titled "my-proposal"

     Then the meeting has 1 proposal
        * I have 1 proposal
