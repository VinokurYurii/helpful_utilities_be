# frozen_string_literal: true

module Api
  class UserLoginSerializer < UserSerializer
    attributes :jti
  end
end
