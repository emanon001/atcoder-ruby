#include <iostream>
using namespace std;
template<class T> inline bool chmax(T& a, T b) { if (a < b) { a = b; return true; } return false; }
template<class T> inline bool chmin(T& a, T b) { if (a > b) { a = b; return true; } return false; }
const long long INF = 1LL<<60;

int H, N, weight[1000], value[1000];
long long dp[1010][20010];

int main() {
    cin >> H >> N;
    for (int i = 0; i < N; ++i) cin >> weight[i] >> value[i];

    for (int i = 0; i < 1010; ++i) {
      for (int j = 0; j < 20010; ++j) {
        dp[i][j] = INF;
      }
    }
    dp[0][0] = 0;
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j <= H + 10000; ++j) {
            // if (i < 10) cout << weight[i] << " " << value[i] << endl;
            if (j < weight[i]) {
              dp[i+1][j] = dp[i][j];
            } else {
              dp[i+1][j] = dp[i][j];
              if (dp[i+1][j] > dp[i + 1][j - weight[i]] + value[i]) {
                dp[i+1][j] = dp[i + 1][j - weight[i]] + value[i];
              }
            }
        }
    }

    long long res = INF;
    for (int j = H; j <= H + 10000; ++j) {
        long long cost = dp[N][j];
        if (cost < res) res = cost;
    }
    cout << res << endl;
}