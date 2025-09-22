import numpy as np
from sklearn.linear_model import LinearRegression
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error
import joblib

# Generate some sample data for linear regression
# y = 2*x + 1 + noise
np.random.seed(42)
X = np.random.randn(100, 1)
y = 2 * X.flatten() + 1 + 0.1 * np.random.randn(100)

# Split the data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Create and train the linear regression model
model = LinearRegression()
model.fit(X_train, y_train)

# Make predictions
y_pred = model.predict(X_test)

# Evaluate the model
mse = mean_squared_error(y_test, y_pred)
print(f"Model trained!")
print(f"Mean Squared Error: {mse:.4f}")

# Print learned parameters
print(f"Learned weight: {model.coef_[0]:.4f}")
print(f"Learned bias: {model.intercept_:.4f}")

# Save the model
joblib.dump(model, 'linear_regression_model.pkl')
print("\nModel saved as 'linear_regression_model.pkl'")