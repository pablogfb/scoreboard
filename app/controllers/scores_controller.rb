class ScoresController < ApplicationController
  before_action :set_score_board
  before_action :set_score, only: [ :show, :edit, :update, :destroy, :operation ]


  def index
    @scores = @score_board.scores.ordered
  end

  def show
  end

  def new
    @score = Score.new
  end

  def create
    @score = Score.new(score_params)
    @score.score_board = @score_board
    if @score.save
      respond_to do |format|
        format.html { redirect_to score_boards_path(id: @score_board.id), notice: "Score was successfully created." }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @score.update(score_params)
      redirect_to score_board_path(@score_board), notice: "ScoreBoard was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @score.destroy

    respond_to do |format|
      format.html { redirect_to score_boards_path(id: @score_board.id), notice: "Score was successfully destroyed." }
      format.turbo_stream
    end
  end

  def operation
    if @score.update(value: @score.value + params[:value].to_i)
      respond_to do |format|
        format.html { redirect_to score_boards_path(id: @score_board.id), notice: "Score was successfully updated." }
        format.turbo_stream
      end
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_score_board
    @score_board = current_http_user.score_boards.find(params[:score_board_id])
  end

  def set_score
    @score = @score_board.scores.find(params[:id])
  end

  def score_params
    params.require(:score).permit(:name, :value)
  end
end
