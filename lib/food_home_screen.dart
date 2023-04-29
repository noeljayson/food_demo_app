import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_demo_app/presentation/food_bloc/food_bloc.dart';
import 'package:food_demo_app/presentation/food_bloc/food_event.dart';
import 'package:food_demo_app/presentation/food_bloc/food_state.dart';

class FoodHomeScreen extends StatefulWidget {
  const FoodHomeScreen({Key? key}) : super(key: key);

  @override
  State<FoodHomeScreen> createState() => _FoodHomeScreenState();
}

class _FoodHomeScreenState extends State<FoodHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FoodBloc()..add(FetchFoodEvent()),
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<FoodBloc, FoodState>(builder: (context, state) {
            if (state is FoodLoadedState) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: const Color(0xffFF5F99),
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Center(
                                child: Icon(Icons.person),
                              ),
                            ),
                            const Icon(
                              Icons.shopping_bag,
                              color: Colors.pinkAccent,
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Hello Boys!",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              "What flavour do you want today?",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          state.foodModel.first.restaurantName,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: Expanded(
                          child: Column(
                              children: List.generate(state.foodModel.length,
                                  (index) {
                            return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  state.foodModel[index].tableMenuList.length,
                              itemBuilder: (context, index2) {
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          state
                                              .foodModel[index]
                                              .tableMenuList[index2]
                                              .menuCategory,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          child: const Text(
                                            "See all",
                                            style: TextStyle(
                                              color: Color(0xffFF5F99),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: List.generate(
                                          state
                                              .foodModel[index]
                                              .tableMenuList[index2]
                                              .categoryDishes
                                              .length, (index3) {
                                        return Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 100,
                                              height: 100,
                                              padding: const EdgeInsets.all(10),
                                              margin: const EdgeInsets.only(
                                                  bottom: 13),
                                              decoration: BoxDecoration(
                                                color: const Color(0xffFBCEDC),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Image.network(
                                                "https://img.freepik.com/free-photo/table-two-food-photography-recipe-idea_53876-47154.jpg",
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            SizedBox(
                                              height: 100,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  state
                                                              .foodModel[index]
                                                              .tableMenuList[
                                                                  index2]
                                                              .categoryDishes[
                                                                  index3]
                                                              .dishName
                                                              .length >
                                                          25
                                                      ? Text(
                                                          "${state.foodModel[index].tableMenuList[index2].categoryDishes[index3].dishName.substring(0, 23)}..",
                                                          style:
                                                              const TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 16,
                                                          ),
                                                        )
                                                      : Text(
                                                          state
                                                              .foodModel[index]
                                                              .tableMenuList[
                                                                  index2]
                                                              .categoryDishes[
                                                                  index3]
                                                              .dishName,
                                                          style:
                                                              const TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                  Text(
                                                    "\$${state.foodModel[index].tableMenuList[index2].categoryDishes[index3].dishPrice}",
                                                    style: const TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                    textAlign: TextAlign.start,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      }),
                                    ),
                                  ],
                                );
                              },
                            );
                          })),
                        ),
                      )
                    ],
                  ),
                ),
              );
            } else if (state is FoodErrorState) {
              print(state.message);
              Fluttertoast.showToast(msg: state.message);
              return Container();
            } else {
              return Container();
            }
          }),
        ),
      ),
    );
  }
}
