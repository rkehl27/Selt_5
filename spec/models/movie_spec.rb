require 'spec_helper'
require 'rails_helper'

describe Movie do
  describe 'searching TMDb by keyword' do
    it 'should call tmdb with title keywords' do
      #Movie = double(Movie)
      expect(Tmdb::Movie).to receive(:find).with('Inception')
      Movie.find_in_tmdb('Inception')
    end
    it 'should return an empty array if no results found' do
      #Movie = double(Movie)
      Tmdb::Movie.stub(:find).and_return([])
      result = Movie.find_in_tmdb('asdf')
      expect(result).to eq([])
    end
    it 'should return a nonempty array if results found' do
      #Movie = double(Movie)
      result = Movie.find_in_tmdb('Inception')
      expect(result.length).to be > 0
    end
  end
  #describe 'add to local database' do
   # it 'should call movie detail' do
    #  expect(Tmdb::Movie.detail(1)).to receive(:find).with('Inception')
     # Movie.find_in_tmdb('Inception')
    #end
  #end
end
