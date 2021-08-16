#include <iostream>

using namespace std;
/**
 * Matrix multiplication (mod m) by definition. 
 * Assume that all numbers in matrices do not exceed 1000; 
 * And also the module m does not exceed 1000.
 * Matrix size N is a power of 2 (2^0, ..., 2^10); 
 * so the largest size of N is 1024. 
 */
void multiply(int** A, int** B, int**& C, int N, int m)
{
	C = new int*[N];
    for (int i = 0; i < N; i++)
    {
		C[i] = new int[N];
        for (int j = 0; j < N; j++)
        {
            C[i][j] = 0;
            for (int k = 0; k < N; k++)
            {
                C[i][j] += A[i][k]*B[k][j];
            }
			C[i][j] = C[i][j] % m; // result by module m
        }
    }
}

int main() {
	int N; 
	cin >> N; 
	int m; 
	cin >> m; 

	
	
	int** A = new int*[N];
	int** B = new int*[N];
	
	for (int i = 0; i < N; i++) {
		A[i] = new int[N];
		for (int j = 0; j < N; j++) {
			cin >> A[i][j];
			//cout << "(i,j) = " << i << "," << j << endl;
		}
	}
	for (int i = 0; i < N; i++) {
		B[i] = new int[N];
		for (int j = 0; j < N; j++) {
			cin >> B[i][j];
		}
	}
	
	int** C; 
	multiply(A, B, C, N, m); 
	for (int i = 0; i < N; i++) {
		for (int j = 0; j < N; j++) {
			cout << C[i][j] << " ";
		}
		cout << endl;
	}
	
}