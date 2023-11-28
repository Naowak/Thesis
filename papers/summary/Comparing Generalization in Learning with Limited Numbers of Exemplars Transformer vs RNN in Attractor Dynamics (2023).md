### Comparing Generalization in Learning with Limited Numbers of Exemplars: Transformer vs. RNN in Attractor Dynamics (2023)

[Papier](https://arxiv.org/pdf/2311.10763.pdf)

GIL: Generalization In Learning

### Introduction
- **Importance de la GIL** : La capacité à généraliser à partir de peu d'expériences est cruciale en intelligence artificielle. Le Transformateur, malgré ses succès, repose sur des ensembles de données massifs, à l'opposé de l'apprentissage humain qui nécessite moins d'expériences.

### Résultats
- **Expérimentation** : Des modèles RNN et Transformateur ont été formés pour apprendre des dynamiques d'attracteurs (point et cyclique) avec un nombre varié de séquences de formation.
- **Observations** : Les RNN ont réussi à acquérir les dynamiques d'attracteurs avec significativement moins de données que les Transformateurs.
- **Comparaison de Performance** : Les résultats ont montré que les RNN peuvent extrapoler la structure dynamique fondamentale des attracteurs avec un nombre limité de données, contrairement aux Transformateurs qui nécessitent beaucoup plus de données pour la même tâche.

### Limitations et Perspectives
L'étude se concentre uniquement sur le modèle de Transformateur de base et suggère des recherches futures avec des modèles récemment proposés incorporant un biais inductif récurrent.
