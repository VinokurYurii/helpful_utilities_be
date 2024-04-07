# frozen_string_literal: true

module Api
  module Auth
    class RegistrationsController < Devise::RegistrationsController
      respond_to :json

      private

      def respond_with(current_user, _opts = {})
        if resource.persisted?
          render json: {
            status: {code: 200, message: 'Signed up successfully.'},
            data: UserLoginSerializer.new(current_user).to_h
          }
        else
          render json: {
            status: {
              message: "User couldn't be created successfully. #{current_user.errors.full_messages.to_sentence}"
            }
          }, status: :unprocessable_entity
        end
      end
    end
  end
end
