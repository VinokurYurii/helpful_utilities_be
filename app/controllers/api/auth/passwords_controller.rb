# frozen_string_literal: true

module Api
  module Auth
    class PasswordsController < Devise::PasswordsController
      respond_to :json
    end
  end
end
