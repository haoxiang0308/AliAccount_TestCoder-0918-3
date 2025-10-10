import torch
import torch.nn as nn
import torch.optim as optim

# Define the neural network model
class BinaryClassifier(nn.Module):
    def __init__(self, input_size):
        super(BinaryClassifier, self).__init__()
        self.hidden1 = nn.Linear(input_size, 128)
        self.hidden2 = nn.Linear(128, 64)
        self.output = nn.Linear(64, 1)
        self.relu = nn.ReLU()
        self.sigmoid = nn.Sigmoid()

    def forward(self, x):
        x = self.relu(self.hidden1(x))
        x = self.relu(self.hidden2(x))
        x = self.sigmoid(self.output(x))
        return x

# Example usage
if __name__ == "__main__":
    # Assume input feature size is 10
    model = BinaryClassifier(input_size=10)

    # Example input tensor
    example_input = torch.randn(1, 10)

    # Forward pass
    output = model(example_input)
    print(f"Model output: {output.item():.4f}")

    # Save the model's state dictionary
    torch.save(model.state_dict(), "binary_classifier_model.pth")
    print("Model saved to 'binary_classifier_model.pth'")
