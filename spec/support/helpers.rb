module SpecHelper
  module ClassMethods
    def set_controller(name, action_name)
      let!(:controller_class) { stub_const(name.camelize, Class.new) }

      let(:controller) {
        double(class: controller_class, controller_name: name, action_name: action_name)
      }
    end

    def set_translations(scopes)
      translations = {}

      scopes.each do |scope, value|
        *parts, last_scope = scope.split(".")
        context = translations

        while parts.any?
          scope_name = parts.shift
          context[scope_name] ||= {}
          context = context[scope_name]
        end

        context[last_scope] = value
      end

      before do
        I18n.backend.store_translations :en, translations
      end

      after do
        I18n.reload!
        I18n.backend.send :init_translations
      end
    end
  end
end
