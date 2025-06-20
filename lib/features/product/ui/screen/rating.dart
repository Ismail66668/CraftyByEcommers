import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating extends StatefulWidget {
  const Rating({super.key});
  static const String name = '/rating_screen';

  @override
  State<Rating> createState() => _RatingState();
}

double _rating = 0.0;

class _RatingState extends State<Rating> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Rating')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Rating: $_rating'),
            Center(
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
                setState(() {
                  _rating = rating;
                });
              },
            )),
          ],
        ));
  }
}
