import 'package:cart_bloc/model/dummy_data.dart';
import 'package:equatable/equatable.dart';

class DetailCart extends Equatable {
  final DummyData data;
  final int count;

  const DetailCart({
    required this.data,
    required this.count,
  });

  @override
  List<Object> get props => [data, count];
}
