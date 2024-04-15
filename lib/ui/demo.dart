// import 'package:carrimen_app/core/constants/const.dart';
// import 'package:carrimen_app/core/constants/text_styles.dart';
// import 'package:carrimen_app/ui/screens/categories/widgets/carri_categories.dart';
// import 'package:carrimen_app/ui/screens/home/widgets/home_appBar.dart';
// import 'package:carrimen_app/ui/screens/home/widgets/search_field.dart';
// import 'package:flutter/material.dart';

// class Categories extends StatefulWidget {
//   Categories({Key? key}) : super(key: key);

//   @override
//   _CategoriesState createState() => _CategoriesState();
// }

// final List<String> items = [
//   "Carri Cleaning",
//   "Carri Care",
//   "Carri Professional",
//   "Carri Digital",
//   "Carri Wallah",
//   "Carri Kitchen",
// ];
// final List<CategoriesItemModel> carriCleaningItem = [
//   CategoriesItemModel(
//       content: 'Home Cleaning',
//       image: 'assets/carri_cleaning/home_cleaning.svg'),
//   CategoriesItemModel(
//       content: 'Office Cleaning',
//       image: 'assets/carri_cleaning/office_cleaning.svg'),
//   CategoriesItemModel(
//       content: 'Industrial Cleaning',
//       image: 'assets/carri_cleaning/industry_cleaning.svg'),
//   CategoriesItemModel(
//       content: 'Crime Scene Cleaning',
//       image: 'assets/carri_cleaning/crime_scene_cleaning.svg'),
//   CategoriesItemModel(
//       content: 'Specialized Cleaning Service',
//       image: 'assets/carri_cleaning/flat.svg'),
//   CategoriesItemModel(
//       content: 'Vehicle Cleaning',
//       image: 'assets/carri_cleaning/vehicle_cleaning.svg'),
// ];
// final List<CategoriesItemModel> carriCareItem = [
//   CategoriesItemModel(
//       content: 'Nursing Care', image: 'assets/carri_care/nursing_care.svg'),
//   CategoriesItemModel(
//       content: 'Elderly Care', image: 'assets/carri_care/elderly_care.svg'),
//   CategoriesItemModel(
//       content: 'Child Care', image: 'assets/carri_care/child_care.svg'),
// ];

// final List<CategoriesItemModel> carriProfessionalItem = [
//   CategoriesItemModel(
//       content: 'Legal Services',
//       image: 'assets/carri_professional/legal_services.svg'),
//   CategoriesItemModel(
//       content: 'Counselling Services',
//       image: 'assets/carri_professional/counselling_services.svg'),
//   CategoriesItemModel(
//       content: 'Interior Design',
//       image: 'assets/carri_professional/interior_design.svg'),
//   CategoriesItemModel(
//       content: 'Plumbing', image: 'assets/carri_professional/plumbing.svg'),
//   CategoriesItemModel(
//       content: 'Painting', image: 'assets/carri_professional/painting.svg'),
//   CategoriesItemModel(
//       content: 'Pest Control',
//       image: 'assets/carri_professional/pest_control.svg'),
//   CategoriesItemModel(
//       content: 'Laundary', image: 'assets/carri_professional/laundary.svg'),
//   CategoriesItemModel(
//       content: 'Carpentry', image: 'assets/carri_professional/carpentry.svg'),
//   CategoriesItemModel(
//       content: 'Driving Services',
//       image: 'assets/carri_professional/driving_service.svg'),
//   CategoriesItemModel(
//       content: 'Wedding Photography',
//       image: 'assets/carri_professional/wedding_photography.svg'),
// ];

// final List<CategoriesItemModel> carridigitalItem = [
//   CategoriesItemModel(
//       content: 'Computer Repair',
//       image: 'assets/carri_digital/computer_repair.svg'),
//   CategoriesItemModel(
//       content: 'IT Support', image: 'assets/carri_digital/it_support.svg'),
//   CategoriesItemModel(
//     content: 'Schedule appointment',
//     image: 'assets/carri_digital/schedule_appoinment.svg',
//   ),
//   CategoriesItemModel(
//       content: 'Ticket booking',
//       image: 'assets/carri_digital/ticket_booking.svg'),
// ];

// final List<CategoriesItemModel> carriwallahItem = [
//   CategoriesItemModel(
//       content: 'Food Delivery Services',
//       image: 'assets/carri_wallah/food_delivery_service.svg'),
//   CategoriesItemModel(
//       content: 'Other Delivery Services',
//       image: 'assets/carri_wallah/other_delivery_service.svg'),
// ];

// final List<CategoriesItemModel> carrikitchenItem = [
//   CategoriesItemModel(
//       content: 'Meal Prepartion & Delivery',
//       image: 'assets/carri_kitchen/meal_preperation.svg'),
// ];


// class _CategoriesState extends State<Categories> {
//   late ScrollController _scrollController;
//   late ScrollController _listscrollController;
//   int selectedIndex = 0; // Variable to track the selected index
 


//   final List<GlobalKey> _categoryKeys = List.generate(
//     items.length,
//     (_) => GlobalKey(),
//   );

//   @override
//   void initState() {
//     super.initState();
//     _scrollController = ScrollController();
//     _listscrollController = ScrollController();
//     _scrollController.addListener(_scrollListener);
//   }

//   @override
//   void dispose() {
//     _scrollController.removeListener(_scrollListener);
//     _scrollController.dispose();
//     _listscrollController.dispose();
//     super.dispose();
//   }

//   double _calculateCategoryHeight(int index) {
//     final RenderBox renderBox =
//         _categoryKeys[index].currentContext!.findRenderObject() as RenderBox;
//     return renderBox.size.height;
//   }

//   void _scrollListener() {
//     // When the vertical scroll is changed, adjust the horizontal scroll accordingly
//     double offset = _scrollController.offset;
//     _listscrollController
//         .jumpTo(offset / 3); // Adjust based on your desired ratio

//     // Get the dimensions of the CarriCategory widgets
//     List<double> categoryHeights = _categoryKeys.map((key) {
//       final RenderBox renderBox =
//           key.currentContext!.findRenderObject() as RenderBox;
//       return renderBox.size.height;
//     }).toList();

//     // Calculate the section thresholds based on the accumulated heights of the categories
//     List<double> sectionThresholds =
//         List.generate(categoryHeights.length, (index) {
//       double totalHeight = 0;
//       for (int i = 0; i <= index; i++) {
//         totalHeight += categoryHeights[i];
//       }
//       return totalHeight;
//     });

//     // Check which section threshold is currently in view
//     int visibleSection =
//         sectionThresholds.indexWhere((threshold) => offset < threshold);

//     // Handle edge cases for the first and last sections
//     if (visibleSection == -1) {
//       if (offset < sectionThresholds.first) {
//         visibleSection = 0; // Scroll is at the top, select the first section
//       } else {
//         visibleSection = sectionThresholds.length -
//             1; // Scroll is at the bottom, select the last section
//       }
//     } else if (offset >= sectionThresholds.last) {
//       visibleSection = sectionThresholds.length -
//           1; // Scroll is beyond the last section, select the last section
//     }

//     // Update selectedIndex
//     if (selectedIndex != visibleSection) {
//       setState(() {
//         selectedIndex = visibleSection;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             HomeAppBar(),
//             VerticalSpacing(height: 24),
//             Padding(
//               padding: PaddingConstant.outerPadding,
//               child: SearchField(hintText: 'Search for services'),
//             ),
//             VerticalSpacing(height: 24),
//             SizedBox(
//               height: 49,
//               child: ListView.builder(
//                 controller: _listscrollController,
//                 scrollDirection: Axis.horizontal,
//                 itemCount: items.length,
//                 shrinkWrap: true,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: TextButton(
//                       onPressed: () {
//                         setState(() {
//                           selectedIndex = index; // Update the selected index
//                         });
//                         _scrollToCategory(index);
//                       },
//                       child: Text(
//                         items[index],
//                         style: index == selectedIndex
//                             ? TextStyles.medium11grey77.copyWith(
//                                 decoration: TextDecoration.underline,
//                               )
//                             : TextStyles.medium11grey77,
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 controller: _scrollController,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     CarriCategory(
//                       key: _categoryKeys[0],
//                       carriCategoryItem: carriCleaningItem,
//                       category: 'Carri Cleaning',
//                     ),
//                     CarriCategory(
//                       key: _categoryKeys[1],
//                       carriCategoryItem: carriCareItem,
//                       category: 'Carri Care',
//                     ),
//                     CarriCategory(
//                       key: _categoryKeys[2],
//                       carriCategoryItem: carriProfessionalItem,
//                       category: 'Carri Professional',
//                     ),
//                     CarriCategory(
//                       key: _categoryKeys[3],
//                       carriCategoryItem: carridigitalItem,
//                       category: 'Carri Digital Service',
//                     ),
//                     CarriCategory(
//                       key: _categoryKeys[4],
//                       carriCategoryItem: carriwallahItem,
//                       category: 'Carri Wallah',
//                     ),
//                     CarriCategory(
//                       key: _categoryKeys[5],
//                       carriCategoryItem: carrikitchenItem,
//                       category: 'Carri Kitchen',
//                     ),
//                     VerticalSpacing(height: 490)
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _scrollToCategory(int index) {
//     double totalHeight = 0;
//     for (int i = 0; i < index; i++) {
//       totalHeight += _calculateCategoryHeight(i);
//     }
//     _scrollController.animateTo(
//       totalHeight,
//       duration: Duration(milliseconds: 800),
//       curve: Curves.easeInOut,
//     );
//     _listscrollController.animateTo(
//       index * 84,
//       duration: Duration(milliseconds: 800),
//       curve: Curves.easeInOut,
//     );
//   }
// }
