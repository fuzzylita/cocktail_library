require "spec_helper"

RSpec.describe CocktailLibrary do
  it "has a version number" do
    expect(CocktailLibrary::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
