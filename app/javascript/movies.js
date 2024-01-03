document.addEventListener("turbo:load", function () {
  var numMoviesElement = document.getElementById("num_movies");

  if (numMoviesElement) {
    numMoviesElement.addEventListener("change", function (e) {
      var numMovies = e.target.value;
      var container = document.getElementById("additional_movies");
      var movieFields = "";

      for (var i = 1; i < numMovies; i++) {
        movieFields += `
          <div class="movie">
            <label for="movies_${i}_title">Title</label>
            <input type="text" name="movies[${i}][title]" id="movies_${i}_title" placeholder="Title">

            <label for="movies_${i}_description">Description</label>
            <textarea name="movies[${i}][description]" id="movies_${i}_description" placeholder="Description"></textarea>

            <label for="movies_${i}_image_url">Image URL</label>
            <input type="text" name="movies[${i}][image_url]" id="movies_${i}_image_url" placeholder="Image URL">
          </div>
        `;
      }

      container.innerHTML = movieFields;
    });
  }
});
