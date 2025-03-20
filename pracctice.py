import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.preprocessing import MinMaxScaler, StandardScaler, LabelEncoder
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import classification_report, accuracy_score, confusion_matrix, f1_score, recall_score, precision_score

# Check for numeric columns and plot correlation heatmap
numeric_data = data.select_dtypes(include=['number'])
plt.figure(figsize=(10, 7))
sns.heatmap(numeric_data.corr(), cmap="YlGnBu", annot=True)
plt.title("Correlation Heatmap")
plt.show()

# Check and fill missing values
print("Missing values per column:\n", data.isnull().sum())
data.fillna(data.mean(), inplace=True)
print("Missing values after filling:\n", data.isnull().sum())

# One-hot encoding for categorical variable
df_encoded = pd.get_dummies(data, columns=["island"], drop_first=False)

# Compute covariance and correlation matrices
cov_matrix = data[["bill_length_mm", "bill_depth_mm", "flipper_length_mm", "body_mass_g"]].cov()
corr_matrix = data[["bill_length_mm", "bill_depth_mm", "flipper_length_mm", "body_mass_g"]].corr()
print("Covariance Matrix:\n", cov_matrix)
print("Correlation Matrix:\n", corr_matrix)

# Feature scaling (Min-Max Scaling)
scaler = MinMaxScaler()
df_scaled = data.copy()
df_scaled[["bill_length_mm", "bill_depth_mm", "flipper_length_mm", "body_mass_g"]] = scaler.fit_transform(
    data[["bill_length_mm", "bill_depth_mm", "flipper_length_mm", "body_mass_g"]])

# Drop 'sex' column if it exists
if 'sex' in df_scaled.columns:
    df_scaled.drop('sex', axis=1, inplace=True)

# Z-score normalization
scaler = StandardScaler()
df_scaled_z = data.copy()
df_scaled_z[["bill_length_mm", "bill_depth_mm", "flipper_length_mm", "body_mass_g"]] = scaler.fit_transform(
    data[["bill_length_mm", "bill_depth_mm", "flipper_length_mm", "body_mass_g"]])

if 'sex' in df_scaled_z.columns:
    df_scaled_z.drop('sex', axis=1, inplace=True)

# Encode categorical variables
for col in df2.columns:
    if df2[col].dtype in ["object", "category"]:
        df2[col] = LabelEncoder().fit_transform(df2[col])

# Fill missing values in float columns
for col in df2.select_dtypes(include=["float64"]).columns:
    df2[col].fillna(df2[col].mean(), inplace=True)

# Split into features (X) and target (y)
X = df2.drop(columns=["survived"])
y = df2["survived"]

# Train-test split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Train Decision Tree Classifier
dt = DecisionTreeClassifier()
dt.fit(X_train, y_train)

# Predictions
y_pred = dt.predict(X_test)

# Confusion matrix
conf = confusion_matrix(y_test, y_pred)
print("Confusion Matrix:\n", conf)

# Visualizing confusion matrix
plt.figure(figsize=(6, 4))
sns.heatmap(conf, annot=True, lw=2, cbar=False)
plt.ylabel("True Values")
plt.xlabel("Predicted Values")
plt.title("Confusion Matrix Visualization")
plt.show()

# Performance Metrics
acc = accuracy_score(y_test, y_pred)
print("Accuracy:", acc)

print("Classification Report:\n", classification_report(y_test, y_pred))
