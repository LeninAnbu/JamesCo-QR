class SapConsumeQueue {
  String? objectType;

  String? pa;
  String? amount;
  String? tn;
  String? pn; 
  String? CardCode;
  String? CardName;
  String? MobileNo;
  

  SapConsumeQueue(
      {
        required this.pa,
        required this.tn,
        required this.amount,
        required this.pn,
        this.CardCode,
        this.CardName,
        this.objectType,
         this.MobileNo,
        });

  factory SapConsumeQueue.fromjson(Map<String, dynamic> resp) {
    return SapConsumeQueue(
        pa: resp['pa'].toString(),
        tn: resp['tn'].toString(),
        amount: resp['Amount'].toString() ,
        pn: resp['pn'].toString(),
        objectType: resp['ObjectType'].toString(),
        CardCode: resp['CardCode'].toString(),
        CardName: resp['CardName'].toString(),
        MobileNo: resp['MobileNo'].toString()
        );
  }
}
