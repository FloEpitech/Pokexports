document.addEventListener('DOMContentLoaded', function() {
  console.log("pokemons.js loaded");
  const searchInput = document.getElementById('search-input');
  const suggestions = document.getElementById('suggestions');
  const pokemonCards = document.querySelectorAll('.pokemon-card');

  searchInput.addEventListener('input', function() {
    const query = searchInput.value.toLowerCase();
    suggestions.innerHTML = '';
    if (query.length > 0) {
      const matchedPokemons = Array.from(pokemonCards).filter(card => card.dataset.pokemonName.includes(query)).slice(0, 5); // Limite à 5 suggestions
      matchedPokemons.forEach(pokemon => {
        const listItem = document.createElement('li');
        const pokemonName = pokemon.querySelector('p:nth-child(3)').textContent.split(': ')[1]; // Récupérer uniquement le nom du Pokémon
        listItem.textContent = pokemonName;
        listItem.dataset.pokemonId = pokemon.id;
        listItem.addEventListener('click', function() {
          document.getElementById(listItem.dataset.pokemonId).scrollIntoView({ behavior: 'smooth' });
          document.querySelectorAll('.pokemon-card').forEach(card => card.classList.remove('highlight'));
          document.getElementById(listItem.dataset.pokemonId).classList.add('highlight');
          suggestions.style.display = 'none';
        });
        suggestions.appendChild(listItem);
      });
      suggestions.style.display = 'block';
    } else {
      suggestions.style.display = 'none';
    }
  });
});

