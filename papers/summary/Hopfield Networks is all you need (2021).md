### Generalized Hopfield Networks: On a Model of Associative Memory with Huge Storage Capacity (2017)

[Paper](https://arxiv.org/pdf/2008.02217.pdf)

1. **Réseaux de Hopfield Modernes** :
   - Les auteurs introduisent un réseau de Hopfield moderne avec des états continus.
   - Ce nouveau réseau de Hopfield peut stocker exponentiellement (avec la dimension de l'espace associatif) de nombreux motifs, récupérer le motif avec une mise à jour et avoir des erreurs de récupération exponentiellement petites.
   - La nouvelle règle de mise à jour est équivalente au mécanisme d'attention utilisé dans les transformateurs.

2. **Différences par rapport aux réseaux de Hopfield traditionnels** :
   - Les réseaux de Hopfield traditionnels étaient introduits comme des mémoires associatives pouvant stocker et récupérer des motifs binaires.
   - Les réseaux de Hopfield modernes, également appelés modèles "dense associative memory" (DAM), utilisent une fonction énergétique avec des fonctions d'interaction de la forme $F(x) = x^n$, permettant une capacité de stockage proportionnelle à $d^{n-1}$, où $d$ est la dimension de l'espace.
   - Les auteurs généralisent la fonction énergétique des réseaux de Hopfield modernes pour des états continus tout en conservant les propriétés des réseaux de Hopfield modernes, comme la capacité de stockage exponentielle et la convergence extrêmement rapide.

3. **Mise à jour et Attention** :
   - La règle de mise à jour du réseau de Hopfield est le mécanisme d'attention utilisé dans les modèles de transformateurs.
   - Cette règle de mise à jour converge globalement, et la distance du nouveau point à un point fixe après une mise à jour est exponentiellement petite par rapport à la séparation entre les motifs.

4. **Capacité de stockage** :
   - Pour des motifs choisis aléatoirement, le nombre de motifs qui peuvent être stockés est exponentiel par rapport à la dimension $d$ de l'espace des motifs.
   - Plus précisément, le nombre de motifs aléatoires qui peuvent être stockés est donné par $N \geq \frac{p d^{1/4}}{c}$, où $c$ est une constante.

5. **Applications en Deep Learning** :
   - Les réseaux de Hopfield modernes peuvent être intégrés comme une nouvelle couche dans les architectures de deep learning pour le pooling, la mémoire, l'apprentissage de prototypes et l'attention.
   - Les auteurs démontrent l'applicabilité de ces couches de Hopfield à travers différents domaines et jeux de données.

6. **Limitations** :
   - Bien que les réseaux de Hopfield modernes présentent de nombreux avantages, ils ont également des limites. Par exemple, s'ils ne sont pas bien séparés des autres motifs, l'itération converge vers un point fixe global proche de la moyenne arithmétique des vecteurs.

En conclusion, ce papier présente une version moderne et continue des réseaux de Hopfield, offrant une capacité de stockage exponentielle et une convergence rapide. Ces réseaux peuvent être intégrés dans des architectures de deep learning, offrant de nouvelles possibilités pour le stockage d'informations et l'attention.

