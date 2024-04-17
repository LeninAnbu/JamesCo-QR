class queuemodel{
  String? objecttype;
  String cardcode;
  String cardname;
  String customername;
  String? amount;
  String Trans;
  String custCode;
  String? MobileNo;
  queuemodel({
    required this.custCode,
    required this.Trans,
    required this.amount,
    required this.customername,
    this.objecttype,
    required this.cardcode,
    this.MobileNo,
    required this.cardname
    
  });
} 