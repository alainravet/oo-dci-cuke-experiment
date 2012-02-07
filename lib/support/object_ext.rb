class Object

  def nil_or_blank?
    self==nil || (self.respond_to?(:=~) && self =~ /^\s*$/)
  end

end