module Handler::Proposal
  class Creation < Handler::Base

    def create(meeting, title)
      return if @user.proposals.any?{|p| p.title==title}
      Meeting::Proposal.new(title).tap do |p|
        @user   .add_proposal p
        meeting .add_proposal p
      end
    end

  end
end
