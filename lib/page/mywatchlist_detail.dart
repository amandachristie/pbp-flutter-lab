import 'package:flutter/material.dart';
import 'package:counter_7/utility/drawer.dart';
import 'package:counter_7/model/mywatchlist.dart';
import 'package:intl/intl.dart';

class MyWatchListDetailPage extends StatelessWidget {
  final MyWatchList myWatchList;
  const MyWatchListDetailPage({super.key, required this.myWatchList});

  @override
  Widget build(BuildContext context) {
    // String reviewText = Text("Review");
    final titleMyWatchList = Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          myWatchList.title,
          style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ));

    final releaseDateMyWatchList = Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          const Text(
            "Release Date: ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            DateFormat("MMM dd, yyyy").format(
              DateTime.parse(myWatchList.releaseDate),
            ),
            style: const TextStyle(fontSize: 20),
          )
        ],
      ),
    );

    final ratingMyWatchList = Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          const Text(
            "Rating: ",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            "${myWatchList.rating}/5",
            style: const TextStyle(fontSize: 20),
          )
        ],
      ),
    );

    final statusMyWatchList = Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            const Text(
              "Status: ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              myWatchList.statusWatched ? 'watched' : 'not yet watched',
              style: const TextStyle(fontSize: 20),
            )
          ],
        ));

    final reviewMyWatchList = Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            Flexible(
                child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  const TextSpan(
                      text: 'Review: ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                    text: myWatchList.review,
                  ),
                ],
              ),
            )),
          ],
        ));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      drawer: const NavigationDrawer(),
      body: Column(
        children: <Widget>[
          titleMyWatchList,
          releaseDateMyWatchList,
          ratingMyWatchList,
          statusMyWatchList,
          reviewMyWatchList,
        ],
      ),
      persistentFooterButtons: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            minimumSize: const Size.fromHeight(40),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Back',
            style: TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}
