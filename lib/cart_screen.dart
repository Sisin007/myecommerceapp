import 'package:flutter/material.dart';
import '../app_state.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double discount = 0;

  double get total {
    double sum = AppState.cart.fold(0, (s, e) => s + e.price);
    return sum - (sum * discount / 100);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: AppState.cart.length,
              itemBuilder: (context, index) {
                final product = AppState.cart[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('₹${product.price}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        AppState.cart.remove(product);
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Discount (%)'),
              onChanged: (v) {
                setState(() {
                  discount = double.tryParse(v) ?? 0;
                });
              },
            ),
          ),
          SizedBox(height: 20,),
          Text('Total: ₹${total.toStringAsFixed(2)}'),
          SizedBox(height: 15,),
          SizedBox(
            width: double.infinity, 
  height: 55, 
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false, // user must tap OK
                  builder: (_) => AlertDialog(
                    title: const Text(
            'Order Confirmation',
            textAlign: TextAlign.center,
                    ),
                    content: const Text(
            'Your order has been confirmed!\n'
            'Processing now. Shipping details will follow soon.',
            textAlign: TextAlign.center,
                    ),
                    actionsAlignment: MainAxisAlignment.center,
                    actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // close dialog
              },style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text('OK', style: TextStyle(color: Colors.white),),
            ),
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange,),
              child: const Text('Checkout',style: TextStyle(color: Colors.white),),
            ),
          ),

        ],
      ),
    );
  }
}
