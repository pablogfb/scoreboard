class ScoreBoard < ApplicationRecord
  has_and_belongs_to_many :users, join_table: "users_score_boards"
  has_many :scores, dependent: :destroy
  scope :ordered, -> { order(id: :desc) }


  validates :name, presence: true
  broadcasts_to ->(score_board) { [ score_board ] }, inserts_by: :prepend
end
