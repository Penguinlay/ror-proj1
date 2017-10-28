class TrainersController < ApplicationController
  before_action :authenticate_trainer!

  def index
    @trainers = Trainer.all
  end

  def show
    @trainer = Trainer.find(params[:id])
    @healthy_pokemons = @trainer.pokemons.select{|pokemon| pokemon.health > 0}
    @healthless_pokemons = @trainer.pokemons.select{|pokemon| pokemon.health <= 0}
  end

end
