class StatesController < ApplicationController
  # create
  def create
    state = State.new(state_params)
    if state.save!
      redirect_to users_path, notice: 'State successfully saved!!!!!!!!'
    else
      redirect_to :new
    end
  end
  # new
  def new
    @state = State.new
  end
  # edit
  def edit

  end
  # update
  def update

  end
  # destory
  def destroy

  end

  private

  def state_params
    params.require(:state).permit(:name)
  end
end
