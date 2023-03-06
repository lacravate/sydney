require 'rails_helper'

RSpec.describe Recipe, :type => :model do
  let(:json_recipes) { 'spec/fixtures/recipes.json' }
  let(:recipe) { described_class.all.sample(1).first }

  before(:each) do
    RecipePopulator.populate_with json_recipes
  end

  describe "with_ingredients" do
    context "args as array" do
      it "should accept arguments as Array" do
        expect(described_class.with_ingredients(["sel","poivre"]).count).to eq(4)
      end
    end 

    context "args as a list" do
      it "should accept arguments as Array" do
        expect(described_class.with_ingredients("sel","poivre").count).to eq(4)
      end
    end

    context "variable number of ingredients" do
      it "should find according results" do
        expect(described_class.with_ingredients("banane").count).to eq(1)
        expect(described_class.with_ingredients("banane","noix de coco").count).to eq(1)
        expect(described_class.with_ingredients("banane","noix de coco", "noix de pécan").count).to eq(0)

        expect(described_class.with_ingredients("sel").count).to eq(4)
        expect(described_class.with_ingredients("sel","poivre").count).to eq(4)
        expect(described_class.with_ingredients("sel","poivre", "mangue").count).to eq(1)
      end
    end
  end

  describe "ingredients" do
    it "should be an array of strings" do
      expect(recipe.ingredients).to be_an_instance_of(Array)
      expect(recipe.ingredients.map(&:class).uniq).to eq([String])
    end

    it "should be an Array of String's from a persisted JSON string" do
      expect(recipe.ingredients).to eq(JSON.parse(recipe.searchable_ingredients))
    end
  end
end
