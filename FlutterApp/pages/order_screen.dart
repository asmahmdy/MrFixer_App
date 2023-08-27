import 'package:flutter/material.dart';
import 'package:myapp/pages/banking.dart';

class OrderScreen extends StatefulWidget {
  final String ndevice;
  final String image;
  final int sellPrice;
  const OrderScreen({
    super.key,
    required this.ndevice,
    required this.image,
    required this.sellPrice,
  });

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Product"),
        backgroundColor: Color.fromRGBO(11, 74, 126, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: ListView(children: [
          Container(
            child: Row(children: [
              Image.network(
                "${widget.image}",
                fit: BoxFit.fill,
                height: 100,
                width: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.ndevice),
                    Text('Selling Price : ${widget.sellPrice}'),
                  ],
                ),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 500),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(
                            Color.fromARGB(255, 3, 68, 121))),
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Banking())),
                    icon: Icon(
                      Icons.payment_outlined,
                      color: Colors.white,
                    ),
                    label: Text("Mobile Banking"),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
