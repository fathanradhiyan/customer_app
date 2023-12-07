part of 'pages.dart';

class AddCustomer extends StatefulWidget {
  final bool? isUpdate;
  final Customer? customer;

  const AddCustomer({super.key, this.isUpdate = false, this.customer});

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  TextEditingController? _firstnameController;
  TextEditingController? _surnameController;
  TextEditingController? _nikController;
  TextEditingController? _emailController;
  TextEditingController? _phoneController;
  TextEditingController? _addressController;

  bool? _isSubmit;

  bool isEmailValid(String email) {
    String emailRegex =
        r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$';
    RegExp regex = RegExp(emailRegex);
    return regex.hasMatch(email);
  }

  bool isPhoneNumberValid(String phoneNumber) {
    String phoneRegex = r'^\d{10,13}$';
    RegExp regex = RegExp(phoneRegex);
    return regex.hasMatch(phoneNumber);
  }

  @override
  void initState() {
    // TODO: implement initState
    _firstnameController = TextEditingController();
    _surnameController = TextEditingController();
    _nikController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _addressController = TextEditingController();

    if (widget.isUpdate!) {
      _firstnameController!.text = widget.customer!.custFirstName!;
      _surnameController!.text = widget.customer!.custSurname!;
      _nikController!.text = widget.customer!.custNik!;
      _emailController!.text = widget.customer!.custEmail!;
      _phoneController!.text = widget.customer!.custPhone!;
      _addressController!.text = widget.customer!.custAddress!;
    }

    _isSubmit = false;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: cream,
        appBar: AppBar(
          title: Text(
            widget.isUpdate! ? 'Update Customer' : 'Add New Customer',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                color: Colors.grey[800]),
          ),
          backgroundColor: cream,
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    textBox(
                      title: SharedString.firstname,
                      isImportant: true,
                      child: TextField(
                          keyboardType: TextInputType.text,
                          controller: _firstnameController,
                          maxLines: 1,
                          maxLength: 30,
                          decoration: const InputDecoration(
                            counterText: "",
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 8),
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: SharedString.firstnameHint,
                          )),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    textBox(
                      title: SharedString.surname,
                      isImportant: true,
                      child: TextField(
                          keyboardType: TextInputType.text,
                          controller: _surnameController,
                          maxLines: 1,
                          maxLength: 30,
                          decoration: const InputDecoration(
                            counterText: "",
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 8),
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: SharedString.surname,
                          )),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    textBox(
                      title: SharedString.nik,
                      child: TextField(
                          keyboardType: TextInputType.number,
                          controller: _nikController,
                          maxLines: 1,
                          maxLength: 16,
                          decoration: const InputDecoration(
                            counterText: "",
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 8),
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: SharedString.nikHint,
                          )),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    textBox(
                      title: SharedString.email,
                      isImportant: true,
                      child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          maxLines: 1,
                          maxLength: 30,
                          decoration: const InputDecoration(
                            counterText: "",
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 8),
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: SharedString.emailHint,
                          )),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    textBox(
                      title: SharedString.phoneNum,
                      isImportant: true,
                      child: TextField(
                          keyboardType: TextInputType.number,
                          controller: _phoneController,
                          maxLines: 1,
                          maxLength: 13,
                          decoration: const InputDecoration(
                            counterText: "",
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 8),
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: SharedString.phoneHint,
                          )),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    textBox(
                      title: SharedString.address,
                      child: TextField(
                          keyboardType: TextInputType.text,
                          controller: _addressController,
                          maxLines: 3,
                          maxLength: 255,
                          decoration: const InputDecoration(
                            counterText: "",
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 0, vertical: 8),
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.grey),
                            hintText: SharedString.addressHint,
                          )),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: cream,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      (_firstnameController!.text.isNotEmpty &&
                              _surnameController!.text.isNotEmpty &&
                          isEmailValid(_emailController!.text) &&
                          isPhoneNumberValid(_phoneController!.text))
                          ? widget.isUpdate!
                              ? _update(context)
                              : _submit(context)
                          : SharedDialog.errorSnackBar(
                              SharedString.failed, SharedString.invalidEntry);
                      print(
                          ' ${_firstnameController!.text.isNotEmpty && _surnameController!.text.isNotEmpty && _emailController!.text.isNotEmpty && _phoneController!.text.isNotEmpty} name: ${_firstnameController!.text} ${_surnameController!.text}, email: ${_emailController!.text}, phone: ${_phoneController!.text}');
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 2, backgroundColor: peach),
                    child: Text(
                      widget.isUpdate! ? SharedString.update : SharedString.submit,
                      style: const TextStyle(letterSpacing: 1, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Future<void> _submit(BuildContext context) async {
    setState(() {
      _isSubmit = true;
    });

    if (_nikController!.text.length != 16) {
      SharedDialog.errorSnackBar(
        SharedString.failed,
        'NIK must be 16 characters long',
      );
      return;
    }

    try {
      await CustomerDatabase.instance.create(Customer(
          custFirstName: _firstnameController!.text,
          custSurname: _surnameController!.text,
          custNik: _nikController!.text,
          custPhone: _phoneController!.text,
          custEmail: _emailController!.text,
          custAddress: _addressController!.text));
      setState(() {
        _firstnameController!.clear();
        _surnameController!.clear();
        _nikController!.clear();
        _phoneController!.clear();
        _emailController!.clear();
        _addressController!.clear();
      });
      Get.offAll(() => const HomePage());
      SharedDialog.successSnackBar(
          SharedString.success, SharedString.successEntry);
    } catch (e) {
      print(e.toString());

      ///check connection
      SharedDialog.errorSnackBar(
          SharedString.failed, SharedString.connectionFailed);
      setState(() {
        _isSubmit = false;
      });
    }
  }

  Future<void> _update(BuildContext context) async {
    setState(() {
      _isSubmit = true;
    });

    if (_nikController!.text.length != 16) {
      SharedDialog.errorSnackBar(
        SharedString.failed,
        'NIK must be 16 characters long',
      );
      return;
    }

    try {
      log("${Customer(custFirstName: _firstnameController!.text, custSurname: _surnameController!.text, custNik: _nikController!.text, custPhone: _phoneController!.text, custEmail: _emailController!.text, custAddress: _addressController!.text).toJson()}");
      await CustomerDatabase.instance
          .update(Customer(
              custId: widget.customer!.custId,
              custFirstName: _firstnameController!.text,
              custSurname: _surnameController!.text,
              custNik: _nikController!.text,
              custPhone: _phoneController!.text,
              custEmail: _emailController!.text,
              custAddress: _addressController!.text))
          .then((value) => {
                setState(() {
                  _firstnameController!.clear();
                  _surnameController!.clear();
                  _nikController!.clear();
                  _phoneController!.clear();
                  _emailController!.clear();
                  _addressController!.clear();
                }),
                Get.offAll(() => const HomePage()),
                SharedDialog.successSnackBar(
                    SharedString.success, SharedString.updated)
              });
    } catch (e) {
      print(e.toString());

      ///check connection
      SharedDialog.errorSnackBar(
          SharedString.failed, SharedString.connectionFailed);
      setState(() {
        _isSubmit = false;
      });
    }
  }
}
