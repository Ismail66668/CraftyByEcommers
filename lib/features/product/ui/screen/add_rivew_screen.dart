import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
    double reviewRating = 0.0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Review'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _reviewFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Rate the product',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ListenableBuilder(
                  listenable: ValueNotifier(reviewRating),
                  builder: (context, _) => Center(
                      child: RatingBar.builder(
                    initialRating: 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      reviewRating = rating;

                      setState(() {});
                    },
                  )),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Write your review for the product',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16.0),
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
      ),
    );
  }

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }
}
