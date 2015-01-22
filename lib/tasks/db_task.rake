namespace :db do
  desc "bootstrap database"
  task bootstrap: %i(drop create migrate seed)
end
