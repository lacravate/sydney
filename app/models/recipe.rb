class Recipe < ApplicationRecord

  scope :with_ingredient, -> (ingredient) { 
    where arel_table[:searchable_ingredients].matches("%#{ingredient}%")
  }

  def self.with_ingredients(*args)
    args.flatten.inject(self) do |r, i|
      r.with_ingredient i
    end
  end

  def ingredients
    @ingredients ||= JSON.parse searchable_ingredients
  end

end
