import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  final bool isInitiallyFavourite;
  final VoidCallback onLiked, onDisliked;

  const LikeButton({
    Key? key,
    required this.isInitiallyFavourite,
    required this.onLiked,
    required this.onDisliked,
  }) : super(key: key);

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  late bool liked = widget.isInitiallyFavourite;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (liked) {
          widget.onDisliked();
          setState(() => liked = false);
        } else {
          widget.onLiked();
          setState(() => liked = true);
        }
      },
      icon: Icon(
        liked ? Icons.favorite : Icons.favorite_border,
        color: liked ? Colors.redAccent.shade700 : Colors.black,
      ),
    );
  }
}
