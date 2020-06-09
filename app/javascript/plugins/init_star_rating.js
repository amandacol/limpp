import "jquery-bar-rating";
import $ from 'jquery';

const initStarRating = () => {
console.log($("#review_rating"))
  $('#review_rating').barrating({
    theme: 'css-stars'
  });
};


export { initStarRating };
