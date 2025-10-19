import torch
import torch.nn as nn
import torch.nn.functional as F
import random
import string

class BinaryClassifier(nn.Module):
    """
    A simple neural network for binary classification
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

def create_random_filename():
    """Generate a random filename for the model file"""
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for i in range(10))
    return f"{random_name}_binary_classifier.py"

if __name__ == "__main__":
    # Example usage:
    # Create a model with 10 input features
    model = BinaryClassifier(input_size=10)
    
    # Print model architecture
    print("Model Architecture:")
    print(model)
    
    # Create a random input tensor to test the model
    sample_input = torch.randn(5, 10)  # 5 samples, 10 features each
    output = model(sample_input)
    print(f"\nSample input shape: {sample_input.shape}")
    print(f"Output shape: {output.shape}")
    print(f"Sample output: {output.flatten()}")
    
    # Generate random filename and save the model code
    random_filename = create_random_filename()
    
    # Get the source code of this file and save it to the random filename
    with open(__file__, 'r') as source_file:
        source_code = source_file.read()
    
    # Write the source code to the randomly named file
    with open(random_filename, 'w') as target_file:
        target_file.write(source_code)
    
    print(f"\nModel code saved to: {random_filename}")
    
    # Save the model architecture to a file with the random name
    torch.save(model.state_dict(), f"model_weights_{random_filename.split('.')[0]}.pth")
    print(f"Model weights saved to: model_weights_{random_filename.split('.')[0]}.pth")