# frozen_string_literal: true

module Api
  class UserSerializer < ActiveModel::Serializer
    attributes :id, :email, :first_name, :last_name
  end
end
