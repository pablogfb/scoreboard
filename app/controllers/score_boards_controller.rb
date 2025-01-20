class ScoreBoardsController < ApplicationController
  before_action :set_score_board, only: [ :show, :edit, :update, :destroy, :new_user, :add_user, :delete_user ]
  respond_to :html, :turbo_stream


  def index
    @score_boards = current_http_user.score_boards.ordered
  end

  def show
  end

  def new
    @score_board = ScoreBoard.new
  end

  def create
    @score_board = ScoreBoard.new(score_board_params)
    @score_board.users = [ current_http_user ]
    if @score_board.save
      respond_to do |format|
        format.html { redirect_to score_boards_path, notice: "ScoreBoard was successfully created." }
        format.turbo_stream
        format.json { render json: { score_board: @score_board } }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @score_board.update(score_board_params)
      redirect_to score_boards_path, notice: "ScoreBoard was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @score_board.destroy

    respond_to do |format|
      format.html { redirect_to score_boards_path, notice: "Score Board was successfully destroyed." }
      format.turbo_stream
    end
  end

  def new_user
  end

  def add_user
    @user = User.find_by(email: params[:email])
    @score_board.users.append(@user)
    respond_to do |format|
      format.html { redirect_to score_boards_path, notice: "Score Board was successfully Updated." }
      format.turbo_stream
    end
  end

  def delete_user
    @user_email = params[:email]
    @score_board.users = @score_board.users.where.not(email: @user_email) unless @score_board.users.size <= 1 || current_http_user.email == @user_email
    if @score_board.save
      respond_to do |format|
        format.html { redirect_to score_boards_path, notice: "Score Board was successfully Updated." }
        format.turbo_stream
      end
    end
  end

  private

  def set_score_board
    @score_board = current_http_user.score_boards.find(params[:id])
  end

  def score_board_params
    params.require(:score_board).permit(:name)
  end
end
