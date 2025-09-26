import torch
import torch.nn as nn
import torch.optim as optim
import numpy as np

# Define the neural network model
class BinaryClassifier(nn.Module):
    def __init__(self, input_size):
        super(BinaryClassifier, self).__init__()
        # Hidden layers
        self.fc1 = nn.Linear(input_size, 128)
        self.relu1 = nn.ReLU()
        self.dropout1 = nn.Dropout(0.2)
        
        self.fc2 = nn.Linear(128, 64)
        self.relu2 = nn.ReLU()
        self.dropout2 = nn.Dropout(0.2)
        
        # Output layer
        self.fc3 = nn.Linear(64, 1)
        self.sigmoid = nn.Sigmoid()

    def forward(self, x):
        x = self.fc1(x)
        x = self.relu1(x)
        x = self.dropout1(x)
        
        x = self.fc2(x)
        x = self.relu2(x)
        x = self.dropout2(x)
        
        x = self.fc3(x)
        x = self.sigmoid(x)
        return x

# Example usage
if __name__ == "__main__":
    # Assume input size is 10
    input_size = 10
    model = BinaryClassifier(input_size)
    
    # Create a dummy input tensor
    dummy_input = torch.randn(1, input_size)
    
    # Forward pass
    output = model(dummy_input)
    print(f"Model output (probability): {output.item():.4f}")
    
    # Save the model's state dictionary
    torch.save(model.state_dict(), "binary_classifier_model.pth")
    print("Model saved as 'binary_classifier_model.pth'")