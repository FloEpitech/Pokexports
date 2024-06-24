# Pokexports

Pokexports est une application Ruby on Rails qui permet de visualiser et d'exporter des informations sur les Pokémon de la première génération au format CSV.

## Prérequis

<ul>
  <li>Ruby (version 3.0.2)</li>
  <li>Rails (version 7.1.3.4)</li>
  <li>Git</li>
  <li>Bundler</li>
</ul>

## Installation

<ol>
  <li>Clonez le dépôt :
    <pre><code>git clone https://github.com/votre-utilisateur/pokexports.git
cd pokexports
    </code></pre>
  </li>
  <li>Installez les dépendances Ruby :
    <pre><code>bundle install
    </code></pre>
  </li>
</ol>

## Configuration

<p>Aucune configuration spécifique n'est requise pour cette application. Assurez-vous simplement que votre environnement de développement est correctement configuré avec les préréquis énumérés ci-dessus.</p>

## Lancement de l'application

<ol>
  <li>Démarrez le serveur Rails :
    <pre><code>rails server
    </code></pre>
  </li>
  <li>Ouvrez votre navigateur et accédez à l'URL suivante :
    <pre><code>http://localhost:3000
    </code></pre>
  </li>
</ol>

## Utilisation

<ul>
  <li>Sur la page d'accueil, vous verrez une liste des Pokémon de la première génération.</li>
  <li>Utilisez la barre de recherche pour trouver un Pokémon spécifique. Les suggestions apparaîtront en fonction de votre saisie.</li>
  <li>Sélectionnez les Pokémon que vous souhaitez exporter en cochant les cases correspondantes.</li>
  <li>Cliquez sur le bouton "Exporter en CSV" pour télécharger les informations des Pokémon sélectionnés au format CSV.</li>
</ul>

## Structure du projet

<ul>
  <li><code>app/controllers/pokemons_controller.rb</code> : Contrôleur principal pour gérer les actions liées aux Pokémon.</li>
  <li><code>app/views/pokemons/index.html.erb</code> : Vue principale pour afficher la liste des Pokémon et la barre de recherche.</li>
  <li><code>app/javascript/pokemons.js</code> : Fichier JavaScript pour gérer la recherche et les suggestions en temps réel.</li>
  <li><code>app/assets/stylesheets/pokemons.css</code> : Fichier CSS pour le style personnalisé de l'application.</li>
</ul>


## Contribuer

<p>Desitter Florian</p>

## Licence

<p>Ce projet est réalisé pour Hop3team <3 </p>
