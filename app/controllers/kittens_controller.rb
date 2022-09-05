class KittensController < ApplicationController
  before_action :set_kitten, only: %i[show edit update destroy]

  def index
    @kittens = Kitten.all
  end

  def show; end

  def new
    @kitten = Kitten.new
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      render :show, status: :created
    else
      render :new, status: :unprocessable_entitiy
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @kitten.update(kitten_params)
        format.html { redirect_to kitten_url(@kitten), notice: 'Kitten was successfully updated' }
      else
        format.html { render :edit, status: unprocessable_entitiy }
      end
    end
  end

  def destroy
    @kitten.destroy
    respond_to do |format|
      format.html { redirect_to kittens_url, notice: 'Kitten was successfully destroyed.' }
    end
  end

  private

  def set_kitten
    @kitten = Kitten.find(params[:id])
  end

  def kitten_params
    params.permit(:name, :age, :cuteness, :softness)
  end
end
