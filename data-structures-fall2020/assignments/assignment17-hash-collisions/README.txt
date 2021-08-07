Assignment 17: Hash collisions

Introduction 

(1) Inspect this url 
https://codeforces.com/blog/entry/62393
Try to run a piece of C++ hashing code on Linux. 
One of the functions is probably much slower than the other. 
Which one? 

Time for Case 1: ______________
Time for Case 2: ______________

#include <ctime>
#include <iostream>
#include <unordered_map>
using namespace std;

const int N = 2e5;

void insert_numbers(long long x) {
    clock_t begin = clock();
    unordered_map<long long, int> numbers;

    for (int i = 1; i <= N; i++)
        numbers[i * x] = i;

    long long sum = 0;

    for (auto &entry : numbers)
        sum += (entry.first / x) * entry.second;

    printf("x = %lld: %.3lf seconds, sum = %lld\n", x, (double) (clock() - begin) / CLOCKS_PER_SEC, sum);
}

int main() {
    insert_numbers(107897);
    insert_numbers(126271);
}

================



Iesprauž īpatnējus ģeometrisku progresiju locekļus 
(Tā, lai rastos padaudz kolīziju). 

Katram studentam pēc numura - cits skaitlītis. 
Viņi izrēķina pirmos 10 locekļus - un iezīmē hash buckets. 



