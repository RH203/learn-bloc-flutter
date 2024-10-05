part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();
}

class AddItemIntoCartEvent extends CartEvent {
  final DummyData data;

  const AddItemIntoCartEvent(this.data);
  @override
  List<Object> get props => [data];
}

class RemoveItemFromCartEvent extends CartEvent {
  final int id;
  const RemoveItemFromCartEvent(this.id);
  @override
  List<Object> get props => [id];
}
