module Handler::Proposal
  class Acceptation < Handler::Base

    def accept(proposal)
      meeting = proposal.meeting
      author  = proposal.author
      meeting.remove_proposal(proposal)
      author .remove_proposal(proposal)

      Handler::TalkCreation.new(@user).create(author, meeting, proposal.title)
    end

  end
end
