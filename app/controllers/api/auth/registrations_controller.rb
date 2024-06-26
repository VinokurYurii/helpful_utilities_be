# frozen_string_literal: true

module Api
  module Auth
    class RegistrationsController < Devise::RegistrationsController
      respond_to :json

      private

      def sign_up_params
        params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
      end

      def respond_with(current_user, _opts = {}) # rubocop:disable Metrics/MethodLength
        if resource.persisted?
          render json: {
            status: { code: 200, message: 'Signed up successfully.' },
            data: UserSerializer.new(current_user).to_h
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
