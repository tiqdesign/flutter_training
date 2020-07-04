import 'package:flutter/material.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:flutteranimation/Models/Post.dart';


class CustomEmptyContainer extends StatefulWidget {
  @override
  _CustomEmptyContainerState createState() => _CustomEmptyContainerState();
}

class _CustomEmptyContainerState extends State<CustomEmptyContainer> {
  List<Post> posts = [
    Post('Diziler', 'assets/popcorn .png', 25),
    Post('Filmler', 'assets/cute.png',50),
    Post('Oyunlar', 'assets/file.png',75),
    Post('Kitaplar', 'assets/popcorn .png',66),
    Post('Animeler', 'assets/cute.png',93),
    Post('Ülkeler', 'assets/popcorn .png',13),
    Post('Kitaplar', 'assets/cute.png',95),
    Post('Animeler', 'assets/popcorn .png',34),
    Post('Ülkeler', 'assets/file.png',74),
    Post('Diziler','assets/cute.png',25),
    Post('Filmler','assets/popcorn .png',64),
    Post('Oyunlar','assets/cute.png',85),
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
          return FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                color: Color(0xffF9F9F9),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
                ),
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0,16.0,20.0,16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2.0),
                            child: Container(
                              width: 65,
                              height: 20,
                              child: Center(child: Text('11 Paket', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800]),)),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.deepOrangeAccent,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,8.2,0,8.2),
                            child: Text(
                              posts[index].title,
                              style: TextStyle(
                                  fontSize: 24,
                                  height: 0.9,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black87),
                            ),
                          ),
                          Container(
                            color: Colors.transparent,
                            width: MediaQuery.of(context).size.width-140,
                            child: RoundedProgressBar(
                              height: 10,
                              milliseconds: 500,
                              style: RoundedProgressBarStyle(
                                  colorProgress: Colors.amber,
                                  backgroundProgress: Colors.white,
                                  borderWidth: 0,
                                  widthShadow: 0),
                              borderRadius: BorderRadius.circular(24),
                              percent: posts[index].percent,
                            ),
                          ),
                        ],
                      ),
                      Image.asset(posts[index].img,width: 55,)
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
