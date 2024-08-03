class Solution {
  bool wordPattern(String pattern, String s) {
    List<String> str = s.split(" ");

    print(str);
    print(pattern);
    if (str.length != pattern.length) {
      return false;
    }
    for (int i = 0; i < (pattern.length) - 1; i++) {
      print("${pattern[i]} ${pattern[i + 1]}");
      print("${str[i]} ${str[i + 1]}");

      if (pattern[i] == pattern[i + 1]) {
        if (str[i] != str[i + 1]) {
          return false;
        }
      } else {
        if (str[i] == str[i + 1]) {
          return false;
        }
      }
    }

    return true;
  }
}

main() {
  Solution solution = Solution();

  print(solution.wordPattern('abba', 'dog cat cat fish'));
}
