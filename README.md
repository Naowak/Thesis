# Thesis

## Papers

- [Attention is all you need (2017)](./papers/summary/Attention%20is%20all%20you%20need%20(2017).md)

This paper introduced the "Transformer" architecture, which uses multi-head attention mechanisms and positional encoding, eliminating the need for recurrent or convolutional neural networks. This efficient architecture set new performance standards in natural language processing and influenced subsequent models like BERT and GPT.

- [BERT: Pre-training of Deep Bidirectional Transformers for Language Understanding (2019)](./papers/summary/BERT%3A%20Pre-training%20of%20Deep%20Bidirectional%20Transformers%20for%20Language%20Understanding%20(2019).md)

This paper introduced a deep bidirectional language representation model pre-trained on unlabelled text, leveraging both left and right context. Built on the Transformer encoder, BERT set new benchmarks in multiple natural language processing tasks.

- [Code Llama: Open Foundation Models for Code (2023)](./papers/summary/Code%20Llama%3A%20Open%20Foundation%20Models%20for%20Code%20(2023).md)

"Code Llama" is a large-scale language model specialized in generating and understanding code, trained on diverse textual and coding data. The model can be fine-tuned for specific programming languages, like Python, and is optimized for long sequences.

- [GRU : Learning Phrase Representations using RNN Encoder–Decoder for Statistical Machine Translation (2014)](./papers/summary/GRU%20%3A%20Learning%20Phrase%20Representations%20using%20RNN%20Encoder%E2%80%93Decoder%20for%20Statistical%20Machine%20Translation%20%282014%29.md)

This paper introduces the RNN Encoder-Decoder with Gated Recurrent Units (GRU) that employ "gates" to control information flow. These "gates" decide what information to retain or discard, optimizing sequence encoding and decoding processes.

- [Long Short Term Memory (1997)](./papers/summary/Long%20Short%20Term%20Memory%20%281997%29.md)

The LSTM, a significant advancement in recurrent neural networks, addresses the vanishing gradient issue faced by traditional RNNs using unique gate mechanisms. These gates, including the forget, input, and output gates, determine the information flow, leveraging sigmoid and tanh functions to maintain and control long-term memory effectively.

- [RWKV : Reinventing RNNs for the Transformer Era (2023)](./papers/summary/RWKV%3A%20Reinventing%20RNNs%20for%20the%20Transformer%20Era%20%282023%29.md)

This paper introduces the Receptance Weighted Key Value (RWKV) model, merging Transformers' efficient parallel training with RNNs' computational efficiency. RWKV boasts linear computational complexity, offers gradient stability, and is scalable up to billions of parameters, while its limitations include its linear attention approach and its non-consideration of future words.

- [Generalized Hopfield Networks: On a Model of Associative Memory with Huge Storage Capacity (2021)](./papers/summary/Generalized%20Hopfield%20Networks:%20On%20a%20Model%20of%20Associative%20Memory%20with%20Huge%20Storage%20Capacity%20(2017).md)

Aiming to store bit chains, the generalized Hopfield model, when using an exponential interaction, can greatly expand its storage capacity exponentialy based on neuron count, holding vast amounts of patterns with stability close to the original Hopfield model.

- [Reservoir Transformers (2021)](./papers/summary/Reservoir%20Transformers%20(2021).md)

This paper investigates the efficiency of transformer models with some layers randomly initialized and kept static during training. Introducing nonlinear "reservoir" layers amidst regular transformer layers, the authors found improved computation times and overall performance in translation and language modeling tasks, suggesting that certain transformer layers can remain unchanged without compromising effectiveness.

- [A Robust Model of gated Working Memory (2020)](./papers/summary/A%20Robust%20Model%20of%20gated%20Working%20Memory%20(2020).md)

This paper introduces a three-neuron model that utilizes tanh unit non-linearity to provide controlled access to working memory. This model is stable against different disturbances and contrasts with reservoir-based models, demonstrating prolonged memory retention and resilience to disruptions more effectively than reservoir systems.

- [Retrieval-Augmented Generation for Knowledge-Intensive NLP Tasks (2020)](./papers/summary/Retrieval-Augmented%20Generation%20for%20Knowledge-Intensive%20NLP%20Tasks%20(2021).md)

This paper introduces a method that combines parametric (pre-trained seq2seq models) and non-parametric (dense vector index of Wikipedia) memories to enhance language models' knowledge access and manipulation. By retrieving relevant Wikipedia passages for inputs, and integrating them in the prompt, it achieves improved results in knowledge-focused NLP tasks.

- [Curiosity-driven Exploration by Self-supervised Prediction (2017)](./papers/summary/Curiosity-driven%20Exploration%20by%20Self-supervised%20Prediction%20(2017).md)

The paper "Curiosity-driven Exploration by Self-supervised Prediction" addresses the challenge of exploration in reinforcement learning environments with sparse rewards by introducing curiosity as an intrinsic reward. This curiosity is gauged by the prediction error of an agent's future state $s_{t+1}$ based on its current state $s_t$. Leveraging this method encourages agents to effectively explore intricate environments.

- [Neural dynamics of phoneme sequences reveal position-invariant code for content and order (2020)](./papers/summary/Neural%20dynamics%20of%20phoneme%20sequences%20reveal%20position-invariant%20code%20for%20content%20and%20order%20(2020).md)

The study explores how the human brain processes and sequences speech sounds. Using magnetoencephalography (MEG), it was found that the brain continuously encodes the last three heard speech sounds, recognizes speech sounds irrespective of their position in a word and also encodes the time since each sound was heard.

- [Orca: Progressive Learning from Complex Explanation Traces of GPT-4 (2023)](./papers/summary/Orca%20Progressive%20Learning%20from%20Complex%20Explanation%20Traces%20of%20GPT-4%20(2023).md)

This paper presents the development of Orca, a 13-billion parameter model, that improves upon smaller models by mimicking the reasoning processes of Large Foundation Models (LFMs) using detailed explanation data from GPT-4. By employing "explanation tuning", Orca learns not just from query-response pairs but also from GPT-4's step-by-step reasoning.

- [Distilling the Knowledge in a Neural Network (2015)](./papers/summary/Distilling%20the%20Knowledge%20in%20a%20Neural%20Network%20(2015).md)

The paper "Distilling the Knowledge in a Neural Network" presents a method of transferring knowledge from a larger model to a smaller (distilled) one using the concept of "distillation". Large models produce "soft targets", which are probability distributions across classes and carry more information than traditional "hard targets". These soft targets help the smaller model to recognize the relationships between classes learned by the larger model. 

- [Reservoir Computed based Attention Network for Few Shot Image Classification (2023)](./papers/summary/Reservoir%20Computing%20Based%20Attention%20Network%20for%20Few-shot%20Image%20Classification%20(2023).md)

This paper presents an interested architecture to implement Attention with Reservoir. Instead of training feed forwards to compute Q, K, V, they use a reservoir. But this implementation does not provide a way to reduce the quadratic cost of the attention, and do not allow the use of an RNN (cause it need to compute attention on the whole data, not just the current one).