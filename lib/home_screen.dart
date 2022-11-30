import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:networkexample/photo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 List<Photo> photos =[];

  @override
  void initState() {
    super.initState();
    fetchPhotos();
  }

  fetchPhotos() async {
    try {
      var url =
          Uri.https('jsonplaceholder.typicode.com', 'photos', {'_limit': '2'});
      final response = await http.get(url);
      // print(response.statusCode);
      // print(response.body.runtimeType);
      final decodedResponse = jsonDecode(response.body) as List;
      print("decoded response ${decodedResponse.runtimeType}");
      for(int i = 0; i<decodedResponse.length; i++){
        print("decoded response item ${decodedResponse[i]}");
      }

      
      // final photoList = decodedResponse.map((e) => Photo.fromJson(e)).toList();
      // photos = photoList;
      // print("decoded Response : ${decodedResponse.runtimeType}");

      // final firstData = decodedResponse[0] as Map<String, dynamic>;
      // print("first data is $firstData");
      // setState(() {
      //   data = firstData;
      }
    } catch (e) {
      print('error $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NetworkExample'),
      ),
      body: ListView.builder(
          itemCount: photos.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    photos[index].thumbnailUrl,
                  ),
                ),
                title: Text(
                  photos[index].title,
                  style: const TextStyle(fontSize: 30),
                ),
              ),
            );
          }),
      //     body: Column(
      // //   children: [
      // //     if (data != null) Text(data!['title']),
      // //     if (data != null) Image.network(data!['thumbnailUrl']),
      // //   ],
      // // ),
    );
  }
