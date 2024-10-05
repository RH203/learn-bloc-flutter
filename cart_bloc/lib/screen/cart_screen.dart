import 'package:cart_bloc/cart_bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartBloc = context.read<CartBloc>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: const Text(
          "Cart",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.lengthData > 0) {
            return ListView.builder(
              itemCount: state.lengthData,
              itemBuilder: (context, index) {
                final data = state.dataCart[index];
                return ListTile(
                  title: Text(data.data.title),
                  leading: Text(
                    data.count.toString(),
                  ),
                  trailing: IconButton(
                    onPressed: () =>
                        cartBloc.add(RemoveItemFromCartEvent(data.data.id)),
                    icon: const Icon(Icons.remove),
                  ),
                );
              },
            );
          }
          return const Center(
            child: Text("You haven’t added anything to your cart"),
          );
        },
      ),
    );
  }
}
