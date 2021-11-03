const results = document.querySelector('#results');
const form = document.querySelector('#search-movies');

const searchMovies = (query) => {
  const url = `http://www.omdbapi.com/?s=${query}&apikey=adf1f2d7`;
  fetch(url)
    .then(response => response.json())
    .then((data) => {
      data.Search.forEach((movie) => {
        results.insertAdjacentHTML(("beforeend"),
          `<li>
            <img src="${movie.Poster}"/>
            <p>${movie.Title}</p>
          </>`
        )
      });
    });
};

form.addEventListener('submit', (event) => {
  event.preventDefault(); // <-- to prevent <form>'s native behaviour
  const input = event.currentTarget.querySelector('.form-control');
  results.innerHTML = '';
  searchMovies(input.value);
});
