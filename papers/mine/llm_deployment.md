# Papier déploiement LLM

## Authors

Yannis Bendi-Ouis, Centre Inria de l'Université de Bordeaux, Mnemosyne  
Dan Dutarte, Centre Inria de l'Université de Bordeaux, SED  
Xavier Hinaut, Centre Inria de l'Université de Bordeaux, Mnemosyne

## Abstract

Depuis la sortie de ChatGPT en novembre 2023, les modèles de langage de grande taille (LLM) ont connu un succès considérable, y compris dans la communauté open-source, avec de nombreux modèles open-weight disponibles. Toutefois, les besoins nécessaires pour déployer un tel service sont souvent méconnus et difficiles à évaluer à l'avance.

Pour faciliter cette démarche, nous avons mené de nombreux tests au Centre Inria de l'Université de Bordeaux. Dans cet article, nous proposons une comparaison des performances de plusieurs modèles de tailles différentes (principalement Mistral et LLaMa) en fonction des GPU disponibles, en utilisant vLLM, une bibliothèque Python permettant d'optimiser l'inférence de ces modèles.

Nos résultats fournissent des informations précieuses pour les groupes privés et publics souhaitant déployer des LLM, en leur permettant d'évaluer les performances des différents modèles en fonction de leur matériel disponible. Cette étude contribue ainsi à faciliter l'adoption et l'utilisation de ces modèles de langage de grande taille dans divers domaines d'application.

## Introduction

Suite à la sortie de ChatGPT par OpenAI en novembre 2023, les modèles de langage de grande taille (LLM) ont suscité un vif intérêt dans le secteur privé, avec de nombreuses entreprises cherchant à offrir des services basés sur ces modèles. Cependant, l'entraînement et l'inférence de tels modèles reste inaccessible pour le grand public, nécessitant une puissance de calcul et des quantités de données de haute qualité considérables. Par exemple, Meta AI a acquis 350 000 GPU NVIDIA H100 en janvier 2024, pour un coût estimé à 9 milliards de dollars, spécifiquement pour l'entraînement de LLM. Leur entrainement de LLaMa-3 ayant été effectué sur 14*10^12 tokens.

Certaines entreprises pionnières ont rapidement compris qu'elles pouvaient bénéficier d'un monopole grâce à cette avancée technologique, leur conférant ainsi un pouvoir décisionnel sans précédent. Pour s'assurer de conserver ce monopole, ces entreprises militent désormais auprès des gouvernements pour la régulation de ces modèles, prétextant les risques et les dangers potentiels de leur utilisation à des fins malveillantes. Elles proposent des mesures allant de l'interdiction d'entraîner des modèles au-delà d'une certaine puissance de calcul jusqu'au contrôle des GPU par les gouvernements, avec possibilité de désactivation à distance. [REF openAI]

Toutefois, il est essentiel que ces outils ne soient pas uniquement entre les mains de quelques puissants acteurs, capables d'influencer les biais de leurs modèles qu'il distribuent à grande échelle, leur permettant ainsi une influence de masse. La transparence de ces modèles, avec l'ouverture des données d'entraînement et des poids associés, est la solution la plus appropriée pour permettre à toute entité externe de vérifier la fiabilité et la sécurité des modèles proposés. Bien que cette approche ne soit pas appréciée par la majorité de ces entreprises, certaines d'entre elles, comme Meta et Mistral, investissent considérablement dans les modèles open-weights, en distribuant gratuitement des variantes de leurs modèles LlaMa et Mistral.

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

### Codestral 22B GPTQ 8-bit on 2 V100 16 Go

| Request codestral GPTQ 8bits 2V100 \ Size	31	63	119	296	480	822	2193 |  
|---|---|---|---|---|---|---|---|  
| 1	| 2,3	| 2,3	| 2,4	| 2,4	| 2,5	| 2,6	| 2,8 |  
| 2	| 2,3	| 2,3	| 2,4	| 2,5	| 2,6	| 2,7	| 3,3 |  
1	3,1	3,2	3,2	3,3	3,4	3,7	4,3
2	3,3	3,4	3,4	3,6	4	4,4	5,8
4	3,7	3,8	3,9	4,4	4,8	5,6	8,8
8	4,8	5,1	5,3	6	6,8	8,8	15
16	7,1	7,5	7,9	9,8	11,7	14,3	27,5
32	10,4	10,9	11,9	15,3	19	24,6	53,8
64	15,5	17	18,7	25,9	32,1	43,9	108,2
128	21,7	np.nan	np.nan	np.nan	np.nan	np.nan	np.nan
							
### Codestral 22B on 2 A100 40 Go
							
Request codestral 2A100 \ Size	31	63	119	296	480	822	2193
1	2,3	2,3	2,4	2,4	2,5	2,6	2,8
2	2,3	2,3	2,4	2,5	2,6	2,7	3,3
4	2,4	2,4	2,5	2,7	2,8	3,1	4,2
8	2,5	2,6	2,8	3,1	3,4	4,1	6,3
16	2,8	2,9	3,2	3,8	4,4	5,6	10,2
32	3,3	3,7	4	5,2	6,4	8,8	18,1
64	4,3	4,6	5,7	8	10,5	15,5	36,8
128	6,8	7,8	9,4	14,5	19,6	32,9	71,1

### Codestral 22B AWQ 4 bits on 1 A100 40 Go

Request codestral AWQ 1A100 \ Size	31	63	119	296	480	822	2193
1	2,3	2,3	2,4	2,5	2,6	2,6	3
2	2,3	2,4	2,5	2,7	2,7	2,8	3,5
4	2,4	2,5	2,6	2,8	3	3,4	4,8
8	2,6	2,7	2,8	3,2	3,7	4,5	7,4
16	3	3,2	3,4	4,2	5	6,4	12,3
32	4,5	4,8	5,4	6,7	8,4	11,4	23,1
64	7,9	8,5	9,3	12,3	15,8	21,6	47,7
128	14,3	15,4	17,6	24,2	29,9	46,4	96,2
							
### LLaMa-3 70B on 2 A100 40 Go

Request llama370b AWQ 2A100 \ Size	21	51	97	240	398	703	1848
1	3,6	3,7	3,7	3,9	4	4,2	4,8
2	3,7	3,7	3,9	4,1	4,2	4,5	5,8
4	3,8	4	4,1	4,4	4,7	5,4	7,9
8	4,3	4,5	4,8	5,1	5,9	7,4	12,5
16	4,9	5,2	5,7	6,9	8,3	10,8	21,4
32	7,6	8,2	8,7	11,1	13,7	19,6	40,9
64	12,9	13,9	15,2	20,3	25,8	37,5	np.nan
128	23,2	np.nan	np.nan	np.nan	np.nan	np.nan	np.nan

### Mistral 7B on 2 V100 16 Go

Request mistral 7B 2V100 \ Size	31	63	119	296	480	822	2193
1	1,8	1,8	1,9	1,9	1,9	2,1	2,3
2	2,1	2,1	2	2,2	2,3	2,6	2,8
4	2,2	2,3	2,1	2,6	2,5	2,8	3,7
8	2,4	2,4	2,5	2,7	3	3,5	5,9
16	2,9	2,9	3	3,8	4,2	5,2	9,2
32	4,2	4,2	4,5	5,4	6,9	8,8	19
64	6,7	7,1	7,7	9,8	11,9	17,1	36
128	10,6	10,4	11,5	16,2	24,4	33,3	72,1

### Mixtral 8x7B on 2 A100 40 Go

data_mixtral_8x7b = {
    1: [3.1, 3.2, 3.6, 3.4, 3.5, 3.5, 4.1],
    2: [3.3, 3.3, 3.5, 3.5, 3.8, 3.8, 4.7],
    4: [3.5, 3.6, 3.5, 4.3, 4.1, 4.6, 6.2],
    8: [3.8, 3.8, 4.0, 4.3, 4.9, 5.7, 9.3],
    16: [4.3, 4.6, 4.9, 6.0, 6.7, 8.5, 15.5],
    32: [6.0, 6.4, 7.6, 8.7, 10.9, 14.2, np.nan],
    64: [10.0, 10.5, 11.6, 15.5, np.nan, np.nan, np.nan],
    128: [18.5, 19.6, 21.5, np.nan, np.nan, np.nan, np.nan],
}

### Mixtral 8x22B on 4 A100 40 Go

data_wizard2_8x22b = {
    1: [6.0, 6.0, 6.3, 6.8, 7.0, 7.6, 10.9],
    2: [7.2, 7.1, 7.4, 8.4, 8.7, 10.3, 16.7],
    4: [8.0, 8.1, 8.7, 10.3, 11.9, 14.2, 21.3],
    8: [9.0, 9.4, 10.0, 13.0, 16.7, 19.4, 36.2],
    16: [11.0, 12.2, 13.2, 21.1, 26.5, 31.9, 66.4],
    32: [16.0, 17.6, 22.6, 33.6, 37.7, 56.7, np.nan],
    64: [28.0, 31.8, 35.9, 56.0, 71.7, np.nan, np.nan],
    128: [52.0, 55.3, 67.0, 111.7, np.nan, np.nan, np.nan],
}

- charge mémoire
- vitesse éxécution, token/s, nb utilisateur simultannée
- taille max context

### Mixtral 8x22B (Q8 ou Q4 ?) : 4 GPU A100 40G
![](https://notes.inria.fr/uploads/upload_d480f98200318d8f278552de6c07aca6.png)
![](https://notes.inria.fr/uploads/upload_34226aa139d0a16a5559dec0979aa156.png)
![](https://notes.inria.fr/uploads/upload_b05b0be02b5357a9a348e27fc7240f57.png)

## Discussions & perpectives

## Conclusion

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

