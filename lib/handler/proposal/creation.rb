module Handler::Proposal
  class Creation < Handler::Base

    def create(meeting, title)
      author = current_user
      return if author.proposals.any?{|p| p.title==title}
      Meeting::Proposal.new(author, meeting, title).tap do |p|
        author  .add_proposal p
        meeting .add_proposal p
      end
    end

  end
end
