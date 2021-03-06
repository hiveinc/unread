module Unread
  module Reader
    module InstanceMethods
      # 複数のreadableレコードをまとめて既読扱いにしているレコード(readable_idがnilのレコード)を返す
      def read_mark_global(klass)
        instance_var_name = "@read_mark_global_#{klass.name.gsub('::','_')}"
        if instance_variables.include?(instance_var_name.to_sym)
          instance_variable_get(instance_var_name)
        else # memoize
          obj = read_marks.where(readable_type: klass.base_class.name).global.first
          instance_variable_set(instance_var_name, obj)
        end
      end
    end
  end
end
