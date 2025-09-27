import torch
import torch.nn as nn
import torch.nn.functional as F

class BinaryClassifier(nn.Module):
    """
    A simple neural network for binary classification.
    It consists of an input layer, two hidden layers, and an output layer.
    """
    def __init__(self, input_size):
        super(BinaryClassifier, self).__init__()
        # First hidden layer
        self.fc1 = nn.Linear(input_size, 128)
        # Second hidden layer
        self.fc2 = nn.Linear(128, 64)
        # Output layer
        self.fc3 = nn.Linear(64, 1)
        # Dropout for regularization
        self.dropout = nn.Dropout(p=0.2)
        # Activation function for hidden layers
        self.relu = nn.ReLU()

    def forward(self, x):
        # Apply ReLU activation to the first hidden layer
        x = self.relu(self.fc1(x))
        # Apply dropout for regularization
        x = self.dropout(x)
        # Apply ReLU activation to the second hidden layer
        x = self.relu(self.fc2(x))
        # Apply dropout for regularization
        x = self.dropout(x)
        # Output layer with sigmoid activation for binary classification
        x = torch.sigmoid(self.fc3(x))
        return x

# Example usage:
# model = BinaryClassifier(input_size=10)
# print(model)