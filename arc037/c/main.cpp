#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int N;
long long K;

bool ok(long long n, long long k, vector<long long> a, vector<long long> b)
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

  long long res = 1000000000000000000 + 1;
  long long l = 0;
  long long r = 1000000000000000000 + 1;
  while (l < r) {
    long long mid = (l + r) / 2;
    if (ok(mid, K, a, b)) {
      r = mid;
      if (mid < res) res = mid;
    } else {
      l = mid + 1;
    }
  }
  cout << res - 1 << endl;
}