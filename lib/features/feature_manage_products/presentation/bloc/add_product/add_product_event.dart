part of 'add_product_bloc.dart';

abstract class AddProductEvent extends Equatable {
  const AddProductEvent();

  @override
  List<Object?> get props => [];
}

class FetchCategoriesEvent extends AddProductEvent {
  const FetchCategoriesEvent();
}

class AddProductSubmitEvent extends AddProductEvent {
  final String title;
  final String description;
  final List<String> images;
  final List<String> keywords;
  final double price;
  final int stock;
  final int maxPurchaseQuantity;
  final String? categoryId;

  const AddProductSubmitEvent({
    required this.title,
    required this.description,
    required this.images,
    required this.keywords,
    required this.price,
    required this.stock,
    required this.maxPurchaseQuantity,
    this.categoryId,
  });

  @override
  List<Object?> get props => [
        title,
        description,
        images,
        keywords,
        price,
        stock,
        maxPurchaseQuantity,
        categoryId,
      ];
}
