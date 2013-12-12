require 'spec_helper'

describe Movie  do 
  let(:movie) { Movie.new }

  describe "#snippet" do
    context "when desciption is nil" do
      it "should return an empty string" do
        allow(movie).to receive(:description).and_return("")

        expect(movie.snippet).to eq("")
      end
    end

    context "when desciption is less than 50" do
      it "should retrun the same string" do
        allow(movie).to receive(:description).and_return("abc")

        expect(movie.snippet).to eq("abc")
      end
    end

    context "when desciption is more than 50" do
      it "should retrun the same string shorten to 50 chars" do
        allow(movie).to receive(:description).and_return("a"*51)

        expect(movie.snippet).to eq("a"*47+"...")
      end
    end

    context "when desciption is equal to 50" do
      it "should retrun the same string" do
        allow(movie).to receive(:description).and_return("a"*50)

        expect(movie.snippet).to eq("a"*50)
      end
      expect(movie.snippet).to eq("")
    end
  end
  
end