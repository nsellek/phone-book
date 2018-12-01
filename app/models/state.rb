class State < ApplicationRecord

  def self.options
    @_options ||= all.order(:name)
  end
end
