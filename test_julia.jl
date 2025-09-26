# test_julia.jl
using LinearAlgebra
using Printf

println("✅ Julia is working with LinearAlgebra!")

# Define matrix A and vector b
A = [3 1; 1 2]
b = [9, 8]

# Solve linear system Ax = b
x = A \ b
@printf("Solution of Ax=b: [%.2f, %.2f]\n", x[1], x[2])

# Compute determinant of A
detA = det(A)
@printf("Determinant of A: %.2f\n", detA)