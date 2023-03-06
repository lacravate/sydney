require 'rails_helper'

RSpec.describe RecipePopulator do

  let(:json_recipes) { 'spec/fixtures/recipes.json' }
  let(:populator) { described_class.new json_recipes }

  describe "populate_with" do
    before(:each) do
      described_class.populate_with json_recipes
    end

    it "should have populated recipes collection" do
      expect(Recipe.count).to eq(5)
    end
  end

  describe "source" do
    it "should have a source filename" do
      expect(File.exist?(populator.filename)).to be_truthy
    end
  end

  describe "populate" do
    before(:each) do
      populator.populate
    end

    it "should have populated recipes collection" do
      expect(Recipe.count).to eq(5)
    end
  end

  describe "creation_params" do
    let(:json_line) { File.read(populator.filename).lines.first }

    it "should normalize the params gotten from source line" do
      expect(populator.creation_params(json_line)).to eq({
        "author" => "Nutella",
        "budget" => "bon marché",
        "cook_time" => "10 min",
        "difficulty" => "très facile",
        "name" => "6 ingrédients que l’on peut ajouter sur une crêpe au Nutella®",
        "people_quantity" => "6",
        "prep_time" => "15 min",
        "rate" => "5",
        "total_time" => "25 min",
        'searchable_ingredients' => "[\"600g de pâte à crêpe\",\"1/2 orange\",\"1/2 banane\",\"1/2 poire pochée\",\"1poignée de framboises\",\"75g de Nutella®\",\"1poignée de noisettes torréfiées\",\"1/2poignée d'amandes concassées\",\"1cuillère à café d'orange confites en dés\",\"2cuillères à café de noix de coco rapée\",\"1/2poignée de pistache concassées\",\"2cuillères à soupe d'amandes effilées\"]"
      })
    end 
  end

end
