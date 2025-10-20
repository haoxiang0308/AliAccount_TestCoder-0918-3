import torch
import torch.nn as nn
import torch.nn.functional as F
import random
import string

class BinaryClassifier(nn.Module):
    """
    A simple neural network for binary classification
    """
    def __init__(self, input_size, hidden_size=64):
        super(BinaryClassifier, self).__init__()
        # Input layer to hidden layer
        self.fc1 = nn.Linear(input_size, hidden_size)
        # Hidden layer to another hidden layer
        self.fc2 = nn.Linear(hidden_size, hidden_size // 2)
        # Hidden layer to output (binary classification needs 1 output)
        self.fc3 = nn.Linear(hidden_size // 2, 1)
        # Dropout for regularization
        self.dropout = nn.Dropout(0.2)
        
    def forward(self, x):
        # First layer with ReLU activation
        x = F.relu(self.fc1(x))
        x = self.dropout(x)
        
        # Second layer with ReLU activation
        x = F.relu(self.fc2(x))
        x = self.dropout(x)
        
        # Output layer with sigmoid activation for binary classification
        x = torch.sigmoid(self.fc3(x))
        return x

# Example usage:
if __name__ == "__main__":
    # Create a model with 10 input features
    model = BinaryClassifier(input_size=10)
    
    # Generate random input for testing
    sample_input = torch.randn(5, 10)  # 5 samples, 10 features each
    output = model(sample_input)
    
    print("Model architecture:")
    print(model)
    print(f"Input shape: {sample_input.shape}")
    print(f"Output shape: {output.shape}")
    print(f"Sample output: {output.flatten()}")
    
    # Save the model
    model_filename = 'binary_classifier_model.pth'
    torch.save(model.state_dict(), model_filename)
    print(f"Model saved as {model_filename}")