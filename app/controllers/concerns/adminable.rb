module Adminable
  extend ActiveSupport::Concern

  included do

    before_action :setup_model,
      only: [:edit, :update, :destroy, :show, :confirm_destroy]

    def index
    end

    def edit
    end

    def confirm_destroy
    end

    private

      def flash_message(model)
        render_to_string partial: "flash", locals: { model: model }
      end

      def setup_model
      end
  end

end
