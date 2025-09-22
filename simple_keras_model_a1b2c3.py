# Simple neural network implementation with one dense layer
import numpy as np

class SimpleDenseLayer:
    def __init__(self, input_size, output_size, activation='relu'):
        self.input_size = input_size
        self.output_size = output_size
        self.activation = activation
        
        # Initialize weights and biases randomly
        self.weights = np.random.randn(input_size, output_size) * 0.1
        self.biases = np.random.randn(output_size) * 0.1
    
    def relu(self, x):
        return np.maximum(0, x)
    
    def sigmoid(self, x):
        return 1 / (1 + np.exp(-np.clip(x, -500, 500)))  # Clipping to prevent overflow
    
    def forward(self, inputs):
        self.inputs = inputs
        self.z = np.dot(inputs, self.weights) + self.biases
        
        if self.activation == 'relu':
            return self.relu(self.z)
        elif self.activation == 'sigmoid':
            return self.sigmoid(self.z)
        else:
            return self.z

class SimpleModel:
    def __init__(self):
        # Create two layers
        self.layer1 = SimpleDenseLayer(5, 10, 'relu')
        self.layer2 = SimpleDenseLayer(10, 1, 'sigmoid')
    
    def predict(self, inputs):
        x = self.layer1.forward(inputs)
        x = self.layer2.forward(x)
        return x
    
    def summary(self):
        print("Simple Model with 2 Dense Layers")
        print(f"Layer 1: Dense (5,) -> (10,) with ReLU activation")
        print(f"Layer 2: Dense (10,) -> (1,) with Sigmoid activation")

# Create and display the model
model = SimpleModel()
model.summary()

# Test with sample data
sample_input = np.random.randn(3, 5)
output = model.predict(sample_input)
print(f"\nSample input shape: {sample_input.shape}")
print(f"Sample output shape: {output.shape}")
print(f"Sample output values: {output.flatten()}")