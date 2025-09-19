import numpy as np
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error
import joblib

# Generate sample data
np.random.seed(42)
X = np.random.randn(100, 1)
y = 2 * X + 1 + 0.1 * np.random.randn(100, 1)

# Create and train the model
model = LinearRegression()
model.fit(X, y)

# Make predictions
predictions = model.predict(X[:5])
print(f"Predictions for first 5 samples: {predictions.flatten()}")
print(f"Actual values for first 5 samples: {y[:5].flatten()}")

# Evaluate the model
mse = mean_squared_error(y, model.predict(X))
print(f"Mean Squared Error: {mse}")

# Print model parameters
print(f"Coefficient: {model.coef_[0]}")
print(f"Intercept: {model.intercept_}")

# Save the model
joblib.dump(model, 'linear_regression_model.pkl')
print("Model saved as 'linear_regression_model.pkl'")