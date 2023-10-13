### Attention is all you need (2017)

[Paper](https://arxiv.org/pdf/1706.03762.pdf)

1. **Introduction du Transformer** :
    - Présentation d'une nouvelle architecture appelée "Transformer", qui repose entièrement sur des mécanismes d'attention, éliminant le besoin de réseaux de neurones récurrents ou convolutifs.
2. **Attention Multi-Têtes** :
    - Le Transformer utilise un mécanisme d'attention multi-têtes, permettant au modèle de se concentrer simultanément sur différentes parties d'une séquence.
    - Cela améliore la capacité du modèle à traiter des dépendances à longue distance.
3. **Positional Encoding** :
    - Les Transformers n'ont pas de notion d'ordre inhérente. Pour pallier cela, un "positional encoding" est ajouté aux embeddings pour donner une notion de position aux tokens.
    - Utilisation des fonctions sinus et cosinus pour cet encodage, garantissant la capacité du modèle à extrapoler à des séquences de longueurs différentes.
4. **Architecture Encodeur-Décodeur** :
    - Le Transformer est composé de deux parties : l'encodeur (qui traite l'entrée) et le décodeur (qui génère la sortie).
    - Chaque partie est composée de plusieurs couches identiques, chacune ayant des mécanismes d'attention et des réseaux feed-forward.
5. **Efficacité et Performance** :
    - L'architecture Transformer a montré une efficacité accrue en terme de temps de formation et a établi de nouveaux standards de performance sur plusieurs tâches de traitement du langage naturel.
6. **Influence sur les Modèles Ultérieurs** :
    - Le Transformer a servi de base à de nombreux modèles ultérieurs, tels que BERT et GPT, qui ont dominé le domaine du traitement du langage naturel.

![Mécanisme de l'Attention](../schema/attention%20mecanism.png)