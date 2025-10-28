import torch
import torch.nn as nn
import torch.nn.functional as F
import random
import string

class BinaryClassifier(nn.Module):
    """
    A simple neural network for binary classification using PyTorch
    """
    def __init__(self, input_size, hidden_size1=64, hidden_size2=32, dropout_rate=0.2):
        super(BinaryClassifier, self).__init__()
        
        # Define the layers
        self.fc1 = nn.Linear(input_size, hidden_size1)  # First hidden layer
        self.fc2 = nn.Linear(hidden_size1, hidden_size2)  # Second hidden layer
        self.fc3 = nn.Linear(hidden_size2, 1)  # Output layer (1 output for binary classification)
        
        # Dropout for regularization
        self.dropout = nn.Dropout(dropout_rate)
        
        # Batch normalization
        self.bn1 = nn.BatchNorm1d(hidden_size1)
        self.bn2 = nn.BatchNorm1d(hidden_size2)
    
    def forward(self, x):
        # Forward pass through the network
        x = F.relu(self.fc1(x))  # Apply ReLU activation after first layer
        x = self.bn1(x)  # Batch normalization
        x = self.dropout(x)  # Apply dropout
        
        x = F.relu(self.fc2(x))  # Apply ReLU activation after second layer
        x = self.bn2(x)  # Batch normalization
        x = self.dropout(x)  # Apply dropout
        
        # Output layer with sigmoid activation for binary classification
        x = torch.sigmoid(self.fc3(x))
        return x

def create_model(input_size, hidden_size1=64, hidden_size2=32, dropout_rate=0.2):
    """
    Factory function to create and return a binary classifier model
    """
    model = BinaryClassifier(
        input_size=input_size,
        hidden_size1=hidden_size1,
        hidden_size2=hidden_size2,
        dropout_rate=dropout_rate
    )
    return model

# Example usage:
if __name__ == "__main__":
    # Create a model for binary classification with 10 input features
    input_size = 10
    model = create_model(input_size)
    
    # Print the model architecture
    print("Model Architecture:")
    print(model)
    
    # Example forward pass with random input
    sample_input = torch.randn(5, input_size)  # 5 samples with input_size features each
    output = model(sample_input)
    print(f"\nSample input shape: {sample_input.shape}")
    print(f"Output shape: {output.shape}")
    print(f"Sample output: {output.flatten()}")
    
    # Calculate total number of parameters
    total_params = sum(p.numel() for p in model.parameters())
    trainable_params = sum(p.numel() for p in model.parameters() if p.requires_grad)
    print(f"\nTotal parameters: {total_params}")
    print(f"Trainable parameters: {trainable_params}")