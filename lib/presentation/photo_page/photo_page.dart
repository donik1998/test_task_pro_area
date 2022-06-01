import 'package:flutter/material.dart';
import 'package:new_test_stuff/domain/models/photo_model.dart';
import 'package:new_test_stuff/presentation/custom_widgets/like_button.dart';

class PhotoDetailedPage extends StatelessWidget {
  final PhotoModel photo;

  const PhotoDetailedPage({
    Key? key,
    required this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            photo.urls?.regular ?? '',
            fit: BoxFit.fitWidth,
            errorBuilder: (context, error, trace) => const Center(
              child: Icon(
                Icons.error_outline,
                color: Colors.black,
              ),
            ),
            frameBuilder: (context, child, frame, isSync) => Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: child,
            ),
          ),
          LikeButton(
            isInitiallyFavourite: photo.isLiked ?? false,
            onLiked: () {},
            onDisliked: () {},
          ),
        ],
      ),
    );
  }
}
