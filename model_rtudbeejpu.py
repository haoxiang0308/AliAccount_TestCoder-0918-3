import torch
import torch.nn as nn
import torch.nn.functional as F

class BinaryClassifier(nn.Module):
    """
    A PyTorch neural network model for binary classification.
    """
    def __init__(self, input_size, hidden_size1=64, hidden_size2=32, dropout_rate=0.2):
        super(BinaryClassifier, self).__init__()
        
        # Define the layers
        self.fc1 = nn.Linear(input_size, hidden_size1)
        self.fc2 = nn.Linear(hidden_size1, hidden_size2)
        self.fc3 = nn.Linear(hidden_size2, 1)  # Output layer for binary classification
        
        # Dropout for regularization
        self.dropout = nn.Dropout(dropout_rate)
        
        # Batch normalization
        self.bn1 = nn.BatchNorm1d(hidden_size1)
        self.bn2 = nn.BatchNorm1d(hidden_size2)
    
    def forward(self, x):
        # First hidden layer with ReLU activation and batch normalization
        x = F.relu(self.bn1(self.fc1(x)))
        x = self.dropout(x)
        
        # Second hidden layer with ReLU activation and batch normalization
        x = F.relu(self.bn2(self.fc2(x)))
        x = self.dropout(x)
        
        # Output layer with sigmoid activation for binary classification
        x = torch.sigmoid(self.fc3(x))
        
        return x

# Example usage
if __name__ == "__main__":
    # Create model instance
    model = BinaryClassifier(input_size=10)
    
    # Print model architecture
    print(model)
    
    # Example forward pass with random input
    # Use a batch of samples to avoid batch norm issues
    sample_input = torch.randn(4, 10)  # Using batch size of 4
    output = model(sample_input)
    print(f"Input shape: {sample_input.shape}")
    print(f"Output shape: {output.shape}")
    print(f"Sample output (first item): {output[0].item():.4f}")
    
    # To use with single samples, set model to eval mode
    model.eval()
    single_input = torch.randn(1, 10)
    with torch.no_grad():
        single_output = model(single_input)
    print(f"Single input shape: {single_input.shape}")
    print(f"Single output: {single_output.item():.4f}")
