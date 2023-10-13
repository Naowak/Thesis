### Code Llama: Open Foundation Models for Code (2023)

[Paper](https://arxiv.org/pdf/2308.12950.pdf)

1. **Introduction de Code Llama** :
    - Présentation de "Code Llama", un modèle de langage de grande taille, spécialisé dans la génération et la compréhension du code source.
2. **Entraînement sur des Données Diversifiées** :
    - Code Llama est entraîné sur un mélange de données textuelles et de code source, couvrant une variété de langages de programmation et de domaines.
    - **Données Propres** : Utilisation du jeu de données d'instruction pour Llama 2, appelé "RLHF V5". Ce jeu de données combine des milliers d'exemples de fine-tuning supervisé et des millions d'exemples de Rejection Sampling.
    - **Composition des Données** : Les données d'entraînement de Code Llama se composent de 85% de code, 8% de langage naturel lié au code et 7% de langage naturel général.
3. **Fine-Tuning et Adaptabilité** :
    - Le modèle "Code Llama Python" est une version fine-tunée de Code Llama, spécifiquement optimisée pour le langage Python.
    - **Fine-Tuning sur Long Context** : Code Llama est également fine-tuné pour traiter des séquences longues allant jusqu'à 16 384 tokens.
4. **Techniques Innovantes** :
    - Utilisation de techniques d'inférence pour passer de modèles de 4096 tokens à des modèles de 16,384 tokens et même 100k tokens.
5. **Performances** :
    - Code Llama est évalué sur plusieurs benchmarks, notamment HumanEval, MBPP, et APPS, ainsi qu'une version multilingue de HumanEval (MultiPL-E).
    - Sur le benchmark TruthfulQA, après fine-tuning, Code Llama - Instruct montre une amélioration significative en termes de véracité et de toxicité.
6. **Empreinte Carbone** :
    - La formation de tous les modèles Code Llama a nécessité 400 000 heures-GPU. Les émissions totales étaient de 65,3 tCO2eq.