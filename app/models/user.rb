# frozen_string_literal: true

class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :validatable, :rememberable, :validatable, :jwt_authenticatable,
         jwt_revocation_strategy: self

  validates :email, :first_name, :last_name, presence: true
end
