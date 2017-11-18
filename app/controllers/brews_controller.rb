class BrewsController < ApplicationController
  def index
    load_brews
  end

  def show
    load_brew
  end

  def new
    build_brew
  end

  def create
    build_brew
    save_brew('Brew successfully logged.') || render(:new)
  end

  def edit
    load_brew
  end

  def update
    load_brew
    build_brew
    save_brew('Brew successfully updated.') || render(:edit)
  end

  private

  def brew_params
    brew_params ||= params[:brew]
    brew_params ? brew_params.permit(:amount, :description, :product_id, :date) : {}
  end

  def build_brew
    @brew ||= brew_scope.build
    @brew.attributes = brew_params
  end

  def load_brews
    @brews ||= brew_scope
  end

  def load_brew
    @brew ||= brew_scope.find(params[:id])
  end

  def save_brew(msg)
    redirect_to @brew, notice: msg if @brew.save
  end

  def brew_scope
    Brew.all
  end
end
