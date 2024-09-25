class UsersScoreBoards < ActiveRecord::Migration[7.2]
  create_table :users_score_boards, id: false do |t|
    t.belongs_to :user
    t.belongs_to :score_board
  end
end
