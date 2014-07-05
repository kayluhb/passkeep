guard :bundler do
  watch('Gemfile')
end

guard :rspec, cmd: 'bundle exec rspec --color --format progress', all_after_pass: false, all_on_start: true do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }

  # Rails example
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/(.*)(\.erb|\.haml|\.slim)$})          { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
  watch(%r{^app/models/(.+)\.rb$})                    { |m| "spec/models/#{m[1]}_spec.rb" }
  watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
  #watch('config/routes.rb')                           { "spec/routing" }
  watch('app/controllers/application_controller.rb')  { "spec/controllers" }

  # Capybara features specs
  watch(%r{^app/views/(.+)/.*\.(erb|haml|slim)$})     { |m| "spec/features/#{m[1]}_spec.rb" }
end


# I can't get this to do anything
#guard :livereload, host: 'localhost', apply_js_live: true, appy_css_live: true do
#  watch(%r{app/.*/[^.][^/]+\.(erb|haml|slim)})
#  watch(%r{app/helpers/.*/[^.][^/]+\.rb})
#  watch(%r{public/(.*/[^.][^/]+\.(css|js|html))}) {|m| m[1] }
#  watch(%r{app/assets/(.*/[^.][^/]+\.css)(\.s[ac]ss)?}) { |m| "/assets/#{m[1]}" }
#  watch(%r{app/assets/(.*/[^.][^/]+\.js)(\.coffee)?}) { |m| "/assets/#{m[1]}" }
#  watch(%r{config/locales/[^.].+\.yml})
#end

guard 'annotate' do
  watch( 'db/schema.rb' )

  # Uncomment the following line if you also want to run annotate anytime
  # a model file changes
  watch( 'app/models/**/*.rb' )

  # Uncomment the following line if you are running routes annotation
  # with the "routes: true" option
  #watch( 'config/routes.rb' )
end
