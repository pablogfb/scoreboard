class AddScoreBoardReferenceToScores < ActiveRecord::Migration[7.2]
  def change
    add_reference :scores, :score_board, null: false, foreign_key: true
  end
end
