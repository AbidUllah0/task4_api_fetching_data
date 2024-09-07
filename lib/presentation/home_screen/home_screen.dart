import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task4_api_fetching_data/provider/post_provider.dart';
import 'package:task4_api_fetching_data/widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PostProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('API DATA FETCHING'),
        ),
        body: Column(
          children: [
            FutureBuilder(
              future: provider.fetchData(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (provider.postList.isEmpty) {
                  return Text('No Data Available in the API');
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: provider.postList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      CustomText(
                                          text: 'ID : ',
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                      CustomText(
                                          text: provider.postList[index].id
                                              .toString()),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  CustomText(
                                    text: 'TITLE : ',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  CustomText(
                                    text: provider.postList[index].title
                                        .toString(),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 10),
                                  CustomText(
                                    text: 'BODY : ',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  CustomText(
                                    text: provider.postList[index].body
                                        .toString(),
                                    // overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ));
  }
}
