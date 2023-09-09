import 'package:flutter/material.dart';

class GraphPage extends StatelessWidget {


  var graphData = [
    {
      "name": "Jan",
      "amt": 500
    },
    {
      "name": "Feb",
      "amt": 1200
    },
    {
      "name": "Mar",
      "amt": 700
    },
    {
      "name": "Apr",
      "amt": 900
    },
    {
      "name": "May",
      "amt": 500
    },
    {
      "name": "Jun",
      "amt": 1600
    },
    {
      "name": "Jul",
      "amt": 400
    },
    {
      "name": "Aug",
      "amt": 2000
    },
    {
      "name": "Sep",
      "amt": 5000
    },
    {
      "name": "Oct",
      "amt": 4000
    },
    {
      "name": "Nov",
      "amt": 2000
    },
    {
      "name": "Dec",
      "amt": 500
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Graph'),
      ),

      body: LayoutBuilder(
        builder: (_, constraints){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: graphData.map((e){
                  var ratio = (e['amt'] as int)/5000;
                  return Container(
                    margin: EdgeInsets.only(right: 11),
                    width: 70,
                    height: constraints.maxHeight*ratio,
                    child: Center(child: Text('${e['name']}', style: TextStyle(color: Colors.white),)),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(11))
                    ),
                  );

                }).toList(),
              ),
            )
          );
        },
      )
    );
  }
}
