class PokemonsController < ApplicationController
    def capture
        id = params[:id]
        pokemon = Pokemon.find(id)
        pokemon.trainer = current_trainer
        pokemon.save!
        redirect_to root_path
    end

    def damage
        id = params[:id]
        pokemon = Pokemon.find(id)
        pokemon.health -= 10
        pokemon.save!
        # if pokemon.health <= 0
        #     # Below will just get rid of pokemons with health below zero.
        #     # flash[:alert] = "Pokemon #{pokemon.name} has died!"
        #     # pokemon.destroy
        #
        #     # Instead, hide pokemons with health below zero in view.
        # end
        redirect_to trainer_path(pokemon.trainer)
    end

    def heal
        id = params[:id]
        pokemon = Pokemon.find(id)
        # Below is fine since damage and heal are multiples of 10 as of now.
        if pokemon.health >= 100
            flash[:alert] = "Your pokemon #{pokemon.name} is perfectly healthy!"
        else
            pokemon.health += 10
        end
        pokemon.save!
        redirect_to trainer_path(current_trainer)
    end

    def new
        @pokemon = Pokemon.new
    end

    def create
        pokemon = Pokemon.new(name: params[:pokemon][:name], level: 1, health: 100, trainer: current_trainer)
        if pokemon.save
            redirect_to trainer_path(current_trainer), notice: "A new pokemon named #{pokemon.name} is created!"
        else
            flash[:error] = "Something went wrong... #{pokemon.errors.full_messages.to_sentence}!"
            redirect_to new_path
        end
    end
end
