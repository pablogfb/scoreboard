class User < ApplicationRecord
  devise :database_authenticatable, :validatable, :registerable

  has_and_belongs_to_many :score_boards, dependent: :destroy, join_table: "users_score_boards"

  def name
    email.split("@").first.capitalize
  end
end
