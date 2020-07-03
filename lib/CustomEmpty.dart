import 'package:flutter/material.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:flutteranimation/Models/Post.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomEmptyContainer extends StatefulWidget {
  @override
  _CustomEmptyContainerState createState() => _CustomEmptyContainerState();
}

class _CustomEmptyContainerState extends State<CustomEmptyContainer> {
  List<Post> posts = [
    Post('Person 1', 'assets/popcorn .png'),
    Post('Person 2', 'assets/cute.png'),
    Post('Person 3', 'assets/file.png'),
    Post('Person 4', 'assets/popcorn .png'),
    Post('Person 5', 'assets/cute.png'),
    Post('Person 6', 'assets/popcorn .png'),
    Post('Person 7', 'assets/cute.png'),
    Post('Person 8', 'assets/popcorn .png'),
    Post('Person 9', 'assets/file.png'),
    Post('Person 10','assets/cute.png'),
    Post('Person 11','assets/popcorn .png'),
    Post('Person 12','assets/cute.png'),
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
            color: Color(0xffF9F9F9),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
            ),
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0,8.0,16.0,8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 80,
                        height: 15,
                        child: Center(child: Text('11 Paket', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black38),)),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.deepOrangeAccent,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(0,8.0,0,8.0),
                        child: Text(
                          posts[index].title,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black38),
                        ),
                      ),
                      Container(
                        color: Color(0xffF9F9F9),
                        width: MediaQuery.of(context).size.width/2,
                        height: 80,
                        child: RoundedProgressBar(
                            milliseconds:1000,
                            percent: 11,
                            theme: RoundedProgressBarTheme.yellow,
                            borderRadius: BorderRadius.circular(24)),
                      ),
                    ],
                  ),
                  Image.asset(posts[index].img,width: 50,)
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
