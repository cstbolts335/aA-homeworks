require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Chris") }
  let(:skittles) { Dessert.new("skittles", 213, chef) }

  describe "#initialize" do
    it "sets a type"
    expect(skittles.type).to eq("skittles")
    end

    it "sets a quantity"
    expect(skittles.quantity).to eq(213)
    end

    it "starts ingredients as an empty array"
    expect(skittles.ingredient).to be_empty
    end

    it "raises an argument error when given a non-integer quantity"
    expect { Dessert.new("skittles", "miami_heat", chef) }.to raise_error(ArgumentError) #b/c we threw in a non integer... testing by creating new Dessert instance
    end

  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array"
    skittles.add_ingredient("oranges")
    expect skittles.ingredient to include ("oranges")
    end

  end

  describe "#mix!" do
    it "shuffles the ingredient array"
    expect ingredients = ["oranges", "peanuts", "apples", "lebron", "jason"]

        ingredients.each do |ingredient|
          skittles.add_ingredient(ingredient)
        end

        expect(skittles.ingredients).to eq(ingredients)
        skittles.mix!
        expect(skittles.ingredients).not_to eq(ingredients)
        expect(skittles.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity"
    expect skittles.eat(13)
    expect(skittles.quantity).to eq(200)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { skittles.eat(420)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name"
    allow(chef).to receive(:titleize).and_return("Chef Chris the Great Baker")
    expect(skittles.serve).to eq("Chef Chris the Great Baker has made 213 skittles!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(skittles)
      skittles.make_more
    end
  end
end
