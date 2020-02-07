#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;
template<class T> inline bool chmax(T& a, T b) { if (a < b) { a = b; return true; } return false; }
template<class T> inline bool chmin(T& a, T b) { if (a > b) { a = b; return true; } return false; }

int N, T;
long long dp[3010][3010];

int main() {
    cin >> N >> T;
    vector<pair<int, int>> ab;
    for (int i = 0; i < N; ++i) {
        int a, b;
        cin >> a >> b;
        ab.push_back({a, b});
    }
    sort(ab.begin(), ab.end());
    for (int i = 0; i < N; ++i) {
        int a = ab[i].first;
        int b = ab[i].second;
        for (int j = 0; j < T; ++j) {
            chmax(dp[i + 1][j], dp[i][j]);
            if (j + a <= T) {
              chmax(dp[i + 1][j + a], dp[i][j] + b);
            }
        }
    }

    long long res = 0;
    for (int i = 1; i <= N; ++i) {
        long long value = dp[i - 1][T - 1] + ab[i - 1].second;
        if (value > res) res = value;
    }
    cout << res << endl;
}