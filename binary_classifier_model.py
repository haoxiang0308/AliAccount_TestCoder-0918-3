import torch
import torch.nn as nn
import torch.nn.functional as F

class BinaryClassificationNet(nn.Module):
    """
    A simple neural network for binary classification tasks.
    """
    def __init__(self, input_size, hidden_size1=64, hidden_size2=32, dropout_rate=0.2):
        """
        Initialize the network layers.
        
        Args:
            input_size (int): Number of input features
            hidden_size1 (int): Number of neurons in the first hidden layer
            hidden_size2 (int): Number of neurons in the second hidden layer
            dropout_rate (float): Dropout rate for regularization
        """
        super(BinaryClassificationNet, self).__init__()
        
        # Define the layers
        self.fc1 = nn.Linear(input_size, hidden_size1)
        self.fc2 = nn.Linear(hidden_size1, hidden_size2)
        self.fc3 = nn.Linear(hidden_size2, 1)  # Output layer for binary classification
        
        # Dropout for regularization
        self.dropout = nn.Dropout(dropout_rate)
        
        # Batch normalization layers
        self.bn1 = nn.BatchNorm1d(hidden_size1)
        self.bn2 = nn.BatchNorm1d(hidden_size2)
        
    def forward(self, x):
        """
        Forward pass through the network.
        
        Args:
            x (Tensor): Input tensor of shape (batch_size, input_size)
            
        Returns:
            Tensor: Output tensor of shape (batch_size, 1)
        """
        # First hidden layer with ReLU activation and batch normalization
        x = self.fc1(x)
        x = self.bn1(x)
        x = F.relu(x)
        x = self.dropout(x)
        
        # Second hidden layer with ReLU activation and batch normalization
        x = self.fc2(x)
        x = self.bn2(x)
        x = F.relu(x)
        x = self.dropout(x)
        
        # Output layer with sigmoid activation for binary classification
        x = self.fc3(x)
        x = torch.sigmoid(x)
        
        return x

# Example usage:
if __name__ == "__main__":
    # Create a sample network for 20 features
    model = BinaryClassificationNet(input_size=20)
    
    # Create a sample input batch of 5 samples
    sample_input = torch.randn(5, 20)
    
    # Forward pass
    output = model(sample_input)
    
    print(f"Input shape: {sample_input.shape}")
    print(f"Output shape: {output.shape}")
    print(f"Sample outputs: {output.squeeze()}")