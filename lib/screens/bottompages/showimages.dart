import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';
class ShowImages extends StatelessWidget {
  String imageLink;
  ShowImages({Key? key,required this.imageLink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: PhotoViewGallery.builder(
            scrollPhysics: const BouncingScrollPhysics(),
            builder: (BuildContext context, int index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: NetworkImage(imageLink),
                // initialScale: PhotoViewComputedScale.contained * 0.8,
                // heroAttributes: PhotoViewHeroAttributes(tag: galleryItems[index].id),
              );
            },
            itemCount: 1,
            loadingBuilder: (context, event) => Center(
              child: Container(
                width: 20.0,
                height: 20.0,
                child: CircularProgressIndicator(

                  value: event == null
                      ? 0
                      : event.cumulativeBytesLoaded / num.parse(event.expectedTotalBytes.toString()),
                ),
              ),
            ),
            // backgroundDecoration: widget.backgroundDecoration,
            // pageController: widget.pageController,
            // onPageChanged: onPageChanged,
          )
      ),
    );
  }
}
