require_relative '../scraper'

describe '#fetch_movies_url' do
  it 'returns array of urls' do
    expected = [
      "https://www.imdb.com/title/tt0111161/",
      "https://www.imdb.com/title/tt0068646/",
      "https://www.imdb.com/title/tt0071562/",
      "https://www.imdb.com/title/tt0468569/",
      "https://www.imdb.com/title/tt0050083/"
    ]
    expect(fetch_movies_url).to eq(expected)
  end
end

describe '#scrape_movie' do
  it 'returns a hash with data of the movie' do
  expected = {
    cast: [ "Christian Bale", "Heath Ledger", "Aaron Eckhart" ],
    director: "Christopher Nolan",
    storyline: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
    title: "The Dark Knight",
    year: 2008
  }
  expect(scrape_movie('https://www.imdb.com/title/tt0468569/')).to eq(expected)
  end
end
