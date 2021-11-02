const capitalize = (string) => {
  // récupérer 1ère lettre - la passer en majuscule
  const firstLetter = string[0].toUpperCase();
  console.log(firstLetter);
  // récupérer le reste - les passer en minuscule
  const restOfString = string.substring(1).toLowerCase();
  return `${firstLetter}${restOfString}`;
};

console.log(capitalize('jEanpieRRe'));
