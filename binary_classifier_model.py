import torch
import torch.nn as nn
import torch.nn.functional as F

class BinaryClassifier(nn.Module):
    """
    A simple neural network for binary classification tasks.
    """
    def __init__(self, input_size, hidden_size1, hidden_size2):
        """
        Initialize the neural network layers.
        
        Args:
            input_size (int): Number of input features
            hidden_size1 (int): Number of neurons in the first hidden layer
            hidden_size2 (int): Number of neurons in the second hidden layer
        """
        super(BinaryClassifier, self).__init__()
        
        # Define the layers
        self.fc1 = nn.Linear(input_size, hidden_size1)
        self.fc2 = nn.Linear(hidden_size1, hidden_size2)
        self.fc3 = nn.Linear(hidden_size2, 1)  # Output layer for binary classification
        
        # Dropout layer for regularization
        self.dropout = nn.Dropout(0.2)
        
    def forward(self, x):
        """
        Define the forward pass of the neural network.
        
        Args:
            x (Tensor): Input tensor
            
        Returns:
            Tensor: Output tensor with probability scores
        """
        # Pass through first hidden layer with ReLU activation
        x = F.relu(self.fc1(x))
        x = self.dropout(x)
        
        # Pass through second hidden layer with ReLU activation
        x = F.relu(self.fc2(x))
        x = self.dropout(x)
        
        # Output layer with sigmoid activation for binary classification
        x = torch.sigmoid(self.fc3(x))
        
        return x

# Example usage:
# model = BinaryClassifier(input_size=20, hidden_size1=64, hidden_size2=32)
# input_data = torch.randn(32, 20)  # Batch of 32 samples with 20 features each
# output = model(input_data)
# print(output.shape)  # Should be [32, 1]