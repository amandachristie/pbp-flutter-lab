import 'package:flutter/material.dart';
import 'package:counter_7/utility/drawer.dart';
import 'package:counter_7/utility/fetch.dart';
import 'package:counter_7/model/mywatchlist.dart';
import 'package:counter_7/page/mywatchlist_detail.dart';

class MyWatchlistPage extends StatefulWidget {
  const MyWatchlistPage({super.key});

  @override
  State<MyWatchlistPage> createState() => _MyWatchlistPageState();
}

class _MyWatchlistPageState extends State<MyWatchlistPage> {
  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(MyWatchList myWatchList) => ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          leading: Container(
            padding: const EdgeInsets.only(right: 12.0),
            child: const Icon(Icons.autorenew, color: Colors.white),
          ),
          title: Text(
            myWatchList.title,
          ),
          trailing: Checkbox(
            value: myWatchList.statusWatched,
            onChanged: (bool? newValue) {
              setState(() {
                myWatchList.statusWatched = !myWatchList.statusWatched;
              });
            },
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MyWatchListDetailPage(myWatchList: myWatchList)));
          },
        );

    Card makeCard(MyWatchList myWatchList) => Card(
          margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 1),
          elevation: 4,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: myWatchList.statusWatched
                  ? Colors.lightGreenAccent.shade400
                  : Colors.redAccent.shade400,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Container(
            child: makeListTile(myWatchList),
          ),
        );

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Watch List'),
      ),
      drawer: const NavigationDrawer(),
      body: FutureBuilder(
          future: fetchWatchlist(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "Tidak ada watch list :(",
                      style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => makeCard(snapshot.data![index]));
              }
            }
          }),
    );
  }
}
