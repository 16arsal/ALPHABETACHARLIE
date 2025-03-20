import seaborn as sns
import matplotlib.pyplot as plt

numeric_data = data.select_dtypes(include=['number'])

# Create a heatmap of the correlation matrix
dataplot = sns.heatmap(numeric_data.corr(), cmap="YlGnBu", annot=True)
sns.set(rc={'figure.figsize': (10, 7)})  # Set the figure size
plt.show()


missing_values = data.isnull().sum()
print("Missing values per column:\n", missing_values)

data.fillna(data[].mean(), inplace=True)
#data.fillna(data.mean(), inplace=True)

missing_values = data.isnull().sum()
print("Missing values per column:\n", missing_values)

df_encoded = pd.get_dummies(data, columns=["island"], drop_first=False)
df_encoded.head()

# Compute covariance matrix
cov_matrix = data[["bill_length_mm", "bill_depth_mm", "flipper_length_mm", "body_mass_g"]].cov()

# Print covariance matrix
print("Covariance Matrix:")
cov_matrix

corr_matrix = data[["bill_length_mm", "bill_depth_mm", "flipper_length_mm", "body_mass_g"]].corr()
print("Correlation Matrix:")
corr_matrix

import seaborn as sns
import matplotlib.pyplot as plt

numeric_data = data.select_dtypes(include=['number'])

# Create a heatmap of the correlation matrix
dataplot = sns.heatmap(numeric_data.corr(), cmap="YlGnBu", annot=True)
sns.set(rc={'figure.figsize': (10, 7)})  # Set the figure size
plt.show()

# Correlation heatmap with custom settings
plt.figure(figsize=(10, 6))  # Set figure size
heatmap = sns.heatmap(
    numeric_data.corr(), vmin=-1, vmax=1, annot=True, cmap='BrBG'  # Adjust the color map and value range
)
heatmap.set_title('Correlation Heatmap', fontdict={'fontsize': 18}, pad=12)  # Add title
plt.show()

from sklearn.preprocessing import MinMaxScaler

# Initialize scaler
scaler = MinMaxScaler()

# Apply Min-Max Scaling
df_scaled = data.copy()
df_scaled[["bill_length_mm", "bill_depth_mm", "flipper_length_mm", "body_mass_g"]] = scaler.fit_transform(
    data[["bill_length_mm", "bill_depth_mm", "flipper_length_mm", "body_mass_g"]])

# Display transformed data
df_scaled = df_scaled.drop('sex', axis=1)
df_scaled.head()

from sklearn.preprocessing import StandardScaler

# Initialize scaler
scaler = StandardScaler()

# Apply Z-score Normalization
df_scaled_z = data.copy()
df_scaled_z[["bill_length_mm", "bill_depth_mm", "flipper_length_mm", "body_mass_g"]] = scaler.fit_transform(
    data[["bill_length_mm", "bill_depth_mm", "flipper_length_mm", "body_mass_g"]])

# Display transformed data
df_scaled_z = df_scaled_z.drop('sex', axis=1)
df_scaled_z.head()