require 'rails/generators/rails/scaffold/scaffold_generator'

class ChuckyScaffGenerator < Rails::Generators::NamedBase
  desc "ejecuta scaffold y luego hace mis personalizaciones"

  source_root File.expand_path('../templates', __FILE__)

  class_option :chucky#, aliases: '-chu'
  class_option :i18n_singular_name
  class_option :i18n_plural_name

  def prueba
    puts "puts ##################"
    puts "name: #{name}"
    puts "args: #{args.to_s}"
    puts "options: #{options.to_s}"
    puts "options['chucky']: #{options['chucky']}"
    puts "puts ##################"
    #copy_file "chucky_partial.rb", "config/initializers/chucky_partial.rb"
  end

  def invoke_scaffold
    invoke 'scaffold'
  end

  def i18nize_model
    if options['i18n_singular_name'] && options['i18n_plural_name']
      inject_into_file 'config/locales/es.yml', after: "models:\n" do
"      #{name}:
        one: #{options['i18n_singular_name']}
        other: #{options['i18n_plural_name']}\n"
      end
    end
  end


end


