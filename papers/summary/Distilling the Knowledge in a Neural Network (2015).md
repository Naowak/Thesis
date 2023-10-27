### Distilling the Knowledge in a Neural Network (2015)

[Paper](https://arxiv.org/pdf/1503.02531.pdf)

Le papier intitulé "Distilling the Knowledge in a Neural Network" explore une méthode pour améliorer la performance des modèles de machine learning en transférant les connaissances d'un modèle "lourd" à un modèle "léger" (ou distillé). Voici les points clés du papier :

- **Idée Principale** : L'approche est basée sur la notion de "distillation", où le modèle lourd (qui pourrait être un ensemble de modèles) est utilisé pour produire des cibles "douces" (soft targets) pour le modèle léger. Ces cibles douces contiennent plus d'informations que les cibles "dures" (hard targets) traditionnelles, car elles reflètent la distribution des probabilités données par le modèle "lourd" sur toutes les classes, et pas seulement la classe la plus probable. Ce sont des cibles plus riches en informations : elles prennent en compte la proximité entre les classes apprises par le modèle "lourd".

- **Soft Targets** : Les soft targets sont obtenus en ajustant la température $ T $ dans la fonction softmax du modèle lourd. La formule de softmax modifiée est donnée par $ \frac{e^{\frac{z_i}{T}}}{\sum_j e^{\frac{z_j}{T}}} $, où $ z_i $ est le logit pour la classe $ i $. En utilisant une température $ T $ supérieure à 1, la distribution des probabilités devient plus "douce", c'est-à-dire que les probabilités sont moins concentrées sur la classe la plus probable. Lors de l'entraînement du modèle léger, cette même température $ T $ est utilisée pour correspondre à ces soft targets.

- **Fonction d'erreur** : Lors de l'entraînement du modèle distillé, une somme pondérée de deux fonctions objectif est utilisée : la première est la cross-entropy avec les soft targets, et la seconde est la cross-entropy avec les hard targets (vraies étiquettes). Le poids de la première fonction est supérieur à celui de la seconde. Cela permet de donner plus d'importance aux soft targets.

- **Résultats** : Les expériences montrent que cette méthode de distillation permet d'obtenir des modèles légers qui se rapprochent des performances des modèles lourds.
