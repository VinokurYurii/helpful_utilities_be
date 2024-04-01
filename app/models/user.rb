# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable # :recoverable, :rememberable, :validatable

  validates :email, :first_name, :last_name, presence: true
end