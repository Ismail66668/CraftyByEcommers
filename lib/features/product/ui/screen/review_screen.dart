import 'package:flutter/material.dart';
import 'package:ostad_ecommers_app/app/app_colors.dart';
import 'package:ostad_ecommers_app/features/product/ui/screen/add_rivew_screen.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});
  static const String name = '/review_screen';

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review'),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: 15,
            itemBuilder: (context, index) {
              return ListTile(
                title: Row(
                  children: [
                    const CircleAvatar(
                      radius: 5,
                      backgroundImage: NetworkImage(
                          'https://i.pinimg.com/564x/3c/0f/1b/3c0f1b6d2e4a5d8e7f9a2c8b4c5f6b7d.jpg'),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Ismail Hossain',
                      style: TextStyle(
                          fontSize: 20,
                          color: AppColors.themeColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                subtitle: const Text(
                  'hello this shart is very nice and it dff',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              );
            },
          )),
          GestureDetector(
            onTap: () {
              // Handle write review tap
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: AppColors.themeColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8.0)),
              child: const Center(
                child: Text(
                  'Write a review...',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addReview,
        child: const Icon(Icons.add),
        backgroundColor: AppColors.themeColor,
      ),
    );
  }

  void _addReview() {
    Navigator.pushNamed(context, AddRivewsScreen.name);
  }
  // Logic to add a review
}
