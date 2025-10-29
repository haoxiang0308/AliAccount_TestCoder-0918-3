import torch
import torch.nn as nn
import torch.nn.functional as F
import torch.optim as optim

class BinaryClassifier(nn.Module):
    """
    A simple neural network for binary classification.
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
        # First hidden layer with ReLU activation and batch norm
        x = F.relu(self.bn1(self.fc1(x)))
        x = self.dropout(x)
        
        # Second hidden layer with ReLU activation and batch norm
        x = F.relu(self.bn2(self.fc2(x)))
        x = self.dropout(x)
        
        # Output layer with sigmoid activation for binary classification
        x = torch.sigmoid(self.fc3(x))
        
        return x

# Example usage and training loop
def train_model(model, train_loader, num_epochs=100, learning_rate=0.001):
    """
    Train the binary classifier model.
    """
    # Define loss function and optimizer
    criterion = nn.BCELoss()  # Binary Cross Entropy Loss
    optimizer = optim.Adam(model.parameters(), lr=learning_rate)
    
    # Training loop
    model.train()
    for epoch in range(num_epochs):
        total_loss = 0
        for batch_idx, (data, target) in enumerate(train_loader):
            # Zero gradients
            optimizer.zero_grad()
            
            # Forward pass
            output = model(data)
            
            # Calculate loss
            loss = criterion(output.squeeze(), target.float())
            
            # Backward pass
            loss.backward()
            
            # Update weights
            optimizer.step()
            
            total_loss += loss.item()
        
        if (epoch + 1) % 20 == 0:
            print(f'Epoch [{epoch+1}/{num_epochs}], Loss: {total_loss/len(train_loader):.4f}')
    
    print("Training completed!")

# Example of how to use the model
if __name__ == "__main__":
    # Example: Create a model for a dataset with 10 features
    input_size = 10
    model = BinaryClassifier(input_size=input_size)
    
    print("Model architecture:")
    print(model)
    
    # Example of how to make predictions
    sample_input = torch.randn(5, input_size)  # Batch of 5 samples with 10 features each
    with torch.no_grad():
        predictions = model(sample_input)
        print(f"\nSample predictions for 5 data points: {predictions.flatten()}")
        print(f"Predictions as classes (0 or 1): {(predictions.flatten() > 0.5).int()}")