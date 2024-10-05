import 'package:equatable/equatable.dart';

class DummyData extends Equatable {
  final int id;
  final String title, description, pathImage;
  final List<String> color;

  const DummyData({
    required this.id,
    required this.title,
    required this.description,
    required this.pathImage,
    required this.color,
  });

  @override
  List<Object> get props => [title, description, pathImage, color];
}
