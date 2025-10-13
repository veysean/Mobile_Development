bool isBalanced(String input) {
  final stack = <String>[];
  final matchingBrackets = {
    ')': '(',
    ']': '[',
    '}': '{',
  };

  for (var char in input.split('')) {
    if (matchingBrackets.values.contains(char)) {
      stack.add(char); 
    } else if (matchingBrackets.keys.contains(char)) {
      if (stack.isEmpty || stack.removeLast() != matchingBrackets[char]) {
        return false; 
      }
    }
  }

  return stack.isEmpty; 
}

void main() {
  final testCases = [
    '{what is (42)?}',
    '[text}',
    '{{[[[(())]]}}',
    '{[[[(a)b]c]d]}',
    '([]{})',
    '([)]',
  ];

  for (var input in testCases) {
    final result = isBalanced(input) ? 'Balanced' : 'Not balanced';
    print('$input -> $result');
  }
}