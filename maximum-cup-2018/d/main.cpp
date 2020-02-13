#include <iostream>
using namespace std;
template<class T> inline bool chmax(T& a, T b) { if (a < b) { a = b; return true; } return false; }
template<class T> inline bool chmin(T& a, T b) { if (a > b) { a = b; return true; } return false; }
const long long INF = 1LL << 60;

int N, M, L, X, A[10010];
long long dp[10010][1010];

int main()
{
  cin >> N >> M >> L >> X;
  for (int i = 0; i < N; ++i)
    cin >> A[i];

  for (int i = 0; i < 10010; ++i) {
    for (int j = 0; j < 1010; ++j) {
      dp[i][j] = INF;
    }
  }

  dp[0][0] = 1;
  for (int i = 0; i < N; ++i)
  {
    int a = A[i];
    for (int j = 0; j < 1000; ++j)
    {
      long long cur = dp[i][j];
      if (cur == INF)
        continue;
      
      chmin(dp[i + 1][j], cur);
      chmin(dp[i + 1][(j + a) % M], cur + (int)((j + a) / M));
    }
  }

  if (dp[N][L] <= X) {
    cout << "Yes" << endl;
  } else {
    cout << "No" << endl;
  }
}