class Web::ProtectedApplicationController < Web::ApplicationController
  before_filter :authenticate!
end
