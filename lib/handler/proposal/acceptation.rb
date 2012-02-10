module Handler::Proposal
  class Acceptation < Handler::Base

    def accept(proposal)
      raise_authorization_error_if_not(user_admin?, 'not authorized : only an admin can accept a Proposal')

      meeting = proposal.meeting
      author  = proposal.author
      meeting.remove_proposal(proposal)
      author .remove_proposal(proposal)

      Handler::Talk::Creation.new(@user_credentials).create(author, meeting, proposal.title)
    end

  end
end
