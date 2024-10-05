import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cart_bloc/model/detail_cart.dart';
import 'package:cart_bloc/model/dummy_data.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState()) {
    on<AddItemIntoCartEvent>(_addItemIntoCart);
    on<RemoveItemFromCartEvent>(_removeItemFromCart);
  }

  void _addItemIntoCart(AddItemIntoCartEvent event, Emitter<CartState> emit) {
    // Clone list detail cart terbaru
    final List<DetailCart> updatedCart = List<DetailCart>.from(state.dataCart);

    // Menemukan apakah data ini ada dalam list, dan mengembalikan indexnya.
    final existingItemIndex =
        updatedCart.indexWhere((item) => item.data.id == event.data.id);

    // Cek apakah isItemInCart true kalau enggak maka jumlah item dimulai dari 1
    // Tapi kalau engga maka item dijumlahkan dengan jumlah item X dengan 1.

    if (existingItemIndex != -1) {
      // Kalau item ada count + 1
      final updatedItem = updatedCart[existingItemIndex];
      updatedCart[existingItemIndex] = DetailCart(
        data: updatedItem.data,
        count: updatedItem.count + 1,
      );
    } else {
      updatedCart.add(DetailCart(
        data: event.data,
        count: 1,
      ));
    }

    final totalItem = updatedCart.fold(0, (sum, item) => sum + item.count);
    emit(CartState(dataCart: updatedCart, totalItem: totalItem));
  }

  void _removeItemFromCart(
      RemoveItemFromCartEvent event, Emitter<CartState> emit) {
    // Clone list detail cart terbaru
    final List<DetailCart> updatedCart = List<DetailCart>.from(state.dataCart);

    // Menemukan apakah item berada diarray, dan mengembalikan index
    final existingItemIndex =
        updatedCart.indexWhere((item) => item.data.id == event.id);

    if (existingItemIndex != -1) {
      // MEndapatkan item yang berada pada list berdasarkan index X
      final currentItem = updatedCart[existingItemIndex];

      if (currentItem.count > 1) {
        // Kalau count lebih besar dari 1, maka dikurangi 1. Agar tidak ada nilai minus
        updatedCart[existingItemIndex] = DetailCart(
          data: currentItem.data,
          count: currentItem.count - 1,
        );
      } else {
        // apa bila count 1 maka dihapus dari list
        updatedCart.removeAt(existingItemIndex);
      }
    }

    // Menghitung ulang total item
    final totalItem = updatedCart.fold(0, (sum, item) => sum + item.count);

    // Perbarui state
    emit(CartState(dataCart: updatedCart, totalItem: totalItem));
  }
}
