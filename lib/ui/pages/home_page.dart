part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Customer> customerList = [];

  Future refreshList() async {
    customerList.clear();
    customerList = await CustomerDatabase.instance.readAllItems();
    setState(() {});
  }

  @override
  void initState() {
    refreshList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: cream,
        appBar: AppBar(
          title: Text(
            'Customer List',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              color: Colors.grey[800],
            ),
          ),
          backgroundColor: cream,
          actions: [
            IconButton(
              onPressed: () => Get.to(const AddCustomer()),
              icon: const Icon(
                Icons.add,
                size: 30,
              ),
            ),
          ],
        ),
        body: customerList.isEmpty
            ? EmptyWidget(size: size)
            : ListView.builder(
          itemCount: customerList.length,
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) {
            return CustomerCard(
              onClick: () => Get.to(() => CustomerDetailPage(
                customer: customerList[index],
              )),
              name:
              '${customerList[index].custFirstName!.capitalize} ${customerList[index].custSurname!.capitalize}',
              initial:
              '${customerList[index].custFirstName![0].capitalize}${customerList[index].custSurname![0].capitalize}',
              email: customerList[index].custEmail!,
              phone: customerList[index].custPhone!,
            );
          },
        ));
  }
}
