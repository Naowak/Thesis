### BERT: Pre-training of Deep Bidirectional Transformers for Language Understanding (2019)

[Paper](https://arxiv.org/pdf/1810.04805.pdf)

1. **Introduction et Motivations** :
    - BERT est un modèle de représentation de langage qui pré-entraîne des représentations bidirectionnelles profondes à partir de textes non étiquetés en conditionnant conjointement le contexte gauche et droit à tous les niveaux.
    - Il est conçu pour être affiné avec une seule couche de sortie supplémentaire pour créer des modèles de pointe pour diverses tâches, comme la réponse aux questions et l'inférence linguistique.
    - BERT établit de nouveaux standards sur onze tâches de traitement du langage naturel, notamment en poussant le score GLUE à 80,5%, la précision MultiNLI à 86,7%, et les scores F1 sur SQuAD v1.1 et v2.0 à 93,2% et 83,1% respectivement.
2. **Architecture** :
    - BERT est basé sur l'encodeur Transformer multi-couches bidirectionnel.
    - Il utilise des embeddings WordPiece avec un vocabulaire de 30 000 tokens.
    - La représentation d'entrée est la somme des embeddings de tokens, des embeddings de segments et des embeddings de position.
    - Deux tailles principales de modèle sont utilisées : BERTBASE (L=12, H=768, A=12, 110M paramètres) et BERTLARGE (L=24, H=1024, A=16, 340M paramètres).
3. **Pré-entraînement** :
    - **Modèle de Langage Masqué (MLM)** : Certains tokens sont masqués aléatoirement et le modèle est formé pour prédire ces tokens. Cette approche permet d'obtenir une représentation bidirectionnelle profonde.
    - **Next Sentence Prediction (NSP)** : Le modèle est formé pour prédire si une phrase est la suite logique d'une autre. Cette tâche est bénéfique pour des tâches comme la réponse aux questions et l'inférence linguistique.
4. **Différenciation par rapport aux autres modèles** :
    - Contrairement à d'autres modèles comme OpenAI GPT qui utilisent des modèles de langage unidirectionnels, BERT utilise des modèles bidirectionnels pour le pré-entraînement.
    - BERT réduit le besoin d'architectures spécifiques à la tâche, surpassant de nombreuses architectures spécifiques à la tâche.
5. **Données de pré-entraînement** :
    - Le corpus de pré-entraînement comprend le BooksCorpus (800M mots) et l'anglais Wikipedia (2,500M mots).