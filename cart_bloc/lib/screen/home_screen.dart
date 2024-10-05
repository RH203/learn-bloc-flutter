import 'package:cart_bloc/cart_bloc/cart_bloc.dart';
import 'package:cart_bloc/data/data.dart';
import 'package:cart_bloc/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartBloc = context.read<CartBloc>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: const Text(
          "Cart App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state.totalItem != 0) {
                return Badge(
                  label: Text("${state.totalItem}"),
                  alignment: Alignment.topLeft,
                  child: IconButton.outlined(
                    onPressed: () => context.push('/cart'),
                    icon: const Icon(Icons.shopping_cart),
                  ),
                );
              }
              return IconButton.outlined(
                onPressed: () => context.push('/cart'),
                icon: const Icon(Icons.shopping_cart),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: dummyDataList.length,
          itemBuilder: (context, index) {
            final data = dummyDataList[index];
            return Stack(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Image.asset(
                          data.pathImage,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Text(data.title)
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: IconButton(
                    onPressed: () => cartBloc.add(AddItemIntoCartEvent(data)),
                    style: IconButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondaryContainer),
                    icon: const Icon(Icons.add),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
