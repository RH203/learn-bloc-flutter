part of 'cart_bloc.dart';

final class CartState extends Equatable {
  const CartState({this.dataCart = const <DetailCart>[], this.totalItem = 0})
      : lengthData = dataCart.length;

  final List<DetailCart> dataCart;
  final int totalItem;
  final int lengthData;

  @override
  List<Object> get props => [dataCart, totalItem];
}
