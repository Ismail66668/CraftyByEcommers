import 'package:flutter/material.dart';

class AddRivewsScreen extends StatefulWidget {
  const AddRivewsScreen({super.key});
  static const String name = '/add_review_screen';

  @override
  State<AddRivewsScreen> createState() => _AddRivewsScreenState();
}

class _AddRivewsScreenState extends State<AddRivewsScreen> {
  final TextEditingController _reviewController = TextEditingController();
  final GlobalKey<FormState> _reviewFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Review'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _reviewFormKey,
          child: Column(
            children: [
              TextFormField(
                controller: _reviewController,
                maxLines: 10,
                decoration: const InputDecoration(
                  hintText: 'Write your review here',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Handle submit review
                },
                child: const Text('Submit Review'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }
}
