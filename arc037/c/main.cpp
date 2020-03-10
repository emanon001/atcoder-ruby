#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int N;
long long K;

bool is_ok(long long n, long long k, vector<long long> a, vector<long long> b)
{
  long c = 0;
  for (int i = 0; i < N; ++i) {
    c += lower_bound(b.begin(), b.end(), n, [&](long long x, long long y) {
      return a[i] * x < y;
    }) - b.begin();
  }
  return c >= k;
}

int main() {
  cin >> N >> K;
  vector<long long> a, b;
  for (int i = 0; i < N; ++i) {
    long v;
    cin >> v;
    a.push_back(v);
  }
  sort(a.begin(), a.end());
  for (int i = 0; i < N; ++i) {
    long v;
    cin >> v;
    b.push_back(v);
  }
  sort(b.begin(), b.end());

  long long ng = 0;
  long long ok = 1000000000000000000 + 1;
  while (abs(ng - ok) > 1) {
    long long mid = (ng + ok) / 2;
    if (is_ok(mid, K, a, b)) {
      ok = mid;
    } else {
      ng = mid;
    }
  }
  cout << ok - 1 << endl;
}