module SimpleForm
  module Inputs
    class FileTableInput < Base
      def input(wrapper_options = nil)
        file_table_options = []
        merged_input_options = merge_wrapper_options(input_options.slice(*file_table_options).merge(input_html_options), wrapper_options)
        @builder.attachment_field(attribute_name, merged_input_options)
      end
    end
  end
end

SimpleForm::FormBuilder.class_eval do
  map_type :file_table, to: SimpleForm::Inputs::FileTableInput
end
