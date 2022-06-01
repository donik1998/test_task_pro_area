import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:new_test_stuff/domain/models/photo_model.dart';
import 'package:new_test_stuff/presentation/custom_widgets/loader.dart';
import 'package:new_test_stuff/presentation/home_page/widgets/photo_card.dart';
import 'package:new_test_stuff/presentation/profile_page/bloc/profile_page_bloc.dart';
import 'package:new_test_stuff/presentation/profile_page/bloc/profile_page_state.dart';
import 'package:new_test_stuff/presentation/theme/app_insets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        minimum: AppInsets.paddingAll16,
        child: BlocConsumer<ProfilePageBloc, ProfilePageState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is ProfilePageLoading) return const Loader();
            if (state is ProfilePageSuccess) {
              return Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: Text('${state.user.firstName} ${state.user.lastName}'),
                    subtitle: Text('${state.user.username}'),
                  ),
                  Text(
                    'Любимые фото',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  if (context.read<ProfilePageBloc>().userLikedPhotos.isNotEmpty)
                    Expanded(
                      child: MasonryGridView.count(
                        addAutomaticKeepAlives: true,
                        padding: AppInsets.paddingAll16,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        crossAxisCount: 2,
                        itemCount: context.read<ProfilePageBloc>().userLikedPhotos.length,
                        itemBuilder: (context, index) {
                          PhotoModel photo = context.read<ProfilePageBloc>().userLikedPhotos.elementAt(index);
                          return PhotoCard(
                            photo: photo,
                            showLike: false,
                            onDisliked: () {},
                            onLiked: () {},
                          );
                        },
                      ),
                    )
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
