# frozen_string_literal: true

module Api
  module Auth
    class SessionsController < Devise::SessionsController
      before_action :authenticate_user!, only: :destroy
      respond_to :json

      private

      def sign_in_params
        params.require(:user).permit(:email, :password)
      end

      def respond_with(current_user, _opts = {})
        if resource.persisted?
          render json: {
            status: { code: 200, message: 'Signed up successfully.' },
            data: Api::UserSerializer.new(current_user).to_h
          }, status: :ok
        else
          render json: {
            status: { code: 401, message: resource.errors.full_messages.to_sentence }
          }, status: :unprocessable_entity
        end
      end

      def respond_to_on_destroy # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
        if request.headers['Authorization'].present?
          jwt_payload = JWT.decode(request.headers['Authorization'].split(' ').last,
                                   Rails.application.credentials.devise_jwt_secret_key!).first
          current_user = User.find(jwt_payload['sub'])
        end

        if current_user
          render json: {
            status: 200,
            message: 'Logged out successfully.'
          }, status: :ok
        else
          render json: {
            status: 401,
            message: "Couldn't find an active session."
          }, status: :unauthorized
        end
      end
    end
  end
end
