import 'package:flutter/material.dart';
import 'package:new_test_stuff/domain/models/photo_model.dart';
import 'package:new_test_stuff/presentation/custom_widgets/like_button.dart';
import 'package:new_test_stuff/presentation/photo_page/photo_page.dart';

class PhotoCard extends StatelessWidget {
  final PhotoModel photo;
  final bool showLike;
  final VoidCallback onLiked, onDisliked;

  const PhotoCard({
    Key? key,
    required this.photo,
    this.showLike = true,
    required this.onLiked,
    required this.onDisliked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      color: Colors.grey.shade300,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PhotoDetailedPage(photo: photo),
          ),
        ),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Stack(
            fit: StackFit.loose,
            children: [
              Image.network(
                photo.urls?.regular ?? '',
                errorBuilder: (context, error, trace) => const Center(
                  child: Icon(
                    Icons.error_outline,
                    color: Colors.black,
                  ),
                ),
              ),
              if (showLike)
                Positioned(
                  top: 0,
                  right: 0,
                  child: LikeButton(
                    isInitiallyFavourite: photo.isLiked ?? false,
                    onDisliked: onDisliked,
                    onLiked: onLiked,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
