require_relative( '../models/pokemon.rb' )
require_relative( '../models/trainer.rb' )
require_relative( '../models/owned_pokemon.rb' )

OwnedPokemon.delete_all
Trainer.delete_all
Pokemon.delete_all

trainer1 = Trainer.new({ 'name' => 'Tony' })
trainer2 = Trainer.new({ 'name' => 'Valerie' })
trainer3 = Trainer.new({ 'name' => 'Kat' })
trainer4 = Trainer.new({ 'name' => 'Zsolt' })

trainer1.save()
trainer2.save()
trainer3.save()
trainer4.save()

pokemon1 = Pokemon.new({ 'name' => 'Charmander'})
pokemon2 = Pokemon.new({ 'name' => 'Pikachu' })
pokemon3 = Pokemon.new({ 'name' => 'Vulpix'})
pokemon4 = Pokemon.new({ 'name' => 'Bulbasaur' })

pokemon1.save()
pokemon2.save()
pokemon3.save()
pokemon4.save()

entry1 = OwnedPokemon.new({ 'trainer_id' => trainer1.id , 'pokemon_id' => pokemon1.id })
entry2 = OwnedPokemon.new({ 'trainer_id' => trainer2.id , 'pokemon_id' => pokemon1.id })
entry3 = OwnedPokemon.new({ 'trainer_id' => trainer2.id , 'pokemon_id' => pokemon2.id })
entry4 = OwnedPokemon.new({ 'trainer_id' => trainer3.id , 'pokemon_id' => pokemon3.id })
entry5 = OwnedPokemon.new({ 'trainer_id' => trainer3.id , 'pokemon_id' => pokemon4.id })
entry6 = OwnedPokemon.new({ 'trainer_id' => trainer4.id , 'pokemon_id' => pokemon1.id })
entry7 = OwnedPokemon.new({ 'trainer_id' => trainer4.id , 'pokemon_id' => pokemon4.id })

entry1.save()
entry2.save()
entry3.save()
entry4.save()
entry5.save()
entry6.save()
entry7.save()