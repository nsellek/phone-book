class State < ApplicationRecord

  def self.options
    all.order(:name).pluck(:name, :id)
  end
end
