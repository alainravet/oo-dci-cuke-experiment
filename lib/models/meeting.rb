class Meeting < Model::Base
  attr_reader :title, :date, :location, :hidden

  def initialize(params)
    raise ObjectsManager::CreationError if params[:title].nil_or_blank?
    @title    = params.delete(:title)
    @date     = params.delete(:date)
    @location = params.delete(:location)
    @hidden   = params.delete(:hidden)=='true' || false # visible by default
    unless params.keys.empty?
      raise ObjectsManager::CreationError.new("invalid meeting properties : #{params.inspect}")
    end
  end

  has_many :talks, :proposals, :attendees

  def visible?
    !@hidden
  end

  def past?
    date < Time.now.to_date
  end

end
