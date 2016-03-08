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

t1 = trainer1.save()
t2 = trainer2.save()
t3 = trainer3.save()
t4 = trainer4.save()

pokemon1 = Pokemon.new({ 'name' => 'Charmander'})
pokemon2 = Pokemon.new({ 'name' => 'Pikachu' })
pokemon3 = Pokemon.new({ 'name' => 'Vulpix'})
pokemon4 = Pokemon.new({ 'name' => 'Bulbasaur' })

p1 = pokemon1.save()
p2 = pokemon2.save()
p3 = pokemon3.save()
p4 = pokemon4.save()

entry1 = OwnedPokemon.new({ 'trainer_id' => t1.id , 'pokemon_id' => p1.id })
entry2 = OwnedPokemon.new({ 'trainer_id' => t2.id , 'pokemon_id' => p1.id })
entry3 = OwnedPokemon.new({ 'trainer_id' => t2.id , 'pokemon_id' => p2.id })
entry4 = OwnedPokemon.new({ 'trainer_id' => t3.id , 'pokemon_id' => p3.id })
entry5 = OwnedPokemon.new({ 'trainer_id' => t3.id , 'pokemon_id' => p4.id })
entry6 = OwnedPokemon.new({ 'trainer_id' => t4.id , 'pokemon_id' => p1.id })
entry7 = OwnedPokemon.new({ 'trainer_id' => t4.id , 'pokemon_id' => p4.id })

entry1.save()
entry2.save()
entry3.save()
entry4.save()
entry5.save()
entry6.save()
entry7.save()