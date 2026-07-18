part of 'add_service_bloc.dart';


abstract class AddServiceEvent extends Equatable {
  const AddServiceEvent();

  @override
  List<Object?> get props => [];
}

class AddServiceSubmitEvent extends AddServiceEvent {
  final String title;
  final String description;
  final List<String> images;
  final List<String> keywords;
  final double priceMin;
  final double priceMax;

  const AddServiceSubmitEvent({
    required this.title,
    required this.description,
    required this.images,
    required this.keywords,
    required this.priceMin,
    required this.priceMax,
  });

  @override
  List<Object?> get props => [
        title,
        description,
        images,
        keywords,
        priceMin,
        priceMax,
      ];
}
