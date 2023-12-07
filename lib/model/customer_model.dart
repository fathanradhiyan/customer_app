final String tableCustomers = 'customers';

class CustomerFields {
  static final List<String> values = [
    custId, custFirstName, custSurname, custNik, custEmail, custPhone, custAddress
  ];

  static final String custId = 'CustId';
  static final String custFirstName = 'CustFirstName';
  static final String custSurname = 'CustSurname';
  static final String custNik = 'CustNik';
  static final String custEmail = 'CustEmail';
  static final String custPhone = 'CustPhone';
  static final String custAddress = 'CustAddress';
}

class Customer {
  final int? custId;
  final String? custFirstName;
  final String? custSurname;
  final String? custNik;
  final String? custEmail;
  final String? custPhone;
  final String? custAddress;

  const Customer(
      {this.custId,
      this.custFirstName,
      this.custSurname,
      this.custNik,
      this.custEmail,
      this.custPhone,
      this.custAddress});

  Customer copy({
    int? custId,
    String? custFirstName,
    String? custSurname,
    String? custNik,
    String? custEmail,
    String? custPhone,
    String? custAddress,
}) =>
  Customer(
    custId: custId ?? this.custId,
    custFirstName: custFirstName ?? this.custFirstName,
    custSurname: custSurname ?? this.custSurname,
    custNik: custNik ?? this.custNik,
    custEmail: custEmail ?? this.custEmail,
    custPhone: custPhone ?? this.custPhone,
    custAddress: custAddress ?? this.custAddress,
  );

  static Customer fromJson(Map<String, Object?> json) => Customer(
    custId: json[CustomerFields.custId] as int?,
      custFirstName: json[CustomerFields.custFirstName] as String?,
      custSurname: json[CustomerFields.custSurname] as String?,
    custNik: json[CustomerFields.custNik] as String?,
    custEmail: json[CustomerFields.custEmail] as String?,
    custPhone: json[CustomerFields.custPhone] as String?,
    custAddress: json[CustomerFields.custAddress] as String?
  );

  Map<String, Object?> toJson() => {
    CustomerFields.custId: custId,
    CustomerFields.custFirstName: custFirstName,
    CustomerFields.custSurname: custSurname,
    CustomerFields.custNik: custNik,
    CustomerFields.custEmail: custEmail,
    CustomerFields.custPhone: custPhone,
    CustomerFields.custAddress: custAddress,
  };
}
