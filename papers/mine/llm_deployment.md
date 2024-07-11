# Papier déploiement LLM

## Abstract

Depuis la sortie de ChatGPT en novembre 2023, les modèles de langage de grande taille (LLM) ont connu un succès considérable, y compris dans la communauté open-source, avec de nombreux modèles open-weight disponibles. Toutefois, les besoins nécessaires pour déployer un tel service sont souvent méconnus et difficiles à évaluer à l'avance.

Pour faciliter cette démarche, nous avons mené de nombreux tests au Centre Inria de l'Université de Bordeaux. Dans cet article, nous proposons une comparaison des performances de plusieurs modèles de tailles différentes (principalement Mistral et LLaMa) en fonction des GPU disponibles, en utilisant vLLM, une bibliothèque Python permettant d'optimiser l'inférence de ces modèles.

Nos résultats fournissent des informations précieuses pour les groupes privés et publics souhaitant déployer des LLM, en leur permettant d'évaluer les performances des différents modèles en fonction de leur matériel disponible. Cette étude contribue ainsi à faciliter l'adoption et l'utilisation de ces modèles de langage de grande taille dans divers domaines d'application.

## Introduction

Suite à la sortie de ChatGPT par OpenAI en novembre 2023, les modèles de langage de grande taille (LLM) ont suscité un vif intérêt dans le secteur privé, avec de nombreuses entreprises cherchant à offrir des services basés sur ces modèles. Cependant, l'entraînement et l'inférence de tels modèles reste inaccessible pour le grand public, nécessitant une puissance de calcul et des quantités de données de haute qualité considérables. Par exemple, Meta AI a acquis 350 000 GPU NVIDIA H100 en janvier 2024, pour un coût estimé à 9 milliards de dollars, spécifiquement pour l'entraînement de LLM. Leur entrainement de LLaMa-3 ayant été effectué sur 14*10^12 tokens.

Certaines entreprises pionnières ont rapidement compris qu'elles pouvaient bénéficier d'un monopole grâce à cette avancée technologique, leur conférant ainsi un pouvoir décisionnel sans précédent. Pour s'assurer de conserver ce monopole, ces entreprises militent désormais auprès des gouvernements pour la régulation de ces modèles, prétextant les risques et les dangers potentiels de leur utilisation à des fins malveillantes. Elles proposent des mesures allant de l'interdiction d'entraîner des modèles au-delà d'une certaine puissance de calcul jusqu'au contrôle des GPU par les gouvernements, avec possibilité de désactivation à distance. [REF openAI]

Toutefois, il est essentiel que ces outils ne soient pas uniquement entre les mains de quelques puissants acteurs, capables d'influencer les biais de leurs modèles qu'il distribue à grande échelle, leur permettant ainsi une influence de masse. La transparence de ces modèles, avec l'ouverture des données d'entraînement et des poids associés, est la solution la plus appropriée pour permettre à toute entité externe de vérifier la fiabilité et la sécurité des modèles proposés. Bien que cette approche ne soit pas appréciée par la majorité de ces entreprises, certaines d'entre elles, comme Meta et Mistral, investissent considérablement dans les modèles open-weights, en distribuant gratuitement des variantes de leurs modèles LlaMa et Mistral.

Grâce à ces efforts, de nombreux groupes, publics et privés, sont désormais en mesure de déployer des modèles puissants, assurant ainsi la souveraineté de leurs données et évitant la concentration de cette richesse et de ce potentiel de pouvoir en un seul point. Mais, quand bien même ces modèles sont disponibles pour tous, il n'est pas aisé de les déployer ni d'estimer les ressources nécessaires pour le faire. Car s'il est simple de servir un modèle à un utilisateur, il est bien plus complexe de le déployer pour des dizaines, centaines voire milliers d'utilisateurs en simultanés. Dans ce contexte, nous avons mené plusieurs tests dans le centre Inria de l'université de Bordeaux concernant le déploiement de tels modèles. 

## Objectifs

L'objectif principal de notre étude est de répondre aux préoccupations de sécurité et de confidentialité soulevées par l'utilisation croissante de solutions propriétaires de LLM - telles que ChatGPT - par les étudiants et les chercheurs du centre Inria de l'Université de Bordeaux. En effet, plus de 90 % des étudiants [REF] utilisent ces outils pour les aider dans leur travail quotidien, que ce soit pour la rédaction, la programmation, la relecture d'articles ou le brainstorming.

Cependant, l'utilisation de ces solutions propriétaires pose de sérieux problèmes de sécurité et de confidentialité. Elles ne garantissent pas la confidentialité des données et les intérêts privés qu'il y a derrière peuvent potentiellement les utiliser à des fins commerciales, d'entraînement ou même d'espionnage industriel. Ce dernier point est particulièrement préoccupant pour un centre de recherche comme l'Inria, qui doit garantir la confidentialité des travaux de recherche de ses employés et qui est en concurrence directe avec les entreprises proposant ces solutions propriétaires.

Il est donc crucial pour Inria de proposer des solutions alternatives et de préserver sa souveraineté numérique. De plus, compte tenu de l'importance croissante de cette technologie, de plus en plus de chercheurs et d'étudiants souhaitent réaliser des expériences basées sur les LLM. Par exemple, la mise en place de systèmes RAG (Retrieval Augmented Generation) est une application courante dans le monde de l'entreprise, qui consiste à utiliser un LLM pour "discuter" avec ses données. Il serait donc intéressant de leur proposer un service adapté.

## Prérequis

### Compétences

Pour déployer un LLM sur GPU, certaines connaissances et compétences sont requises dans le développement en Linux et Python, ainsi qu'une forte curiosité pour les modèles existants et la quantification. Bien que la compréhension du fonctionnement interne des Transformers ne soit pas nécessaire, elle peut être un atout.

Les compétences requises incluent la capacité à mettre à jour les pilotes CUDA (version 12 minimum), à installer une version de Python (minimum 3.9), à installer des dépendances Python, à effectuer des requêtes HTTP et à choisir le bon modèle pour votre cas d'utilisation, quantifié ou non en fonction de vos ressources.

### Matériel

Nous avons effectué nos tests sur le serveur de calcul Plafrim, équipé de deux types de GPU :

* NVIDIA V100 16 Go
* NVIDIA A100 40 Go

### Logiciel

Nous avons utilisé vLLM, une bibliothèque Python conçue pour optimiser l'inférence de ces modèles. Cette bibliothèque nécessite au minimum l'installation préalable de Python 3.9 et de CUDA 12.

L'avantage de vLLM par rapport à d'autres solutions réside dans sa capacité à traiter plusieurs requêtes simultanément, sans file d'attente et sans augmentation linéaire du temps de calcul en fonction du nombre de requêtes, mais plutôt logarithmique.

Cependant, en fonction du matériel disponible, d'autres solutions peuvent être envisagées. Nous pouvons notamment mentionner tensorRT-LLM, qui offre d'excellentes performances avec des GPU NVIDIA, et lllama.cpp, qui présente des performances remarquables sur les Mac équipés de puces M1, M2 ou M3.

### Quantification

Certains modèles peuvent être très volumineux, ce qui rend leur chargement dans le matériel disponible - limité par sa VRAM - particulièrement difficile.

Pour pallier ce problème, l'une des meilleures solutions consiste à quantifier nos modèles. Au lieu d'écrire les valeurs de nos poids sur 16 ou 32 bits, nous pouvons accepter une légère perte de précision et les écrire sur 4 ou 8 bits.

Cette perte a été évaluée à plusieurs reprises, et bien qu'elle varie en fonction des modèles et des méthodes de quantification utilisées, nous pouvons affirmer qu'elle est négligeable jusqu'à 6 bits et acceptable jusqu'à 4 bits. Toutefois, pour un nombre de paramètres supérieur à 70 milliards, les modèles sont suffisamment robustes pour permettre une quantification inférieure à 4 bits tout en conservant une bonne cohérence.

Parmi les différentes méthodes de quantification, nous pouvons citer AWQ, GPTQ et GGUF (llama.cpp).

## Expérience

## Expérimentation

Dans cette étude, nous cherchons à déterminer la charge maximale de requêtes simultanées qu'un serveur équipé de GPU V100 16 Go ou A100 40 Go peut supporter, en fonction du LLM utilisé. Pour cela, nous avons effectué des tests en augmentant progressivement le nombre de requêtes simultanées et la taille des prompts, jusqu'à atteindre la charge maximale. Pour chaque modèle et GPU, nous avons mesuré la charge mémoire, la vitesse d'exécution et le nombre de tokens par seconde en fonction du nombre de requêtes simultanées et de la taille maximale du contexte.

Nous avons choisi de nous concentrer principalement sur les modèles proposés par Mistral AI, en raison de leur diversité, popularité et compétences. Nous apprécions également leur performance sur les langues européennes, en particulier le français. De plus, leur architecture Mixture of Experts [REF] permet une économie de calcul pendant l'inférence, en ne sélectionnant qu'une partie des poids du modèle à chaque étape, ce qui réduit également la consommation d'énergie.

En outre, nous avons inclus le modèle LLaMa-3-70B de Meta, qui obtient des performances comparables à celles de GPT-4 avec ses 70 milliards de paramètres. Cette taille de modèle semble être un bon compromis entre taille et performance, ce qui justifie son inclusion dans notre étude.

Ainsi, nous avons testé les modèles suivants :

* Mistral-7B
* Mixtral-8x7b
* Mixtral-8x22b
* Codestral-22b
* LLaMa-3-70B

## Resultats
- charge mémoire
- vitesse éxécution, token/s, nb utilisateur simultannée
- taille max context

## Discussions & perpectives

Mistral-7b (V100 vs A100)
Mixtral-8x7b (2 GPU A100 40G)
Mixtral-8x22b (4 GPU A100 40G)
Codestral-22b (2 V100 vs A100 vs Q4 1 V100)
Un modèle 70b (LLama3, Qwen2 ?)





### Mixtral 8x22B (Q8 ou Q4 ?) : 4 GPU A100 40G
![](https://notes.inria.fr/uploads/upload_d480f98200318d8f278552de6c07aca6.png)
![](https://notes.inria.fr/uploads/upload_34226aa139d0a16a5559dec0979aa156.png)
![](https://notes.inria.fr/uploads/upload_b05b0be02b5357a9a348e27fc7240f57.png)



## References

- [From Local to Global: A Graph RAG Approach to Query-Focused Summarization](https://arxiv.org/pdf/2404.16130)

- [Retrieval-Augmented Generation for Knowledge-Intensive NLP Tasks](https://arxiv.org/pdf/2005.11401)

- [GPT-4 Technical Report](https://arxiv.org/pdf/2303.08774)

- [Mixtral of experts](https://arxiv.org/abs/2401.04088)

- [Mistral 7B](https://arxiv.org/pdf/2310.06825)

- [LLaMA: Open and Efficient Foundation Language Models](https://arxiv.org/pdf/2302.13971)

- [A Survey of Large Language Models](https://arxiv.org/pdf/2303.18223)

- [Efficient Memory Management for Large Language Model Serving with PagedAttention](https://arxiv.org/pdf/2309.06180)

- [AWQ: Activation-aware Weight Quantization for LLM Compression and Acceleration](https://arxiv.org/pdf/2306.00978)

- [Benchmarking Emerging Deep Learning Quantization Methods for Energy Efficiency](https://tusharma.in/preprints/Greens2024.pdf)

- [GPTQ: Accurate Post-Training Quantization for Generative Pre-trained Transformers](https://arxiv.org/pdf/2210.17323)

