##To use console in dev:
heroku run bundle exec tux -a polar-lake-91544


config.ru code, if you get needs_migration? error

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end


You need to make sure you are on the ruby version it was created with, in this case 2.7.3.  

Bundle install

Rake:db migrate 

Rake db:seed

Then you had to tweak config.ru 

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end
