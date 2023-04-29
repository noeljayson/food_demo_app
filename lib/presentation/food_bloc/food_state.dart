
import 'package:equatable/equatable.dart';

import '../../model/foodmodel.dart';


class FoodState extends Equatable {
  @override
  List<Object> get props => [];
}

class FoodInitialState extends FoodState {
  @override
  List<Object> get props => [];
}

class FoodLoadingState extends FoodState {
  @override
  List<Object> get props => [];
}

class FoodLoadedState extends FoodState {
  final List<FoodModel> foodModel;

  FoodLoadedState({required this.foodModel});

  @override
  List<Object> get props => [];
}

class FoodErrorState extends FoodState {
  String message;

  FoodErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
