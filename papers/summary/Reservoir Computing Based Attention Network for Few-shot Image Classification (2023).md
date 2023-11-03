### Reservoir Computed based Attention Network for Few Shot Image Classification (2023)

*Paper still in review.*

The paper named “Reservoir Computed based Attention Network for Few Shot Image Classification” present an interested architecture to implement Attention with Reservoir. Instead of training feed forwards to compute Q, K, V, they use a reservoir. But this implementation does not provide a way to reduce the quadratic cost of the attention, and do not allow the use of an RNN (cause it need to compute attention on the whole data, not just the current one).