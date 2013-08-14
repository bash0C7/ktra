class IterationsController < ApplicationController
  def index
    @iterations = Iteration.find(:all, :order => "start_date DESC")
  end
  
  def show
    @iteration = Iteration.find(params[:id])
    @tasks = @iteration.tasks
    @total_point = @tasks.sum(:point)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @iteration }
    end
  end
end
  
