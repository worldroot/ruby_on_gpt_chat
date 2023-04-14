guard :rspec, cmd: 'bundle exec rspec', all_on_start: false, all_after_pass: false do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { 'spec' }

  # Watch all the Ruby files
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/(.*)(\.erb|\.haml|\.slim)$})          { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_controller\.rb$}) do |m|
    ["spec/routing/#{m[1]}_routing_spec.rb", "spec/controller/#{m[1]}_controller_spec.rb",
     "spec/requests/#{m[1]}_spec.rb"]
  end
  watch(%r{^spec/support/(.+)\.rb$})                  { 'spec' }
  watch('config/routes.rb')                           { 'spec/routing' }
  watch('app/views/**/*.haml')                        { 'spec/integration' }

  watch(%r{^spec/.+_spec\.rb$}) do
    system('bin/rails db:migrate RAILS_ENV=test')
    system('bin/rails db:seed RAILS_ENV=test')
    system('bin/rails db:test:prepare')
  end
end
