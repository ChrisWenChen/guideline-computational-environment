import numpy as np
from scipy import linalg

print("✅ NumPy & SciPy are available!")

# Test NumPy: Solve a system of linear equations
a = np.array([[3, 1], [1, 2]])
b = np.array([9, 8])
x = np.linalg.solve(a, b)
print("NumPy linear system solution:", x)

# Test SciPy: Compute determinant
det = linalg.det(a)
print("SciPy determinant:", det)