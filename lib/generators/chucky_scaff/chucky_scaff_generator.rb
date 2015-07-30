require 'rails/generators/rails/scaffold/scaffold_generator'

class ChuckyScaffGenerator < Rails::Generators::NamedBase
  desc "Generador mágico que solo la malicia de chucky puede crear"

  source_root File.expand_path('../templates', __FILE__)

  class_option :i18n_singular_name
  class_option :i18n_plural_name
  class_option 'no-relationize'
  class_option :authorization # ejemplo: --authorization=superuser:manage%director:read-edit-destroy
  class_option :public_activity # ejemplos: --public_activity (inserta codigo por default), --public_activity=create:update
  class_option :migrate # para que se ejecute rake db:migrate: --migrate=true

  # TODO: implementar los siguientes class_options
  class_option :validations # --validations=nombre_campo:precense-numericality%nombre_campo:precense-uniqueness
  class_option :formats # --formats=nombre_campo:all#money%nombre_campo:index#datelong@show#datesuperlong
  class_option :dependents # --dependents=nombre_campo:destroy%nombre_campo:restrict_with_error
  class_option :dropdown # --dropdown=nombre_campo:normal%nombre_campo:filter%nombre_campo:autocomplete
  class_option :fa_icon # --fa_icon='fa fa-lg fa-fw fa-cube'

  def invoke_scaffold
    invoke 'scaffold'
  end

  #def copy_and_rename_index
  #  copy_file "#{destination_root}/app/views/#{name.pluralize}/index.html.erb", "app/views/#{name.pluralize}/_index_content.html.erb"
  #  remove_file "app/views/#{name.pluralize}/index.html.erb"
  #  copy_file "index.html.erb", "app/views/#{name.pluralize}/index.html.erb"
  #end

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
    args.each do |field_and_type|
      field = field_and_type.strip.split(':')[0]
      if field.include? "_id"
        unless options['no-relationize'] && options['no-relationize'].split(':').include?(field)
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

  def public_activize
    if options[:public_activity]
      if options[:public_activity] == 'public_activity'
        tracked = 'tracked'
      else
        tracked = "tracked only: [:#{options[:public_activity].split(':').join(', :')}]"
      end
      inject_into_file "app/models/#{name}.rb", after: "< ActiveRecord::Base\n" do
        "\tinclude PublicActivity::Model\n\t#{tracked}\n\ttracked owner: ->(controller, model) {controller.try(:current_user)}\n\t#tracked recipient: ->(controller, model) { model.xxxx }
  tracked :params => {
              :attributes_changed => proc {|controller, model| model.id_changed? ? nil : model.changes}
          }\n"
      end
    end
  end

  def migrate_to_ddbb
    rake "db:migrate" if options[:migrate] == 'true'
  end

end


