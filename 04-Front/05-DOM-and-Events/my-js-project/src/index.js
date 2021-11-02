const winners = document.querySelectorAll("#fifa-wins li");
const list = document.querySelector('#fifa-wins');

setTimeout(() => {
  list.insertAdjacentHTML('beforeend', '<li>France (2 wins)</li>');
}, 2000);

const home = document.getElementById("home");

console.log(home.innerText);
console.log(home.innerHTML);
console.log(home.attributes.href.value);

document.querySelectorAll("img").forEach((img) => {
  img.addEventListener("click", (event) => {
    event.currentTarget.classList.toggle("img-circle");
  });
});
