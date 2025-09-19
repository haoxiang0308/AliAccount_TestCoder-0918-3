import torch
import torch.nn as nn
import torch.optim as optim
import torch.nn.functional as F

class BinaryClassifier(nn.Module):
    """
    A simple neural network for binary classification
    """
    def __init__(self, input_size, hidden_size1=64, hidden_size2=32):
        super(BinaryClassifier, self).__init__()
        
        # Define layers
        self.fc1 = nn.Linear(input_size, hidden_size1)
        self.fc2 = nn.Linear(hidden_size1, hidden_size2)
        self.fc3 = nn.Linear(hidden_size2, 1)
        
        # Dropout for regularization
        self.dropout = nn.Dropout(0.2)
        
    def forward(self, x):
        # Forward pass through the network
        x = F.relu(self.fc1(x))
        x = self.dropout(x)
        x = F.relu(self.fc2(x))
        x = self.dropout(x)
        x = torch.sigmoid(self.fc3(x))  # Sigmoid for binary classification
        return x

def train_model(model, X_train, y_train, epochs=100, learning_rate=0.001):
    """
    Train the binary classification model
    """
    criterion = nn.BCELoss()  # Binary Cross Entropy Loss
    optimizer = optim.Adam(model.parameters(), lr=learning_rate)
    
    model.train()
    for epoch in range(epochs):
        # Forward pass
        outputs = model(X_train)
        loss = criterion(outputs, y_train)
        
        # Backward pass and optimization
        optimizer.zero_grad()
        loss.backward()
        optimizer.step()
        
        if (epoch+1) % 20 == 0:
            print(f'Epoch [{epoch+1}/{epochs}], Loss: {loss.item():.4f}')

# Example usage:
# model = BinaryClassifier(input_size=10)
# X_train = torch.randn(100, 10)  # 100 samples, 10 features
# y_train = torch.randint(0, 2, (100, 1)).float()  # Binary labels (0 or 1)
# train_model(model, X_train, y_train)

if __name__ == "__main__":
    # Example of how to use the model
    print("Binary Classifier Model Definition")
    print("To use this model:")
    print("1. Import the BinaryClassifier class")
    print("2. Initialize with input_size: model = BinaryClassifier(input_size)")
    print("3. Train with train_model function")