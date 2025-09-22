import numpy as np

class SimpleDenseLayer:
    def __init__(self, input_size, output_size, activation='relu'):
        # Initialize weights and biases randomly
        self.weights = np.random.randn(input_size, output_size) * 0.1
        self.biases = np.zeros((1, output_size))
        self.activation = activation
    
    def forward(self, inputs):
        # Store inputs for potential backpropagation
        self.inputs = inputs
        # Linear transformation
        self.z = np.dot(inputs, self.weights) + self.biases
        
        # Apply activation function
        if self.activation == 'relu':
            self.output = np.maximum(0, self.z)
        elif self.activation == 'sigmoid':
            self.output = 1 / (1 + np.exp(-np.clip(self.z, -500, 500)))  # Clipping to prevent overflow
        else:
            self.output = self.z  # Linear activation
            
        return self.output

class SimpleModel:
    def __init__(self):
        # Create two dense layers
        self.layer1 = SimpleDenseLayer(5, 10, 'relu')
        self.layer2 = SimpleDenseLayer(10, 1, 'sigmoid')
    
    def predict(self, inputs):
        # Forward pass through the network
        x = self.layer1.forward(inputs)
        x = self.layer2.forward(x)
        return x
    
    def summary(self):
        print("Simple Model with 2 Dense Layers:")
        print("  Layer 1: Dense(5 -> 10) with ReLU activation")
        print("  Layer 2: Dense(10 -> 1) with Sigmoid activation")
        print(f"  Total parameters: {5*10 + 10 + 10*1 + 1}")

# Example usage
if __name__ == "__main__":
    # Create the model
    model = SimpleModel()
    
    # Display model summary
    model.summary()
    
    # Test with sample data
    sample_input = np.random.randn(3, 5)  # 3 samples, 5 features each
    predictions = model.predict(sample_input)
    
    print("\\nSample predictions:")
    print(predictions)
    
    print("\\nModel created successfully!")