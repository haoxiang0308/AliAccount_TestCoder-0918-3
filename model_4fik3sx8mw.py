import torch
import torch.nn as nn
import torch.nn.functional as F

class BinaryClassifier(nn.Module):
    """
    A neural network for binary classification.
    This model takes an input tensor and outputs a probability between 0 and 1.
    """
    def __init__(self, input_size, hidden_size1=128, hidden_size2=64, dropout_rate=0.3):
        super(BinaryClassifier, self).__init__()
        
        # Define the layers
        self.fc1 = nn.Linear(input_size, hidden_size1)
        self.fc2 = nn.Linear(hidden_size1, hidden_size2)
        self.fc3 = nn.Linear(hidden_size2, 1)
        
        # Add batch normalization
        self.bn1 = nn.BatchNorm1d(hidden_size1)
        self.bn2 = nn.BatchNorm1d(hidden_size2)
        
        # Add dropout for regularization
        self.dropout = nn.Dropout(dropout_rate)
        
    def forward(self, x):
        # First hidden layer with ReLU activation and batch normalization
        x = F.relu(self.bn1(self.fc1(x)))
        x = self.dropout(x)
        
        # Second hidden layer with ReLU activation and batch normalization
        x = F.relu(self.bn2(self.fc2(x)))
        x = self.dropout(x)
        
        # Output layer with sigmoid activation to get probability output
        x = torch.sigmoid(self.fc3(x))
        
        return x

# Example usage:
if __name__ == "__main__":
    # Create a model instance with 20 input features
    model = BinaryClassifier(input_size=20)
    
    # Print the model architecture
    print("Model Architecture:")
    print(model)
    
    # Test with a sample input (batch of 5 samples, each with 20 features)
    sample_input = torch.randn(5, 20)
    output = model(sample_input)
    
    print(f"\nInput shape: {sample_input.shape}")
    print(f"Output shape: {output.shape}")
    print(f"Output (probabilities): {output.flatten()}")
    
    # Example of how to save the model
    torch.save(model.state_dict(), "binary_classifier.pth")
    print("\nModel saved successfully!")