module Handler::Meeting
  class Creation < Handler::Base

    def create(params)
      params.symbolize_keys!

      raise_authorization_error_if_not(user_admin?, 'not authorized : only an admin can create a Meeting')

      already_exists = Handler::Meeting::Retrieval.new(@user).find_meeting_by_title(params[:title])
      raise_creation_error_if(already_exists, 'the title must be unique')

      Meeting.new(params).tap do |m|
        $objects_manager.add_meeting(m)
      end
    end

  end
end
