# Starting in the top left corner of a 22 grid, there are 6 routes (without backtracking)
# to the bottom right corner.


# How many routes are there through a 2020 grid?

N = 21

m = [[0] * N] * N

for i in range(N):
    for j in range(N):
        if i == 0 and j == 0:
            m[i][j] = 1
        elif i == 0:
            m[i][j] = m[i][j - 1]
        elif j == 0:
            m[i][j] = m[i - 1][j]
        else:
            m[i][j] = m[i - 1][j] + m[i][j - 1]

print(m[N - 1][N - 1])
