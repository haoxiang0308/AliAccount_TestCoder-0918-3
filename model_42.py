import torch
import torch.nn as nn
import torch.nn.functional as F

class BinaryClassifier(nn.Module):
    """
    A simple feedforward neural network for binary classification.
    """
    def __init__(self, input_size, hidden_size1=64, hidden_size2=32, dropout_rate=0.5):
        super(BinaryClassifier, self).__init__()
        self.fc1 = nn.Linear(input_size, hidden_size1)
        self.fc2 = nn.Linear(hidden_size1, hidden_size2)
        self.fc3 = nn.Linear(hidden_size2, 1)  # Single output for binary classification
        self.dropout = nn.Dropout(dropout_rate)
        self.relu = nn.ReLU()

    def forward(self, x):
        x = self.relu(self.fc1(x))
        x = self.dropout(x)
        x = self.relu(self.fc2(x))
        x = self.dropout(x)
        x = torch.sigmoid(self.fc3(x))  # Sigmoid for binary output probability
        return x

# Example usage:
# model = BinaryClassifier(input_size=10)
# print(model)
# dummy_input = torch.randn(1, 10)
# output = model(dummy_input)
# print(output)