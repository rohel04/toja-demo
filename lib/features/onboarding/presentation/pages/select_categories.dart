import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:toja_demo/colors_util.dart';
import 'package:toja_demo/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:toja_demo/features/onboarding/presentation/pages/select_distance.dart';
import 'package:toja_demo/features/onboarding/presentation/provider/category_provider.dart';

import '../../../../injection_container.dart';
import '../../domain/entities/category.dart';

class SelectCategoriesScreen extends StatefulWidget {
  const SelectCategoriesScreen({Key? key}) : super(key: key);

  @override
  State<SelectCategoriesScreen> createState() => _SelectCategoriesScreenState();
}

class _SelectCategoriesScreenState extends State<SelectCategoriesScreen> {
  bool select_all = false;
  List<Category> checked_items = [];

  List<Category> categories = [
    new Category(
        id: 1,
        title: 'Travel & Leisure',
        image: 'travel.jpg',
        isSelected: false),
    new Category(
        id: 2, title: 'Sweet Treats', image: 'sweet.jpg', isSelected: false),
    new Category(
        id: 3,
        title: 'Health & Fitness',
        image: 'fitness.jpg',
        isSelected: false),
    new Category(
        id: 4, title: 'Hair & Beauty', image: 'beauty.jpg', isSelected: false),
    new Category(
        id: 5, title: 'Food & Drink', image: 'food.jpg', isSelected: false),
    new Category(
        id: 6, title: 'Nightlife', image: 'night.jpg', isSelected: false),
    new Category(
        id: 7, title: 'Home & Garden', image: 'garden.jpg', isSelected: false),
    new Category(
        id: 8,
        title: 'Freelancers',
        image: 'freelancer.jpg',
        isSelected: false),
    new Category(
        id: 9,
        title: 'Style & Fashion',
        image: 'fashion.jpg',
        isSelected: false),
  ];

  onAllCliked() {
    final newValue = !select_all;
    setState(() {
      select_all = newValue;
      categories.forEach((element) {
        element.isSelected = newValue;
      });
    });
  }

  int getCheckedItems() {
    checked_items =
        categories.where((element) => element.isSelected == true).toList();
    checked_items.forEach((element) {
      print(element.title);
    });
    return checked_items.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Catagories'),
        actions: [
          Row(
            children: [
              Text(
                'Select all',
                style: TextStyle(fontSize: 16),
              ),
              Checkbox(
                  value: this.select_all,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  side: MaterialStateBorderSide.resolveWith(
                    (states) => BorderSide(width: 2.0, color: Colors.white),
                  ),
                  activeColor: Colors.white,
                  checkColor: ColorUtil.kAuthColor,
                  onChanged: (value) {
                    onAllCliked();
                  })
            ],
          )
        ],
      ),
      body: BlocProvider(
        create: (context)=>sl<OnboardingBloc>(),
        child: BlocConsumer<OnboardingBloc,OnboardingState>(
          listener: (context,state){
            if(state is OnboardingSuccess){

            }
          },
          builder:(context,state)=> Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(5, 10, 0, 25),
                    child: Row(children: [
                      Text(
                        'Please select at least ',
                        style: TextStyle(color: ColorUtil.kAuthColor, fontSize: 16),
                      ),
                      Text(
                        '3 categories',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorUtil.kAuthColor,
                            fontSize: 16),
                      ),
                    ])),
                Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      physics: BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    'assets/images/categories/${categories[index].image}')),
                          ),
                          child: Stack(children: [
                            Container(
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      categories[index].isSelected
                                          ? Color(0xFF28214F).withOpacity(0.7)
                                          : Color(0xFF4A4A4A).withOpacity(0.4),
                                      categories[index].isSelected
                                          ? Color(0xFF28214F).withOpacity(0.7)
                                          : Color(0xFF111111).withOpacity(0.6)
                                    ]),
                                    borderRadius: BorderRadius.circular(10)),
                                height: double.infinity,
                                child: CheckboxListTile(
                                  activeColor: Colors.white,
                                  checkColor: ColorUtil.kAuthColor,
                                  selected: false,
                                  value: categories[index].isSelected,
                                  onChanged: (value) {
                                    setState(() {
                                      categories[index].isSelected = value!;
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2.0),
                                  ),
                                  side: MaterialStateBorderSide.resolveWith(
                                    (states) =>
                                        BorderSide(width: 2.0, color: Colors.white),
                                  ),
                                )),
                            Positioned(
                                bottom: 0,
                                child: Container(
                                    margin: EdgeInsets.fromLTRB(15, 0, 15, 20),
                                    child: Text(
                                      '${categories[index].title}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    )))
                          ]),
                        );
                      }),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '1',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: ColorUtil.kAuthColor),
                          ),
                          Text(
                            '/3',
                            style: TextStyle(color: ColorUtil.kAuthTextColor),
                          )
                        ],
                      ),
                      ChangeNotifierProvider<CategoryProvider>(
                        create: (context) => CategoryProvider(),
                        child: Consumer<CategoryProvider>(builder: (context, provider, child) {
                          return InkWell(
                            onTap: () {
                              checked_items=categories.where((element) => element.isSelected==true).toList();
                              provider.checkValidation(checked_items.length);
                              if(provider.isValid){
                                context.read<OnboardingBloc>().add(SetCategoryEvent(category:checked_items));
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectDistanceScreen()));
                              }
                              if(!provider.isValid){
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please select at least 3 categories'),backgroundColor: Colors.red,));
                              }
                            },
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Continue',
                                    style: TextStyle(
                                        fontSize: 18, color: ColorUtil.kAuthColor),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: ColorUtil.kAuthColor,
                                  )
                                ]),
                          );
                        }),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
