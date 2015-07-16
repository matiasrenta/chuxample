require 'rails/generators/rails/scaffold/scaffold_generator'

class ChuckyScaffGenerator < Rails::Generators::NamedBase
  desc "ejecuta scaffold y luego hace mis personalizaciones"

  source_root File.expand_path('../templates', __FILE__)

  class_option :i18n_singular_name
  class_option :i18n_plural_name
  class_option 'no-relationize'
  class_option :authorization # ejemplo: --authorization=superuser:manage%director:read-edit-destroy

  def prueba
    puts "options: #{options.to_s}"
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

  def relationize_models
    unless options['no-relationize']
      args.each do |field_and_type|
        field = field_and_type.strip.split(':')[0]
        if field.include? "_id"
          inject_into_file "app/models/#{name}.rb", after: "< ActiveRecord::Base\n" do
            "  belongs_to :#{field.split('_id')[0]}\n"
          end
          inject_into_file "app/models/#{field.split('_id')[0]}.rb", after: "< ActiveRecord::Base\n" do
            "  has_many :#{name.pluralize}\n"
          end
        end
      end
    end
  end

  def authorize_roles
    if options['authorization']
      options['authorization'].split('%').each do |role_and_grants|
        role = role_and_grants.split(':')[0]
        grants = role_and_grants.split(':')[1].split('-')
        inject_into_file "app/models/ability.rb", after: "def #{role}\n" do
          "\t\tcan [:#{grants.join(', :')}], #{name.camelize}\n"
        end
      end
    end
  end

end


