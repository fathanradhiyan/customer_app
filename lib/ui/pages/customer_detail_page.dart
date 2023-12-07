part of 'pages.dart';

class CustomerDetailPage extends StatelessWidget {
  final Customer customer;
  const CustomerDetailPage({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cream,
      appBar: AppBar(
        title: Text('Customer Detail', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1, color: Colors.grey[800]),),
        backgroundColor: cream,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: borderGrey,
              radius: 60,
              child: Text(
                '${customer.custFirstName![0].capitalize}${customer.custSurname![0].capitalize}',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12,),
            Text('${customer.custFirstName!.capitalize} ${customer.custSurname!.capitalize}', textAlign: TextAlign.center, style: const TextStyle(fontSize: 24),),
            Text(customer.custEmail!),
            const SizedBox(height: 24,),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(SharedString.nik, style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(customer.custNik!),
                  const SizedBox(height: 12,),
                  const Text(SharedString.phoneNum, style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(customer.custPhone!),
                  const SizedBox(height: 12,),
                  const Text(SharedString.address, textAlign: TextAlign.justify, style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(customer.custAddress!),
                ],
              ),
            ),
            const Spacer(),
            Container(
              color: cream,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () => customPopup(
                              context,
                            title: const Text(SharedString.warning),
                            content: const Text(SharedString.confirmDelete),
                            onCancel: ()=>Get.back(),
                            onOk: () {
                                _delete(context);
                                Get.back();
                            }
                          ),
                              // _delete(context),
                          style: ElevatedButton.styleFrom(
                              elevation: 2, backgroundColor: peach),
                          child:
                          const Text(
                            SharedString.delete,
                            style: TextStyle(letterSpacing: 1, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16,),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () => Get.to(()=> AddCustomer(isUpdate: true, customer: customer,)),
                          style: ElevatedButton.styleFrom(
                              elevation: 2, backgroundColor: peach),
                          child:
                          const Text(
                            SharedString.edit,
                            style: TextStyle(letterSpacing: 1, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _delete(BuildContext context) async {
    try {
      await CustomerDatabase.instance.delete(
          customer.custId!);
      Get.offAll(()=> const HomePage());
      SharedDialog.successSnackBar(
          SharedString.success, SharedString.successDelete);
    } catch (e) {
      print(e.toString());
      ///check connection
      SharedDialog.errorSnackBar(
          SharedString.failed, SharedString.connectionFailed);
    }
  }
}
