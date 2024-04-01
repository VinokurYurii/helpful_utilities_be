# frozen_string_literal: true

module Api
  class UsersController < Api::ApplicationController
    def index
      render json: User.all
    end
  end
end
