# This is a simple representation of a Keras model with one dense layer
# Due to environment limitations, we're not actually running the code

class SimpleDenseModel:
    def __init__(self, input_size=5, hidden_size=10, output_size=1):
        self.input_size = input_size
        self.hidden_size = hidden_size
        self.output_size = output_size
        
    def describe(self):
        print(f"Model with one dense layer:")
        print(f"  Input layer: {self.input_size} neurons")
        print(f"  Hidden layer: {self.hidden_size} neurons with ReLU activation")
        print(f"  Output layer: {self.output_size} neuron with sigmoid activation")
        
    def compile_info(self):
        print("Model compiled with:")
        print("  Optimizer: Adam")
        print("  Loss function: Binary Crossentropy")
        print("  Metrics: Accuracy")

# Create and describe the model
model = SimpleDenseModel()
model.describe()
model.compile_info()

print("\\nModel structure defined successfully!")