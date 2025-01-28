import 'package:equatable/equatable.dart';

class DesignModel extends Equatable {
  final String folder;
  final String name;
  final int count;
  final List<String> words;

  const DesignModel({
    required this.count,
    required this.folder,
    required this.name,
    required this.words,
  });

  @override
  List<Object?> get props => [folder, name];
}
