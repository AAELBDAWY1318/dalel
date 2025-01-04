import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> data =[
      "Saladin", 
      "Old\nBooks", 
      "Napoleon", 
      "War", 
      "Islamic\nBooks", 
    ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            margin: const EdgeInsets.all(10.0),
            height: 40.0,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: const Row(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 15.0),
                Icon(Icons.search),
                Text("Search"),
              ],
            ),
          ),
          titleTextStyle: AppTextStyles.font14,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Recent",
                style: AppTextStyles.font14.copyWith(color: Colors.black),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 5,
                    // childAspectRatio: 0.9,
                  ),
                  itemBuilder: (context, index) => Container(
                    height: 10.0,
                    width: MediaQuery.of(context).size.width * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 20.0, 
                          color: Colors.grey, 
                          offset: Offset(8, 8)
                        )
                      ], 
                    ),
                    child: Center(
                      child: Text(
                        data[index],
                        textAlign: TextAlign.center, 
                      ),
                    ),
                  ),
                  itemCount: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
