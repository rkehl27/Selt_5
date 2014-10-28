require 'spec_helper'
require 'rails_helper'

describe MoviesController do
  describe 'searching TMDb' do 
    it 'should call the model method that performs TMDb search' do
      #Movie = double(Movie)
      fake_results = [double('movie1'), double('movie2')]
      expect(Movie).to receive(:find_in_tmdb).with('Ted').and_return(fake_results)
      post :search_tmdb, {:search_terms => 'Ted'}
    end
    it 'should select the Search Results template for rendering' do
      #Movie = double(Movie)
      fake_results = [double('movie1'), double('movie2')]
      Movie.stub(:find_in_tmdb).and_return(fake_results)
      post :search_tmdb, {:search_terms => 'Ted'}
      expect(response).to render_template('search_tmdb')
    end
    it 'should make the TMDb search results available to that template' do
      #Movie = double(Movie)
      fake_results = [double('Movie'), double('Movie')]
      allow(Movie).to receive(:find_in_tmdb).and_return(fake_results)
      post :search_tmdb, {:search_terms => 'hardware'}
      expect(assigns(:movies)) == fake_results
    end
    it 'should flash if no movies are found' do
      #Movie = double(Movie)
      fake_results = []
      allow(Movie).to receive(:find_in_tmdb).and_return(fake_results)
      post :search_tmdb, {:search_terms => 'asdf'}
      expect(assigns(:movies)) == fake_results
    end
  end
end

