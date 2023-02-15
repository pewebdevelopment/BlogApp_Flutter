import 'package:flutter/material.dart';

class PhotoBrowserPage extends StatefulWidget {
  final String initialImage;
  final List<String> images;
  const PhotoBrowserPage(this.initialImage, this.images, {Key? key})
      : super(key: key);

  @override
  State<PhotoBrowserPage> createState() => _PhotoBrowserPageState();
}

class _PhotoBrowserPageState extends State<PhotoBrowserPage> {
  String image = "no_image";

  @override
  void initState() {
    image = widget.initialImage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          Positioned.fill(
            child: InteractiveViewer(
              maxScale: 4.0,
              child: Image.asset(
                "assets/$image.jpg",
                fit: BoxFit.contain,
              ),
            ),
          ),
          _closeButton(context),
          _imagesList()
        ],
      ),
    );
  }

  Widget _closeButton(BuildContext context) {
    return Positioned(
      top: 48.0,
      right: 24.0,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black.withOpacity(.4),
          ),
          child: const Icon(
            Icons.close,
            size: 30.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _imagesList() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 140.0,
        padding: const EdgeInsets.all(16.0),
        color: Colors.black.withOpacity(0.4),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: widget.images.length,
          itemBuilder: (context, index) {
            return AspectRatio(
              aspectRatio: 1.0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    image = widget.images[index];
                  });
                },
                child: Image.asset(
                  "assets/${widget.images[index]}.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: 16.0);
          },
        ),
      ),
    );
  }
}
