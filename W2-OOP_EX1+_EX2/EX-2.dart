class BankAccount {
  // TODO
  final int _accountId;
  final String _accountName;
  double _balance = 0;

  BankAccount(this._accountId, this._accountName);

  int get accountId => _accountId;
  String get accountOwner => _accountName;
  double get balance => _balance;

  void credit(double amount) {
    if (amount <= 0) {
      throw Exception('Credit amount must be positive!');
    }
    _balance += amount;
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      throw Exception('Withdrawal amount must be positive!');
    }
    if (_balance < amount) {
      throw Exception('Insufficient balance for withdrawal!');
    }
    _balance -= amount;
  }
}

class Bank {
  // TODO
  final String bankName;
  final Map<int, BankAccount> _accounts = {};

  Bank({required this.bankName});

  BankAccount createAccount(int accountId, String accountName) {
    if (_accounts.containsKey(accountId)) {
      throw Exception('Account with ID $accountId already exists!');
    }
    final account = BankAccount(accountId, accountName);
    _accounts[accountId] = account;
    return account;
  }

  BankAccount? getAccount(int accountId) => _accounts[accountId];
}

void main() {
  Bank myBank = Bank(bankName: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
