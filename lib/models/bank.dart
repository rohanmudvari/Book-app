 class Bank{
  final String bankName;
  final String bankLocation;

  int _balance=0;
  Bank({required this.bankName,required this.bankLocation});
  int balanceShow(){
    return _balance;
  }
  void deposit(int amount ){
    _balance += amount;
  }
  void withdraw(int amount){
    if(_balance>amount){
      _balance -= amount;
  }
   else{
     print('you do not have enough balance');
    }
  }

 }