import 'package:flutter/material.dart';
import 'package:flutter_application_1/class.dart';
import 'package:flutter_application_1/datalist.dart';
import 'package:flutter_application_1/favorite_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    getitem();
    super.initState();
  }

  checkfav(name) {
    var isfind = false;
    if (itemdata != null) {
      for (var i = 0; i < itemdata.length; i++) {
        if (itemdata[i]["name"] == name) {
          isfind = true;
          break;
        }
      }
    }
    return isfind;
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
          title: Text("HOME"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FavoriteScreen()));
                  },
                  child: Icon(Icons.favorite_outline)),
            )
          ],
        ),
        body: ListView.builder(
            itemCount: dataList.length,
            itemBuilder: (context, i) {
              return ListTile(
                leading: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          (dataList[i]["image"].toString()),
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
                title: Text(dataList[i]["name"].toString()),
                subtitle: Text(dataList[i]["detail"].toString()),
                trailing: Container(
                  width: 200,
                  child: Row(
                    children: [
                      Text(dataList[i]["price"].toString()),
                      IconButton(
                        onPressed: () async {
                          if (checkfav(dataList[i]["name"])) {
                            // Item is already in favorites, so remove it
                            await Preferences.removeitem1(dataList[i]["name"]);
                          } else {
                            // Item is not in favorites, so add it
                            await Preferences.saveitem(dataList[i]);
                          }
                          await getitem();
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: checkfav(dataList[i]["name"])
                              ? Colors.red
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
// Image.network(dataList[i]["image"].toString()),