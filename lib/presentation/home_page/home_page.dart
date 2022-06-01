import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:new_test_stuff/domain/models/photo_model.dart';
import 'package:new_test_stuff/presentation/custom_widgets/loader.dart';
import 'package:new_test_stuff/presentation/home_page/bloc/home_page_bloc.dart';
import 'package:new_test_stuff/presentation/home_page/bloc/home_page_event.dart';
import 'package:new_test_stuff/presentation/home_page/bloc/home_page_state.dart';
import 'package:new_test_stuff/presentation/home_page/widgets/photo_card.dart';
import 'package:new_test_stuff/presentation/profile_page/bloc/profile_page_bloc.dart';
import 'package:new_test_stuff/presentation/profile_page/bloc/profile_page_event.dart';
import 'package:new_test_stuff/presentation/profile_page/profile_page.dart';
import 'package:new_test_stuff/presentation/theme/app_insets.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<HomePageBloc, HomePageState>(
          listener: (context, state) {
            if (state is HomePageError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error.message)));
            }
          },
          builder: (context, state) {
            if (state is HomePageLoading || context.read<HomePageBloc>().allPhotos.isEmpty) {
              return const Loader();
            }
            return MasonryGridView.count(
              controller: context.read<HomePageBloc>().scrollController,
              addAutomaticKeepAlives: true,
              padding: AppInsets.paddingAll16,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              crossAxisCount: 2,
              itemCount: context.read<HomePageBloc>().allPhotos.length,
              itemBuilder: (context, index) {
                PhotoModel photo = context.read<HomePageBloc>().allPhotos.elementAt(index);
                return PhotoCard(
                  photo: photo,
                  onDisliked: () => context.read<HomePageBloc>().add(
                        HomePageDislikePhotoEvent(photoId: photo.id ?? ''),
                      ),
                  onLiked: () => context.read<HomePageBloc>().add(
                        HomePageLikePhotoEvent(photo: photo),
                      ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: MaterialButton(
        color: Colors.purple,
        minWidth: 156,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => ProfilePageBloc()..add(ProfilePageLoadUser()),
              child: const ProfilePage(),
            ),
          ),
        ),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Text(
          'Профиль',
          style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
