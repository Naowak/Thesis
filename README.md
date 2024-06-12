# Thesis

## Papers

### 2024

- [Mixtral of Experts (2024)](https://arxiv.org/pdf/2401.04088.pdf)

The paper "Mixtral of Experts" introduces Mixtral 8x7B, a Sparse Mixture of Experts (SMoE) language model that outperforms traditional models like Llama 2 70B and GPT-3.5 across various benchmarks. It features an innovative architecture where each token is processed by two selected experts out of 8 per layer, enabling efficient use of 13B active parameters from a total of 47B, leading to significant performance improvements in areas such as mathematics, code generation, and multilingual tasks.

- [TransformerFAM Feedback attention is working memory (2024)](https://arxiv.org/pdf/2404.09173)

Le papier présente TransformerFAM, une nouvelle architecture de Transformer qui permet à l'attention de s'appliquer à la fois aux données homogènes et aux représentations latentes via une boucle de rétroaction. Cette modification de l'architecture favorise naturellement l'émergence de la mémoire de travail au sein des Transformers. Pendant l'inférence, TransformerFAM a une complexité computationnelle de O(L) et une complexité mémoire de O(1), où L est la longueur des jetons traités. Les expériences montrent que TransformerFAM améliore significativement les performances des Transformers sur les tâches de long contexte, quel que soit la taille du modèle (1B, 8B, 24B).

------

### 2023

- [Code Llama: Open Foundation Models for Code (2023)](https://arxiv.org/pdf/2308.12950.pdf)

"Code Llama" is a large-scale language model specialized in generating and understanding code, trained on diverse textual and coding data. The model can be fine-tuned for specific programming languages, like Python, and is optimized for long sequences.

- [RWKV : Reinventing RNNs for the Transformer Era (2023)](https://arxiv.org/pdf/2305.13048.pdf)

This paper introduces the Receptance Weighted Key Value (RWKV) model, merging Transformers' efficient parallel training with RNNs' computational efficiency. RWKV boasts linear computational complexity, offers gradient stability, and is scalable up to billions of parameters, while its limitations include its linear attention approach and its non-consideration of future words.

- [Orca: Progressive Learning from Complex Explanation Traces of GPT-4 (2023)](https://arxiv.org/pdf/2306.02707.pdf)

This paper presents the development of Orca, a 13-billion parameter model, that improves upon smaller models by mimicking the reasoning processes of Large Foundation Models (LFMs) using detailed explanation data from GPT-4. By employing "explanation tuning", Orca learns not just from query-response pairs but also from GPT-4's step-by-step reasoning.

- [Reservoir Computed based Attention Network for Few Shot Image Classification (2023)]()

*Still in review.*

This paper presents an interested architecture to implement Attention with Reservoir. Instead of training feed forwards to compute Q, K, V, they use a reservoir. But this implementation does not provide a way to reduce the quadratic cost of the attention, and do not allow the use of an RNN (cause it need to compute attention on the whole data, not just the current one).

- [Retentive Network: A Successor to Transformer for Large Language Models (2023)](https://arxiv.org/pdf/2307.08621.pdf)

[Explanation](https://medium.com/ai-fusion-labs/retentive-networks-retnet-explained-the-much-awaited-transformers-killer-is-here-6c17e3e8add8) |
[GitHub](https://github.com/Jamie-Stirling/RetNet)

RetNet is proposed as a foundational architecture for large language models, offering training parallelism, low-cost inference, and strong performance by theoretically linking recurrence and attention and introducing a retention mechanism for sequence modeling. It supports parallel, recurrent, and block-recurrent computation paradigms, with experimental results showing favorable scaling, cost-effective deployment, and efficient inference, suggesting it as a potential successor to Transformers for processing long sequences efficiently.

- [Comparing Generalization in Learning with Limited Numbers of Exemplars: Transformer vs. RNN in Attractor Dynamics (2023)](https://arxiv.org/pdf/2311.10763.pdf)

The study compares the generalization capabilities of Recurrent Neural Network (RNN) models and Transformers, revealing that RNNs outperform Transformers in learning from limited data. This finding highlights the importance of architecture choice in areas where data scarcity is a significant challenge.


- [VOYAGER An Open-Ended Embodied Agent with Large Language Models (2023)](https://arxiv.org/pdf/2305.16291.pdf)

"VOYAGER: An Open-Ended Embodied Agent with Large Language Models" explores a continuous learning agent named VOYAGER in Minecraft, utilizing GPT-4 for decision-making and coding. The study highlights VOYAGER's capabilities in object discovery, technology tree mastery, and map exploration, while also discussing its limitations and potential improvements.

- [Combining Functional and Automata Synthesis to Discover Causal Reactive Programs (2023)](https://dl.acm.org/doi/pdf/10.1145/3571249)

The paper "Combining Functional and Automata Synthesis to Discover Causal Reactive Programs" introduces a novel approach for synthesizing causal reactive programs using the Autumn programming language and the AutumnSynth algorithm. It details a methodology involving object perception, tracking, function synthesis for updates, and cause synthesis, and discusses the algorithm's applications, performance, and future research implications.

- [Evolving Reservoirs for Meta Reinforcement Learning (2023)](https://arxiv.org/abs/2312.06695) 

The paper explores how evolving reservoirs within a meta reinforcement learning framework can enhance learning and adaptation. It employs reservoir computing to encode environmental states for reinforcement learning (RL), and utilizes inner and outer loops for developmental learning and evolutionary optimization, respectively. This approach is tested across various tasks, demonstrating improved learning capabilities, particularly in environments with partial observability and tasks requiring generalization to new, unseen challenges.

- [Mixture-of-Experts Meets Instruction Tuning: A Winning Combination for Large Language Models (2023)](https://arxiv.org/pdf/2305.14705.pdf)

The paper introduces Flan-MoE, a model that effectively scales instruction-finetuned language models using Sparse Mixture of Experts (MoE) to outperform dense models in various benchmarks while significantly reducing computational costs. By focusing on instruction-finetuning, Flan-MoE demonstrates that this approach is crucial for MoE models to excel in natural language understanding, reasoning, and question answering tasks, showcasing a blend of high performance and efficiency.

- [WikiChat: Stopping the Hallucination of Large Language Model Chatbots by Few-Shot Grounding on Wikipedia (2023)](https://arxiv.org/pdf/2305.14292.pdf)

The paper presents WikiChat, a novel few-shot LLM-based chatbot that leverages live Wikipedia information to ensure factual accuracy and up-to-dateness in conversations about both popular and niche topics. It outperforms previous methods by fetching wikipedia and fact-checking its responses.

- [Large Language Models Are Zero-Shot Time Series Forecasters (2023)](https://arxiv.org/pdf/2310.07820.pdf)

The paper demonstrates that large language models like GPT-3 and LLaMA-2 can zero-shot forecast time series by encoding the data as strings of numbers, enabling performance comparable to or exceeding specialized time series models without requiring task-specific training. The approach leverages LLMs' natural ability to model complex distributions and includes methods for encoding time series as numerical strings and converting discrete distributions into continuous densities for forecasting.

- [Mistral 7B (2023)](https://arxiv.org/pdf/2310.06825.pdf)

The paper introduces Mistral 7B, a 7-billion-parameter language model that outperforms existing models on various benchmarks by leveraging grouped-query attention for faster inference and sliding window attention for handling long sequences efficiently. This model, designed for superior performance and efficiency, is released under the Apache 2.0 license, highlighting its application in coding, mathematics, and reasoning tasks.

-[Analyzing Transformers in Embedding Space (2023)](https://arxiv.org/pdf/2209.02535.pdf)

The paper presents a novel approach to interpreting Transformer-based models by projecting their parameters into the embedding space, demonstrating that this method allows for the interpretation of both pretrained and fine-tuned models. The findings suggest that understanding Transformers in the embedding space can abstract away model specifics and enable various applications, such as aligning parameters of different models and constructing classifiers without additional training.

- [Jump to Conclusions: Short-Cutting Transformers With Linear Transformations (2023)](https://arxiv.org/pdf/2303.09435.pdf)

The article "Jump to Conclusions Short-Cutting Transformers With Linear Transformations" explores the use of linear transformations to accelerate the inference of transform models. The authors find that using non-contextual linear computations in transformer inference leads to a slight deterioration in predictions, opening up new avenues of research to improve model efficiency.

- [AmadeusGPT a natural language interface for interactive animal behavioral analysis (2023)](https://arxiv.org/pdf/2307.04858.pdf)

AmadeusGPT is a natural language interface that turns natural language descriptions of animal behaviors into machine-executable code, using a novel dual-memory mechanism to overcome the context window limitation of large language models. It allows users to interactively refine results and add new behavioral modules as needed, without requiring any coding skills, and has shown excellent performance on the MABe 2022 behavior challenge tasks.

----
### 2022

- [Rethinking Attention with Performers (2022)](https://arxiv.org/pdf/2009.14794.pdf)

Performers are a new Transformer architecture with linear space and time complexity, using the FAVOR+ mechanism to efficiently approximate softmax attention. They offer significant speed and memory efficiency advantages.

- [The Forward-Forward Algorithm: Some Preliminary Investigations (2022)](https://arxiv.org/pdf/2212.13345.pdf)

The Forward-Forward Algorithm (FF) is a new learning procedure for neural networks that aims to replace the forward and backward passes of backpropagation with two forward passes, one with positive data and the other with negative data. Each layer in the network has its own objective function, which is to have high goodness for positive data and low goodness for negative data, and the sum of the squared activities in a layer can be used as the goodness. The FF algorithm is different from backpropagation in that it does not require the computation of gradients or the storage of intermediate values, and it can be used in situations where the precise details of the forward computation are unknown.

- [Predictive Coding A Theoritical and Experimental Review (2022)](https://arxiv.org/pdf/2107.12979.pdf)

Predictive coding is a theory of brain function that suggests the brain's primary objective is to minimize prediction errors, which are the differences between predicted and actual sensory input. The theory proposes that the brain achieves this through a hierarchical network of layers, each making predictions about the activity of the layer below and passing prediction errors upwards to update higher-level predictions.

----
### 2021

- [Generalized Hopfield Networks: On a Model of Associative Memory with Huge Storage Capacity (2021)](https://arxiv.org/pdf/1702.01929.pdf)

Aiming to store bit chains, the generalized Hopfield model, when using an exponential interaction, can greatly expand its storage capacity exponentialy based on neuron count, holding vast amounts of patterns with stability close to the original Hopfield model.

- [Reservoir Transformers (2021)](https://arxiv.org/pdf/2012.15045.pdf)

This paper investigates the efficiency of transformer models with some layers randomly initialized and kept static during training. Introducing nonlinear "reservoir" layers amidst regular transformer layers, the authors found improved computation times and overall performance in translation and language modeling tasks, suggesting that certain transformer layers can remain unchanged without compromising effectiveness.

- [A review on the attention mechanism of deep learning (2021)](https://www.sciencedirect.com/science/article/abs/pii/S092523122100477X)

The 2021 review article describes the attention mechanism in deep learning as a human cognitive process-inspired method that enhances efficiency and accuracy by focusing on certain parts of data, classifies attention models by criteria such as the type of attention and input/output representations, and discusses their successful applications in computer vision and natural language processing, highlighting the mechanism's potential for model interpretability.

- [Hints and Random Search for Reservoir Computing Hyperparameters (2021)](https://inria.hal.science/hal-03203318/file/Hinaut2021_ICANN_Reservoir-Random-Search_HAL-preprint-v2.pdf)

The paper "Hints and Random Search for Reservoir Computing Hyperparameters" introduces a two-step random search methodology for selecting hyperparameters in reservoir computing, highlighting its advantages over traditional grid search. It demonstrates the method's efficacy through time series prediction tasks and discusses its broader implications and potential for future research in reservoir computing.

- [ViR: the Vision Reservoir (2021)](https://arxiv.org/pdf/2112.13545.pdf)

This paper introduces ViR, a novel model for image classification that is more efficient than the Vision Transformer (ViT). ViR achieves superior performance on small-scale benchmarks with fewer parameters and a smaller memory footprint compared to ViT.

----
### 2020

- [Hopfield Networks is All You Need (2020)](https://arxiv.org/pdf/2008.02217.pdf)

The paper "Hopfield Networks is All You Need" introduces a modernized Hopfield network with continuous states and an update rule that enables exponential storage of patterns and their efficient retrieval with minimal errors. The update rule mirrors the attention mechanism in transformers, enhancing deep learning architectures by integrating Hopfield layers for pooling, memory, and attention, demonstrating significant improvements in various domains including multiple instance learning and drug design.

- [A Robust Model of gated Working Memory (2020)](https://www.labri.fr/perso/nrougier/papers/10.1162.neco_a_01249.pdf)

This paper introduces a three-neuron model that utilizes tanh unit non-linearity to provide controlled access to working memory. This model is stable against different disturbances and contrasts with reservoir-based models, demonstrating prolonged memory retention and resilience to disruptions more effectively than reservoir systems.

- [Retrieval-Augmented Generation for Knowledge-Intensive NLP Tasks (2020)](https://arxiv.org/pdf/2005.11401.pdf)

This paper introduces a method that combines parametric (pre-trained seq2seq models) and non-parametric (dense vector index of Wikipedia) memories to enhance language models' knowledge access and manipulation. By retrieving relevant Wikipedia passages for inputs, and integrating them in the prompt, it achieves improved results in knowledge-focused NLP tasks.

- [Neural dynamics of phoneme sequences reveal position-invariant code for content and order (2020)](https://www.nature.com/articles/s41467-022-34326-1)

The study explores how the human brain processes and sequences speech sounds. Using magnetoencephalography (MEG), it was found that the brain continuously encodes the last three heard speech sounds, recognizes speech sounds irrespective of their position in a word and also encodes the time since each sound was heard.

- [The Tolman-Eichenbaum Machine Unifying Space and Relational Memory through Generalization in the Hippocampal Formation (2020)](https://www.biorxiv.org/content/10.1101/770495v1.full.pdf)

The study introduces the Tolman-Eichenbaum Machine (TEM), linking the hippocampal-entorhinal system's role in spatial and relational memory. TEM demonstrates how diverse hippocampal and entorhinal cell types contribute to memory generalization across different environments, offering insights into complex memory tasks and the neural basis of spatial and relational cognition.

- [Hierarchical-Task Reservoir for Anytime POS Tagging from Continuous Speech (2020)](https://inria.hal.science/hal-02594495/document)

The paper introduces the Hierarchical-Task Reservoir (HTR) for real-time sentence parsing from continuous speech, focusing on Echo State Networks (ESN), Handwritten Text Recognition (HTR), and enhancing the processing of increasing levels of language abstraction (phone, word, and POS tag estimation). It demonstrates HTR's superior performance in experimental comparisons, emphasizing its potential for language comprehension modeling and real-time human-robot interaction applications.

- [Reinforcement learning with convolutional reservoir computing (2020)](https://link.springer.com/article/10.1007/s10489-020-01679-3)

The paper introduces a novel Reinforcement Learning with Convolutional Reservoir Computing (RCRC) model, leveraging a fixed random-weight CNN for visual feature extraction and an Echo State Network (ESN) for time-series feature. This approach, using random filters and a reservoir for final predictions and state propagation, avoids the need for extensive data storage and feature extractor training, reducing computational costs while maintaining the ability to solve multiple RL tasks with a single feature extractor and a task-dependent linear transformation. This model showcases the inherent feature extraction capacity of network structures and its generalization ability across diverse environments.

- [TinyBERT: Distilling BERT for Natural Language Understanding (2020)](https://arxiv.org/pdf/1909.10351.pdf)

The paper introduces TinyBERT, a model that distills the BERT model for efficient natural language understanding, achieving over 96.8% of BERT's performance while being 7.5x smaller and 9.4x faster. TinyBERT utilizes a novel Transformer distillation method and a two-stage learning framework, significantly reducing computational costs without the need for extensive data storage or feature extractor training.

- [A Reservoir Computing Approach to Word Sense Disambiguation (2020)](https://sci-hub.3800808.com/10.1007/s12559-020-09758-w)

This paper presents a reservoir computing approach, specifically the deep bi-directional echo state network (DBiESN), for word sense disambiguation (WSD) in natural language processing. The authors propose a novel method for exploiting reservoirs' steady states and demonstrate that the DBiESN model offers a good alternative to other tested models, achieving similar accuracy in WSD tasks with fewer trainable parameters.

- [A journey in ESN and LSTM visualisations on a language task (2020)](https://arxiv.org/pdf/2012.01748)

This paper compares the performance of Echo State Networks (ESNs) and Long Short-Term Memory networks (LSTMs) on a Cross-Situational Learning (CSL) task, which involves learning the meaning of words through co-occurrences with visual stimuli. The results show that both models are able to successfully learn the task, but the LSTM reaches the lowest error for the basic corpus while the ESN is quicker to train and outperforms the LSTM on more challenging datasets without any further tuning needed.

----
### 2019

- [BERT: Pre-training of Deep Bidirectional Transformers for Language Understanding (2019)](https://arxiv.org/pdf/1810.04805.pdf)

This paper introduced a deep bidirectional language representation model pre-trained on unlabelled text, leveraging both left and right context. Built on the Transformer encoder, BERT set new benchmarks in multiple natural language processing tasks.

- [Weight Agnostic Neural Networks (2019)](https://arxiv.org/pdf/1906.04358.pdf)

The paper "Weight Agnostic Neural Networks" examines how neural network structures can effectively perform tasks with random or untrained weights, challenging traditional deep learning approaches that heavily rely on specific weight training. It includes methodological details, experimental results, and future research implications in neural networks and machine learning.

- [A distributional code for value in dopamine-based reinforcement learning (2019)](https://sci-hub.3800808.com/10.1038/s41586-019-1924-6)

The paper "A Distributional Code for Value in Dopamine-Based Reinforcement Learning" investigates the hypothesis that dopaminergic neurons encode a distribution of reward values, challenging the classical theory of a singular scalar code. It details experimental studies on mice with probabilistic rewards, revealing diverse dopaminergic neuron responses and discussing implications for understanding dopamine's role in the brain and potential applications in neuroscience and AI.

- [Behaviors of Reservoir Computing Models for Textual Documents Classification (2019)](https://sci-hub.3800808.com/10.1109/ijcnn.2019.8852304)

The article "Jump to Conclusions Short-Cutting Transformers With Linear Transformations" explores the use of linear transformations to accelerate the inference of transform models. The authors find that using non-contextual linear computations in transformer inference leads to a slight deterioration in predictions, opening up new avenues of research to improve model efficiency.

----
### 2018

- [Group Normalization (2018)](https://arxiv.org/pdf/1803.08494.pdf)

Group Normalization (GN) is presented as an effective alternative to Batch Normalization, dividing channels into groups for normalization independent of batch sizes, demonstrating stable accuracy across a wide range of batch sizes and applications. GN outperforms Batch Normalization in scenarios with small batch sizes and shows versatility in tasks like image classification, object detection, and video classification.

- [Representation Learning with Contrastive Predictive Coding (2018)](https://arxiv.org/pdf/1807.03748.pdf)

Contrastive Predictive Coding (CPC) is a method for unsupervised learning that combines autoregressive modeling and noise-contrastive estimation to learn abstract representations of high-dimensional data. CPC has been shown to achieve strong or state-of-the-art performance in a variety of domains, including audio, images, natural language, and reinforcement learning, when used as stand-alone features or in conjunction with the main loss.

----
### 2017

- [Attention is all you need (2017)](https://arxiv.org/pdf/1706.03762.pdf)

This paper introduced the "Transformer" architecture, which uses multi-head attention mechanisms and positional encoding, eliminating the need for recurrent or convolutional neural networks. This efficient architecture set new performance standards in natural language processing and influenced subsequent models like BERT and GPT.

- [Curiosity-driven Exploration by Self-supervised Prediction (2017)](https://pathak22.github.io/noreward-rl/resources/icml17.pdf)

The paper "Curiosity-driven Exploration by Self-supervised Prediction" addresses the challenge of exploration in reinforcement learning environments with sparse rewards by introducing curiosity as an intrinsic reward. This curiosity is gauged by the prediction error of an agent's future state $s_{t+1}$ based on its current state $s_t$. Leveraging this method encourages agents to effectively explore intricate environments.

- [Cosine Normalization: Using Cosine Similarity Instead of Dot Product in Neural Networks (2017)](https://arxiv.org/pdf/1702.05870.pdf)

The paper introduces a novel technique called cosine normalization, which utilizes cosine similarity or Pearson correlation coefficient instead of dot product in neural networks. This approach effectively reduces the variance of neurons, improves model robustness, and accelerates training, as demonstrated through experiments on various network types and datasets.

----
### 2015

- [Distilling the Knowledge in a Neural Network (2015)](https://arxiv.org/pdf/1503.02531.pdf)

The paper "Distilling the Knowledge in a Neural Network" presents a method of transferring knowledge from a larger model to a smaller (distilled) one using the concept of "distillation". Large models produce "soft targets", which are probability distributions across classes and carry more information than traditional "hard targets". These soft targets help the smaller model to recognize the relationships between classes learned by the larger model. 

---
### 2014

- [GRU : Learning Phrase Representations using RNN Encoder–Decoder for Statistical Machine Translation (2014)](https://arxiv.org/pdf/1406.1078v3.pdf)

This paper introduces the RNN Encoder-Decoder with Gated Recurrent Units (GRU) that employ "gates" to control information flow. These "gates" decide what information to retain or discard, optimizing sequence encoding and decoding processes.

- [Neural Turing Machine (2014)](https://arxiv.org/pdf/1410.5401.pdf)

The Neural Turing Machine (NTM) is a neural network architecture that includes an external memory component, allowing it to store and manipulate information in a way that is analogous to a traditional computer's memory. The NTM uses a differentiable attention mechanism to read from and write to this memory, allowing it to learn to perform complex tasks that require reasoning and memory. The NTM is trained using gradient descent, making it possible to learn its parameters from data.

---
### 2011

- [Predictive Coding (2011)](https://sci-hub.3800808.com/https://doi.org/10.1002/wcs.142)

Predictive coding is a framework that explains how the nervous system reduces redundancy and efficiently codes sensory information by transmitting only the unpredicted portions of an incoming signal. This framework provides a functional explanation for various neural responses and aspects of brain organization, such as center-surround response properties and biphasic temporal antagonism in the retina and lateral geniculate nucleus, as well as oriented receptive fields and contextual effects in the higher visual system.

---
### 2010

- [A NEAT Way for Evolving Echo State Networks (2010)](https://www.researchgate.net/publication/220838636_A_NEAT_way_for_evolving_Echo_State_Networks)

This paper presents a method for evolving Echo State Networks (ESNs) by combining evolution and learning. The goal is to automatically discover function approximators that can perform well in complex real-world tasks. The paper provides a brief overview of ESNs, describes the methodology used, presents the experiments and outcomes, and concludes with a discussion on future improvements.

---
### 1997

- [Long Short Term Memory (1997)](https://www.researchgate.net/publication/13853244_Long_Short-term_Memory)

The LSTM, a significant advancement in recurrent neural networks, addresses the vanishing gradient issue faced by traditional RNNs using unique gate mechanisms. These gates, including the forget, input, and output gates, determine the information flow, leveraging sigmoid and tanh functions to maintain and control long-term memory effectively.

---
### 1991

- [Distributed Representations, Simple Recurrent Networks, and Grammatical Structure (1991)](https://link.springer.com/content/pdf/10.1007/BF00114844.pdf)

Le papier présente un réseau de neurones récurrents simples (SRN) entraîné sur des phrases multiclausales contenant des relatives clauses multiplement imbriquées. L'analyse des patterns d'activation des unités cachées révèle que le réseau résout la tâche en développant des représentations distribuées complexes qui encodent les relations grammaticales et la structure hiérarchique des constituants.
