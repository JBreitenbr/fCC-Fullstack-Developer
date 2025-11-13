class BankAccount {
  constructor() {
    this.transactions = [];
    this.balance = 0;
  }

  // Method to deposit money into the account
  deposit(amount) {
    this.transactions.push({ amount, type:"deposit" });
    this.balance += amount;
    if (amount <= 0){
      return "Deposit amount must be greater than zero."
    }
    return `Successfully deposited $${amount}. New balance: $${this.balance}` 
  }

  // Method to withdraw money from the account
  withdraw(amount) {
    if (amount <= 0 || amount > this.balance){
      return "Insufficient balance or invalid amount."
    }
    this.transactions.push({ amount: -amount, type: "withdraw" });
    this.balance -= amount;
    return `Successfully withdrew $${amount}. New balance: $${this.balance}`
  }

  // Method to get the balance of the account
  checkBalance() {
    return `Current balance: $${this.balance}`;
  }

  // Method to list all deposits
  listAllDeposits() {
    let deposits = [];
    for (let i = 0; i < this.transactions.length; i++) {
      if (this.transactions[i].amount > 0) {
        deposits.push(this.transactions[i].amount);
      }
    }
    return "Deposits: " + deposits.join(',');
  }

  // Method to list all withdrawals
  listAllWithdrawals() {
    let withdrawals = [];
    for (let i = 0; i < this.transactions.length; i++) {
      if (this.transactions[i].amount < 0) {
        withdrawals.push(Math.abs(this.transactions[i].amount));
      }
    }
    return "Withdrawals: " + withdrawals.join(',');
  } 
}

let myAccount = new BankAccount()


console.log(myAccount.deposit(200))
console.log(myAccount.withdraw(20))
console.log(myAccount.deposit(10))
console.log(myAccount.withdraw(50))

console.log(myAccount.checkBalance())

console.log(myAccount.deposit(30))
console.log(myAccount.withdraw(100))
console.log(myAccount.deposit(90))

console.log(myAccount.checkBalance())

console.log(myAccount.listAllDeposits())
console.log(myAccount.listAllWithdrawals())
