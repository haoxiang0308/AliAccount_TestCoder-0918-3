import torch
import torch.nn as nn
import torch.nn.functional as F
import random
import string

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

def create_random_filename():
    """Generate a random filename for the model file."""
    letters = string.ascii_lowercase
    random_string = ''.join(random.choice(letters) for i in range(10))
    return f"model_{random_string}.py"

if __name__ == "__main__":
    # Example usage
    input_size = 10  # Number of input features
    model = BinaryClassifier(input_size)
    
    print("Binary Classifier Model:")
    print(model)
    
    # Test with a random input tensor
    test_input = torch.randn(1, input_size)
    output = model(test_input)
    print(f"\nInput shape: {test_input.shape}")
    print(f"Output shape: {output.shape}")
    print(f"Output (probability): {output.item():.4f}")
    
    # Generate random filename
    random_filename = create_random_filename()
    print(f"\nModel saved to: {random_filename}")
    
    # Save the model architecture to the randomly named file
    with open(random_filename, 'w') as f:
        f.write('# PyTorch Binary Classification Model\n')
        f.write('# Generated automatically\n\n')
        f.write('import torch\n')
        f.write('import torch.nn as nn\n')
        f.write('import torch.nn.functional as F\n\n')
        f.write(f"class BinaryClassifier(nn.Module):\n")
        f.write(f"    \"\"\"\n")
        f.write(f"    A simple neural network for binary classification.\n")
        f.write(f"    \"\"\"\n")
        f.write(f"    def __init__(self, input_size, hidden_size=64):\n")
        f.write(f"        super(BinaryClassifier, self).__init__()\n")
        f.write(f"        # Input layer to hidden layer\n")
        f.write(f"        self.fc1 = nn.Linear(input_size, hidden_size)\n")
        f.write(f"        # Hidden layer to another hidden layer\n")
        f.write(f"        self.fc2 = nn.Linear(hidden_size, hidden_size // 2)\n")
        f.write(f"        # Hidden layer to output (binary classification - single output)\n")
        f.write(f"        self.fc3 = nn.Linear(hidden_size // 2, 1)\n")
        f.write(f"        # Dropout for regularization\n")
        f.write(f"        self.dropout = nn.Dropout(0.2)\n")
        f.write(f"        \n")
        f.write(f"    def forward(self, x):\n")
        f.write(f"        # Apply ReLU activation after first layer\n")
        f.write(f"        x = F.relu(self.fc1(x))\n")
        f.write(f"        x = self.dropout(x)\n")
        f.write(f"        \n")
        f.write(f"        # Apply ReLU activation after second layer\n")
        f.write(f"        x = F.relu(self.fc2(x))\n")
        f.write(f"        x = self.dropout(x)\n")
        f.write(f"        \n")
        f.write(f"        # Sigmoid activation for binary classification output\n")
        f.write(f"        x = torch.sigmoid(self.fc3(x))\n")
        f.write(f"        return x\n")