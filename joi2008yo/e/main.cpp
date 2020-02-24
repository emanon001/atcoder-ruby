#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int R, C;

int main() {
  cin >> R >> C;
  vector<vector<int>> state(R, vector<int>(C));
  for (int i = 0; i < R; ++i) {
    for (int j = 0; j < C; ++j) {
      cin >> state[i].at(j);
    }
  }
  int res = 0;
  for (int r = 0; r < (1 << R); ++r) {
    int sum = 0;
    for (int i = 0; i < C; ++i) {
      int front = 0;
      for (int j = 0; j < R; ++j) {
        int v = state[j][i];
        if (r & (1 << j)) v = v ^ 1;
        if (v) front += 1;
      }
      sum += max(front, R - front);
    }
    if (sum > res) res = sum;
  }

  cout << res << endl;
}