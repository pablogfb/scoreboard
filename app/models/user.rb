class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_and_belongs_to_many :score_boards, dependent: :destroy, join_table: "users_score_boards"

  def name
    email.split("@").first.capitalize
  end
end
