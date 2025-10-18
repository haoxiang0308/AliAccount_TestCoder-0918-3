# PyTorch Binary Classification Model
# Generated automatically

import torch
import torch.nn as nn
import torch.nn.functional as F

class BinaryClassifier(nn.Module):
    """
    A simple neural network for binary classification.
    """
    def __init__(self, input_size, hidden_size=64):
        super(BinaryClassifier, self).__init__()
        # Input layer to hidden layer
        self.fc1 = nn.Linear(input_size, hidden_size)
        # Hidden layer to another hidden layer
        self.fc2 = nn.Linear(hidden_size, hidden_size // 2)
        # Hidden layer to output (binary classification - single output)
        self.fc3 = nn.Linear(hidden_size // 2, 1)
        # Dropout for regularization
        self.dropout = nn.Dropout(0.2)
        
    def forward(self, x):
        # Apply ReLU activation after first layer
        x = F.relu(self.fc1(x))
        x = self.dropout(x)
        
        # Apply ReLU activation after second layer
        x = F.relu(self.fc2(x))
        x = self.dropout(x)
        
        # Sigmoid activation for binary classification output
        x = torch.sigmoid(self.fc3(x))
        return x
