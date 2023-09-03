import 'package:flutter/material.dart';
import 'package:flutter_application_1/class.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    getitem();
    super.initState();
  }

  var itemdata;
  getitem() async {
    var data = await Preferences.getitem();
    if (data != null) {
      itemdata = data;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text("faviorte screen"),
        ),
        body: itemdata == null
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: itemdata.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    leading: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                              (itemdata[i]["image"].toString()),
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    title: Text(itemdata[i]["name"].toString()),
                    subtitle: Text(itemdata[i]["detail"].toString()),
                    trailing: Container(
                      width: 200,
                      child: Row(
                        children: [
                          Text(itemdata[i]["price"].toString()),
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.favorite)),
                          
                                                 ],
                      ),
                    ),
                  );
                }));
  }
}
