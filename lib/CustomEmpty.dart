import 'package:flutter/material.dart';
import 'package:flutteranimation/Models/Post.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomEmptyContainer extends StatefulWidget {
  @override
  _CustomEmptyContainerState createState() => _CustomEmptyContainerState();
}

class _CustomEmptyContainerState extends State<CustomEmptyContainer> {
  List<Post> posts = [
    Post('Person 1', 'assets/1f937-1f3fc.svg'),
    Post('Person 2', 'assets/1f422.svg'),
    Post('Person 3', 'assets/1f423.svg'),
    Post('Person 4', 'assets/1f424.svg'),
    Post('Person 5', 'assets/1f425.svg'),
    Post('Person 6', 'assets/1f426.svg'),
    Post('Person 7', 'assets/1f427.svg'),
    Post('Person 8', 'assets/1f428.svg'),
    Post('Person 9', 'assets/1f429.svg'),
    Post('Person 10','assets/1f430.svg'),
    Post('Person 11','assets/1f422.svg'),
    Post('Person 12','assets/1f423.svg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
            itemCount: posts.length,
            itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 0.1, color: Colors.grey),
                borderRadius: BorderRadius.circular(8)
            ),
            elevation: 2,
            child: ListTile(
              leading: SvgPicture.asset(posts[index].img),
              title: Text(
                posts[index].title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black38),
              ),
            ),
          );
        }),
      ),
    );
  }
}
