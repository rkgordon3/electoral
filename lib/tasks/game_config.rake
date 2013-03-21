namespace :db do
   desc 'Populate database with a sample election game'
   task gameconfig: :environment do
   	  c = Configurator.new("test2", Date.today)
   	  c.persist
   end
end