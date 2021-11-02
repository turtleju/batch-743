const hintButton = document.querySelector("#show-hint");
const hint = document.querySelector(".hint");
hintButton.addEventListener('click', () => {
  hint.classList.add('active');
});

// 1. sélectionner tous les carreaux
const tiles = Array.from(document.querySelectorAll('td'));

// 4. si il est voisin direct de la case vide
const canMove = (tile) => {
  const emptyTile = document.querySelector(".empty");
  const emptyTileColumn = emptyTile.cellIndex;
  const emptyTileRow = emptyTile.parentElement.rowIndex;
  const tileColumn = tile.cellIndex;
  const tileRow = tile.parentElement.rowIndex;
  return (
    tileColumn === emptyTileColumn && tileRow === emptyTileRow + 1 ||
    tileColumn === emptyTileColumn && tileRow === emptyTileRow - 1 ||
    tileRow === emptyTileRow && tileColumn === emptyTileColumn + 1 ||
    tileRow === emptyTileRow && tileColumn === emptyTileColumn - 1)
};

const moveTile = (element) => {
  const emptyTile = document.querySelector(".empty");
  element.classList.add('empty');
  emptyTile.innerHTML = element.innerHTML
  element.innerHTML = '';
  emptyTile.classList.remove('empty');
};

const puzzleIsSolved = () => {
  const solvedString = "1,2,3,4,5,6,7,8,9,10,11,12,13,14,15"
  const currentStateOfTheGame = tiles.map(tile => tile.innerText).join(',')
  return solvedString === currentStateOfTheGame
};

// 2. itérer dessus
tiles.forEach((tile) => {
  tile.addEventListener('click', (event) => {
    // if canMove
    if (canMove(tile)) {
      moveTile(tile);
    }
    puzzleIsSolved();
    // if winner wins : alert
  })
});
// 3. écouter le click sur chaque carreau

// 5. échanger le carreau avec la case vide
// 6. Vérifie se l'utilisateur a gagné
