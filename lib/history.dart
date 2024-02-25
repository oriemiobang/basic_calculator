import 'package:basic_calculator/clases/history.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<Map<String, dynamic>> historyList = [];

  void getHistory() async {
    final history = await SQLHelper.getItems();
    setState(() {
      historyList = history.reversed.toList();

      // print(historyList);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHistory();
  }

  @override
  Widget build(BuildContext context) {
    return historyList.isNotEmpty
        ? Container(
            // margin: EdgeInsets.only(right: 200),
            width: double.infinity,
            height: 530,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: historyList.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, index) {
                          return ListTile(
                            title: Text(
                              historyList[index]['question'],
                              style: TextStyle(fontSize: 17),
                            ),
                            subtitle: Text(
                              '=${historyList[index]['answer']}',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 20),
                            ),
                          );
                        }),
                  ),
                  TextButton(
                      onPressed: () {
                        SQLHelper.deleteItem();
                        // setState(() {
                        getHistory();
                        // });
                      },
                      child: Text('Clear history'))
                ],
              ),
            ),
          )
        : Center(
            child: Text('Your history appears here'),
          );
  }
}
