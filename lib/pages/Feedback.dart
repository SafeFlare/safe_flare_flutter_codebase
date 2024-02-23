import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  TextEditingController _FeedbackPageController = TextEditingController();
  double _rating = 0;
  // String _selectedOption = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback Page', style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
        backgroundColor: const Color(0xffd0f288),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Feel free to give us a feedback :',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: _FeedbackPageController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Enter your Feedback here',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Liked our app? consider giving us a rate',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            RatingBar.builder(
              initialRating: _rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
            SizedBox(height: 20),
            // Text(
            //   'Dropdown:',
            //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            // ),
            // DropdownButton<String>(
            //   value: _selectedOption,
            //   onChanged: (String? newValue) {
            //     setState(() {
            //       _selectedOption = newValue!;
            //     });
            //   },
            //   items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
            //       .map<DropdownMenuItem<String>>((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            // ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Process the FeedbackPage
                String FeedbackPageText = _FeedbackPageController.text;
                // You can now use FeedbackPageText, _rating, _selectedOption for further processing
                print('FeedbackPage: $FeedbackPageText');
                print('Rating: $_rating');
              },
              child: Text('Submit Feedback', style: TextStyle(color: Colors.black), maxLines: 1),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xffd0f288),
                fixedSize: Size(MediaQuery.of(context).size.width, 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
