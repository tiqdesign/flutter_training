import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class KeepBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const KeepBar({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: height,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12.0, 4.0, 12.0, 4.0),
          child: Card(
            elevation: 5.0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () => {},
                ),
                Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Text(
                      'Notlarınızı arayın',
                      style: TextStyle(color: Color(0xff454545), fontSize: 16),
                    )),
                IconButton(
                  icon: Icon(Icons.create),
                  onPressed: () => {},
                ),
                Container(
                  width: 40,
                  height: 40,
                  child: Card(
                    color: Colors.amber,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    child: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl:
                            "https://images.pexels.com/photos/4549416/pexels-photo-4549416.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                        imageBuilder: (context, imageProvider) => Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}
