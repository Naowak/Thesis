### Reservoir Transformers (2021)

[Paper](https://arxiv.org/pdf/2012.15045.pdf)

Le papier "Reservoir Transformers" explore l'efficacité des modèles transformers lorsque certaines de leurs couches sont initialisées de manière aléatoire et ne sont jamais mises à jour pendant l'entraînement. Les auteurs sont inspirés par des idées bien établies en apprentissage automatique et introduisent une variété de couches "réservoir" non linéaires intercalées avec des couches transformers régulières. Ils montrent que cette approche peut améliorer le temps de calcul jusqu'à la convergence, ainsi que la performance globale sur diverses tâches de traduction automatique et de modélisation du langage (masquée).

**Points clés**:

1. **Motivation**: Les transformers ont dominé le traitement du langage naturel ces dernières années. Cependant, leur succès nécessite une augmentation constante des ressources de calcul, ce qui a conduit à un intérêt accru pour améliorer leur efficacité.

2. **Idée principale**: Les auteurs explorent si, en gelant certaines couches du transformer (c'est-à-dire en ne les mettant jamais à jour après une initialisation aléatoire), ils peuvent égaler ou surpasser les performances des transformers entièrement entraînés tout en étant plus efficaces. Ils découvrent que non seulement cela est possible, mais que le gel de certaines couches peut en fait améliorer les performances.

3. **Couches Réservoir**: Ces couches sont des transformations non linéaires à haute dimension qui sont fixées après leur initialisation. Elles peuvent être considérées comme des "réservoirs" qui fournissent une représentation à un réseau de "lecture" plus léger. Les auteurs expérimentent avec différents types de couches réservoir, notamment des couches transformers, FFN, BiGRU et CNN.

4. **Résultats principaux**: 
   - Les transformers avec des couches réservoir montrent des améliorations dans le temps de calcul jusqu'à la convergence.
   - L'ajout de couches réservoir conduit à une meilleure généralisation sur l'ensemble de test pour diverses tâches.
   - Les architectures de modélisation du langage masqué pré-entraînées, comme BERT et RoBERTa, peuvent bénéficier de couches gelées, à la fois pendant la pré-formation et lors de la fine-tuning pour des tâches spécifiques.
   - Les auteurs introduisent également une métrique, l'aire sous la courbe de convergence (AUCC), pour mesurer les compromis entre performance et efficacité.

5. **Conclusion**: Ce travail met en évidence le potentiel des transformers avec des couches réservoir pour améliorer l'efficacité sans sacrifier les performances. Il offre également de nouvelles perspectives sur la compréhension des capacités des transformers et suggère que certaines de leurs couches peuvent rester aléatoires et fixes sans nuire à leur efficacité.

Ce papier offre une perspective intéressante sur la manière dont les transformers peuvent être optimisés pour la performance tout en réduisant les besoins en ressources de calcul.