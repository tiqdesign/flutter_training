import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:transparent_image/transparent_image.dart';

class CustomSwiper extends StatefulWidget {
  @override
  _CustomSwiperState createState() => _CustomSwiperState();

}

class _CustomSwiperState extends State<CustomSwiper> {

  List<String> images = [
    'https://images.unsplash.com/photo-1592886299896-db0229219921?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
    'https://images.unsplash.com/photo-1592918759777-9ed677d1ef7d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
    'https://images.unsplash.com/photo-1587613753310-0ba642887227?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
    'https://images.unsplash.com/photo-1592810249777-0eba22de200b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=655&q=80',
    'https://images.unsplash.com/photo-1592740692333-57924d2c5f8b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80'
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: double.infinity,
      width: double.infinity,
      child: Center(
        child: Swiper(
          itemCount: 5,
          viewportFraction: 0.8,
          scale: 0.7,
          layout: SwiperLayout.STACK,
          itemWidth: MediaQuery.of(context).size.width-50,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(25),
              ),
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: 5,
              child: Stack(
                children:[
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                  FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: images[index],
                    fit: BoxFit.cover,
                ),
              ]
              ),
            );
          },
        ),
      ),
    );
  }
}
