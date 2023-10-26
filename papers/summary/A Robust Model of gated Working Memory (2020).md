### A Robust Model of gated Working Memory (2020)

[Paper](https://www.labri.fr/perso/nrougier/papers/10.1162.neco_a_01249.pdf)

Le papier intitulé "A Robust Model of Gated Working Memory" propose un modèle robuste de mémoire de travail à accès contrôlé. 

**Modèle minimal de 3 neurones** :
- Le papier présente un modèle minimal composé de trois neurones, X1, X2 et X3, qui exploitent la non-linéarité et le comportement asymptotique des unités tanh pour réaliser une mémoire de travail à accès contrôlé.
- Les opérations effectuées par ces neurones sont définies par les équations suivantes :
  - $X1[n + 1] = tanh(b V[n])$
  - $X2[n + 1] = tanh(b V[n] + a T[n])$
  - $X3[n + 1] = tanh(b M[n] + a T[n])$
  - $M[n + 1] = (X1[n + 1] - X2[n + 1] + X3[n + 1])/b$
  Où $V[n]$ est le signal d'entrée, $T[n]$ est le signal de déclenchement, $M[n]$ est la sortie, et $a$ et $b$ sont des paramètres du modèle $a = 1000, b = 0.001$.
- Le modèle est robuste contre diverses perturbations, qu'il s'agisse d'entrées, d'activités internes ou de rétroactions de sortie.
- Le modèle est également capable de mémoriser des valeurs continues ou un ensemble discret de valeurs.
- Contrairement à d'autres modèles, ce modèle considère la mémoire de travail comme un système ouvert constamment influencé par des activités externes.

**Tentative de mémoire avec un réservoir classique et comparaison** :

Le modèle basé sur un réservoir, contrairement au modèle minimal, utilise un ensemble plus large de neurones pour simuler des dynamiques complexes. Dans ce contexte, plutôt que d'avoir des neurones individuels comme X1, X2 et X3, le réservoir génère des "états" qui sont des combinaisons d'activités de plusieurs neurones. Ces états peuvent être considérés comme des représentations distribuées des neurones X1, X2 et X3 du modèle minimal. Par exemple, un certain état du réservoir pourrait correspondre à l'activité du neurone X1, tandis qu'un autre état pourrait correspondre à l'activité du neurone X3. Pour le neurone X2, qui dans le modèle minimal est défini par une sorte d'intersection entre les entrées et le signal de déclenchement, le réservoir reproduit cette dynamique en combinant les activités de plusieurs neurones. Ainsi, au lieu d'avoir une représentation discrète comme dans le modèle minimal, le modèle basé sur un réservoir utilise une représentation distribuée pour simuler les mêmes dynamiques. 
On peut noter que le reservoir a plus de difficulté a conserver sa mémoire intact au fil du temps.

**Conclusion** :

En résumé, le papier propose un modèle simple et robuste de mémoire de travail à accès contrôlé basé sur trois neurones. Ce modèle est capable de mémoriser des informations pendant une période prolongée et est robuste contre diverses perturbations. Il offre une alternative intéressante aux modèles de réservoir classiques utilisés pour la mémoire de travail.