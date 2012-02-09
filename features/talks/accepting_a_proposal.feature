Feature: an admin accepts a talk proposal
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
    When I make a proposal titled "my-proposal"
#------------------------------------------------------------------------



  Scenario: Happy path : making a valid proposal

    After a plain user made a proposal,
    an admin accepts it and it is converted into a talk.

    # BEFORE
        * the meeting has 1 proposal
        * the meeting has no talks
        * I have 1 proposal
        * I have no talks
        * the meeting has 1 proposal titled "my-proposal"
        * I have 1 proposal titled "my-proposal"

     When an admin accepts the proposal

    # AFTER
     Then the meeting has no proposal
        * the meeting has 1 talk
        * the meeting has 1 talk titled "my-proposal"
        * I have no proposals
        * I have 1 talk



  Scenario: A plain user cannot accept a proposal
    When I accept the proposal
    Then an AuthorizationError is raised
