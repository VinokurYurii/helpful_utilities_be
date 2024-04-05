# frozen_string_literal: true

module Api
  module Auth
    class SessionsController < Devise::SessionsController
      # respond_to :json

      def create
        super
        # self.resource = warden.authenticate!(auth_options)
        # set_flash_message!(:notice, :signed_in)
        # sign_in(resource_name, resource)
        # response.set_cookie(
        #   "SomeName",
        #   value: session.access_token,
        #   path: '/',
        #   domain: "localhost",
        #   expires: session.expired_at,
        #   http_only: false
        # )
        #
        # render json: {user: current_user.to_h}
      end
      # def render_create_success
      #   ::RequestStore.store[:current_user_id] = @resource&.id
      #   render_resource_data(@resource, root_key: :data, serializer: ::UserDetailedSerializer)
      # end
      private

      def sign_in_params
        params.require(:user).permit(:email, :password)
      end

      # def set_token_cookie(name, session, url)
      #
      # end
    end
  end
end
