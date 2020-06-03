const initBuyAgain = () => {
  document.querySelector(".likeitem").addEventListener("click", (event) => {
    event.currentTarget.style.color = '#33D89E';
    document.querySelector(".dislikeitem").style.color = '#D6D6D6';
    document.getElementById('review_buyagain').checked = true;
  })

  document.querySelector(".dislikeitem").addEventListener("click", (event) => {
    event.currentTarget.style.color = '#D93500';
    document.querySelector(".likeitem").style.color = '#D6D6D6';
    document.getElementById('review_buyagain').checked = false;
  })
}

export {initBuyAgain};
