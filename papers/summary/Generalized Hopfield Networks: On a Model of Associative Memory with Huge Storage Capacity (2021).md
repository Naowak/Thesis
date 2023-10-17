### Generalized Hopfield Networks: On a Model of Associative Memory with Huge Storage Capacity (2021)

[Paper](https://arxiv.org/pdf/1702.01929.pdf)

### Hopfield Networks :
- **Objectif** : Les réseaux de Hopfield ont été conçus pour stocker des chaînes de bits.
- **Architecture** : 
  - Basé sur N neurones, chacun pouvant prendre les valeurs +1 ou -1.
  - Chaque paire de ces neurones est connectée et interagit.
  - La force d'interaction entre deux neurones i et j est donnée par l'efficacité synaptique : $J_{ij} = \sum_{\mu=1}^{M} \xi_{i}^{\mu} \xi_{j}^{\mu}$ où $\xi$ représente les motifs ou images stockés.
  - La dynamique ou la règle de mise à jour est définie par $T_{i}(\sigma) = sgn(\sum_{j=1}^{N} J_{ij} \sigma_{j})$.

### Capacité de stockage :
- Dans le modèle Hopfield standard, il a été montré que le modèle peut stocker $M = C \frac{N}{\log(N)}$ motifs avec $C < \frac{1}{2}$, si on exige qu'un motif fixe soit stable.
- Des calculs non rigoureux suggèrent qu'on pourrait même atteindre une capacité de $M = \alpha N$ si on tolère une petite fraction d'erreurs dans la récupération, avec $\alpha < 0.138$.

### Modèle généralisé de Hopfield :
- Krotov et Hopfield ont suggéré une version généralisée du modèle Hopfield où ils remplacent la dynamique de mise à jour par une plus générale.
- Dans cette version, ils considèrent une fonction d'interaction polynomiale et affirment que cela augmente la capacité de stockage du modèle.
- L'interaction est donnée par une fonction $F(x)$ qui peut être polynomiale ou même exponentielle.
- Le cas de $ F(x) = x^{2} $ réduit au modèle Hopfield standard.
- La nouvelle dynamique de mise à jour est donnée par  
$ T_{i}(\sigma) = sgn(\sum_{\mu=1}^{M} (F(1.\xi_{i}^{\mu} + \sum_{j!=i} \xi_{j}^{\mu} \sigma_{j} ) - F(-1.\xi_i^\mu + \sum_{i!=j} \xi_j^\mu \sigma_j))) $.

### Principaux résultats :
- Avec une interaction polynomiale, le modèle peut stocker jusqu'à $ M = \alpha_{n} N^{n-1} $ motifs si de petites erreurs dans la récupération sont tolérées.
- Avec une interaction exponentielle $ F(x) = e^{x} $, le modèle peut stocker $ M = exp(\alpha d) + 1 $ motifs, où chaque motif est un point fixe de la dynamique avec une probabilité convergeant vers 1.

### Conclusion :
Le papier démontre que le modèle généralisé de Hopfield, avec une interaction exponentielle, peut avoir une capacité de stockage exponentielle en fonction du nombre de neurones. Cela signifie que le modèle peut stocker une quantité énorme de motifs tout en ayant des bassins d'attraction presque aussi grands que dans le modèle Hopfield standard.

J'espère que cela vous donne une vue d'ensemble claire du papier et des Hopfield Networks. Si vous avez d'autres questions ou souhaitez des éclaircissements sur des points spécifiques, n'hésitez pas à demander !

