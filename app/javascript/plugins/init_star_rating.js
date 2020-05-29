import "jquery-bar-rating";
import $ from 'jquery';

const initStarRating = () => {
console.log($("#review_stars"))
  $('#review_stars').barrating({
    theme: 'css-stars'
  });
};

export { initStarRating };
