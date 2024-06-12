# 12/06/2024

## Evo-topo (feat Naomi)

On a enfin obtenu des résultats intéressant ! 

Concrètement, nous avons rencontrer le problème suivant : faire partir la population d'individus composés 1 seul neurone est problématique car les hyper-prapmètre que l'on utilise pour entrainer le réservoir sont optimiser pour des réservoirs de 50 ou 500 neurones. Ainsi, les individus composés d'un seul neurone ne sont pas capable de tirer partie de ces hyper-paramètres.

Pour contrer ceci, deux possibilités : inclure les HP du reservoir (LR, IS, etc) dans l'algo gen (mais computation bien plus longue, sachant que ça prends déjà beaucoup de temps de faire évoluer le reservoir sur plusieurs generation)
Sinon, on peut aussi commencer avec une population aléatoire d'individus composés de 50 neurones, pour lequel l'ont connait déjà un set d'HP optimisé, et lancé l'évolution là dessus. 

Nous avons fait la seconde option. Et nous obtenons plusieurs topologie différentes atteignant des performances proches des 80% de réussite. Seulement, pour l'instant nous avons ressortie deux topologes qui sortent du lot :

Une première qui ressemble à celle-ci : où un neurone est connecté à quasiment tous les autres neurones du réservoir (une forme de neurone central) :

![Central-neuron](./picture-2024-06-12/one_best-79.2.png)

Une seconde très particulière, où **les neurones de la matrice W ne sont pas connectés entre eux !**. On a d'abord cru à un bug, car sans connexion il est difficile pour le réseau d'obtenir une mémoire. Seulement, il semblerait que ceci ne soit pas un bug, mais une solution particulière adapté à notre tâche particulière.

Pour rappel, la tâche est la suivante :

Deux stimulis parmis quatre sont choisi de manire aléatoire, et apparaissant dans 2 positions aléatoires sur 4 et dans un ordre aléatoire sur 30 pas de temps.
Ainsi, le réseau va recevoir quasiment que des zéro, et un 1 pour chaque stimuli lorsqu'il apparait. 
Chaque stimuli a sa propre récompense associé, le but du zéro est de prédire quel stimuli parmis ceux vu lui apporte le plus de point. Il doit donc être capable de mémoriser le premier stimuli pour le comparer au second.

Or, sans connexion dans la matrice W, on pourraait d'attendre à ce que le réseau ne soit pas capable de mémoriser le premier stimuli pour le comparer au second. Seulement, il semblerait que le réseau ait trouvé une solution alternative grâce à son Leaking Rate qui est très faible (0.1). 

Ainsi, les neurones peuvent être vu comme des "potentiels" à charger. Lorsqu'un stimuli apparait, les neurones qui y sont connecté par la matrice W_in stocke la valeur reçu, puis la relache très lentement, perdant à chaquye pas de temps 90% de l'information stocké. Ainsi, lorsque le second stimuli apparait, les neurones qui ont stocké l'information du premier stimuli sont encore légèrement chargé, et peuvent donc comparer les deux stimuli.

Un prochain travail visant à identifier quels neurones sont connectés à l'entrée (W_in) et au readout (W_out) pourrait nous permettre de mieux comprendre ce qui se passe dans ce réseau. Et de mieux comprendre les choix des connexions que fait l'algo gen.


## ForwardAnarchistUnits

MAJ : ajout d'un feedback et possibilités de configurer les dimensions des entrées, sorties, et unités d'attention à souhait.
Pour le feedback, j'ai été obligé de proposer un teacher comme dans réservoirPy: vu qu'on entraine d'abord le réservoir puis le readout, on ne peut connaitre à l'avance les vaeurs que le readout donnera au reservoir en feedback : pour ce faire on utilise un tacher (c'est en réalité la sortie attendu par le readout que l'on utilise, donc le Y d'entrainement). Mais ça marche pas super, probablement parce qu'il y au écart entre le feedback réel une fois étrainé et le teacher. 

J'ai ensuite testé le modèle sur d'autres données : données météorologie et sequential mnist. 

Sur sequential mnist, le but est de donner au modèle chacun des 784 pixels de l'image un par un et de lui demander de prédire le chiffre de l'image (et donc de classifier l'image). Mes résultats sont assez triste, j'obtiens 11% de réussite, là où l'aléatoire en donnerait 10%. Cependant, avec une recherche d'HP ces performances pourrait monter, mais c'est très long à mettre en oeuvre. On peut notamment voir qu'un reservoir de 200 neuronnes, une fois ses HP optimisés, arrive à 40% de réussite.

A propos de la météo, j'ai chopé le dataset ici : https://www.kaggle.com/datasets/muthuj7/weather-dataset
j'ai donc récupéré toutes les colonnes numériques (columns = [
    'Temperature (C)', 
    'Humidity', 
    'Wind Speed (km/h)', 
    'Wind Bearing (degrees)', 
    'Visibility (km)', 
    'Pressure (millibars)'
]) et j'ai essayé de prédire chacune de ces colonnes au temps t+1 à partir du temps t et précédents. Le modèle reçoit en entrée un vecteurs de 6 dimensiosn  et doit prédire les 6 dimensions suivantes.

Et les résultats sont intéressants, mais présente un problme majeur : il y a un temps de retard. Ce qui est quand même problématique lorsque l'on cherche à prédire t+1 à partir de t, car on prédit t à partir de t, et c'est pas très ouf quoi.

On peut d'ailleurs le vérifier en calculer la MSE de nos préditions avec X et Y, et on observe que Mean Squared Error avec Y est de 0.0134 alors que Mean Squared Error avec X est de: 0.0053. 

Ca se vérifie avec ces plots :

![]()
![]()
![]()
![]()

Bref, petite déception. Mais, lorsque l'on compare avec ce qu'un lstm est capable de faire sur ces mêmes données météorologique, on relativise un peu vu que la MSE que l'on obtient est de MSE : 0.05827055498957634 et que les plots ressemblent à ceci :

![]()
![]()
![]()
![]()
![]()

(A noté qu'on avait près de 2.5 fois plus de paramètres pour le lstm que pour notre modèle.)

Dans ce cas spécifique, il semblerait que nous soyons gagnant, mais dans l'ensemble de pense que le lstm est plus polyvalent. J'ai effet réussi à obtenir des résultats quasiment parfait sur nos sinus/cosinus avec un lstm :

![]()

MSE : 0.009248577989637852

Et d'autres personnes ont déjà évaluer les LSTM classique avec la tâche séquentialMNIST et obtienne 98% de réussite.


Ainsi, notre modèle semble avoir réussi à battre le LSTM dans un cas de figure très particulier : des données météorologiques (chaotiques). Même s'il est a noté que nos prédictions se rapproche plus de l'entrée que de la sortie attendu. Il semblerait donc qu'il y ait tout de même quelques bonnes idées dans notre méthode, sinon nous n'aurions probabklement zéro résultats.

Or, la méthode d'apprentissage utilisé (en deux temps) est un peu particulière, et probablement sous-optimale. L'achirecture de notre réseau lui semble intéressant, avec des blocks d'attentions relié de manière récurrente et une couche de sortie qui se connecte à tous les blocks d'attention.

A l'avenir, peut-être serait il intéressant de tester de l'entrainer avec une full-backpropagation.


## RecurentAttentionNetwork

Avec le projet RecurrentAttentionNetwork, nous allons essayer de répondre à la problmétique suivante: conserver la précédente architecture et reprendre un système d'apprentissage plus classique : la back-prop. 

Le schéma de ce modèle ressemble donc quasiment à celui que nous avions prédécemment, exepté que notre readout est maintenant un layer dense classique, qui propage son erreur aux blocks d'attentions.

![]()

Etant donné que nous allons faire face au problème du vanishing gradient, nous allons utiliser la Backpropagtion Througt Time (BPTT) pour entrainer notre modèle, et nous allons utiliser un paramètre pour définir le nombre d'étape maximum pour lequel nous calculerons le gradient. Ainsi, selon ce paramètre, nous entrainerons notre modèle réccurent a avoir de grande dépendance temporelle ou non. 

## Présentation réunion d'équipe

Lors de cette réunion j'ai tenté un nouveau format plus "débat". L'idée étant de proposer (sans trop de préparation) un sujet qui me semble intéressant et de laisser les autres membres de l'équipe réagir. Ici, le sujet choisi a été le projet que j'ai mené il y a un an : BattleFieldAgents, où des agents GPT4 devait coopérer entre eux dans un jeu vidéo pour atteindre la victoire.  

Je suis très satisfait du déroulement de cette réunion, j'ai eu l'impression d'avoir réussi à capter l'intérêt des gens et que les débats était assez animé. J'espère que nous pourrons renouveler ce format à l'avenir.

## Summerschool

J'ai été admis à ILCB et je suis actuellement dans les process pour confirmer mon inscription.


## Papers

- [TransformerFAM Feedback attention is working memory (2024)](https://arxiv.org/pdf/2404.09173)

Le papier présente TransformerFAM, une nouvelle architecture de Transformer qui permet à l'attention de s'appliquer à la fois aux données homogènes et aux représentations latentes via une boucle de rétroaction. Cette modification de l'architecture favorise naturellement l'émergence de la mémoire de travail au sein des Transformers. Pendant l'inférence, TransformerFAM a une complexité computationnelle de O(L) et une complexité mémoire de O(1), où L est la longueur des jetons traités. Les expériences montrent que TransformerFAM améliore significativement les performances des Transformers sur les tâches de long contexte, quel que soit la taille du modèle (1B, 8B, 24B).

- [Distributed Representations, Simple Recurrent Networks, and Grammatical Structure (1991)](https://link.springer.com/content/pdf/10.1007/BF00114844.pdf)

Le papier présente un réseau de neurones récurrents simples (SRN) entraîné sur des phrases multiclausales contenant des relatives clauses multiplement imbriquées. L'analyse des patterns d'activation des unités cachées révèle que le réseau résout la tâche en développant des représentations distribuées complexes qui encodent les relations grammaticales et la structure hiérarchique des constituants.




