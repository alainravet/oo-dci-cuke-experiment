# Tests :
#------------


Then /(an|no) AuthorizationError is raised/ do |flag|
  error_detected      = @errors_raised.detect { |e| e.is_a?(AuthorizationError) }
  expecting_an_error  = flag=='an'
  if expecting_an_error
    fail "no AuthorizationError was raised in this scenario" unless error_detected
  else
    fail "an AuthorizationError was raised in this scenario" if error_detected
  end
end
