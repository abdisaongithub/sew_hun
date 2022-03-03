import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sew_hun/dio_api.dart';
import 'package:sew_hun/models/landing/landing.dart';
import 'package:sew_hun/providers/auth/login_credentials_provider.dart';
import 'package:sew_hun/providers/auth/sign_in_provider.dart';
import 'package:sew_hun/providers/auth/token_provider.dart';
import 'package:sew_hun/providers/landing/landingProvider.dart';
import 'package:sew_hun/static.dart';

// final toggleFavoriteProvider = FutureProvider.autoDispose.family<bool, int>(
//   (ref, int post) async {
//     final token = ref.watch(localTokenProvider);
//     Response _response = await dio_api.post(
//       'blog/favorites/',
//       data: FormData.fromMap({'post': post}),
//       options: Options(headers: {kAuthorization: 'Token ${token.value}'}),
//     );
//
//     ref.refresh(landingProvider);
//
//     if (_response.statusCode == 200) {
//       ref.read(isFavoritedProvider.state).state = true;
//       return true;
//     } else {
//       ref.read(isFavoritedProvider.state).state = false;
//       return false;
//     }
//   },
// );

final isFavoritedProvider = StateProvider<bool>((ref) {
  return false;
});

final toggleFavoriteProvider =
    StateNotifierProvider.autoDispose<FavoriteNotifier, bool>(
  (ref) => FavoriteNotifier(ref),
);

class FavoriteNotifier extends StateNotifier<bool> {
  FavoriteNotifier(this._ref) : super(false);
  final Ref _ref;

  void fav(int id) async {
    final error = _ref.watch(networkErrorProvider.state);
    final token = _ref.watch(localTokenProvider);

    try {
      Response _response = await dio_api.post(
        'blog/favorites/',
        options: Options(
          headers: {
            kAuthorization: 'Token ${token.value}',
          },
        ),
        data: FormData.fromMap(
          {kPost: id.toString()},
        ),
      );

      _ref.refresh(landingProvider);

      if (_response.statusCode == 200) {
        _ref.read(isFavoritedProvider.state).state = true;
        state = true;
      } else {
        _ref.read(isFavoritedProvider.state).state = false;
        state = false;
      }
      // print('Key: ' + state.key.toString());
    } on DioError catch (e) {
      error.state = e;
    }
    // catch (e) {
    //   // print(e.toString());
    //   print('Error Occurred');
    // }
  }
}

final favListProvider =
    StateNotifierProvider<FavoriteListNotifier, List<Favorites>>((ref) {
  return FavoriteListNotifier(ref);
});

class FavoriteListNotifier extends StateNotifier<List<Favorites>> {
  FavoriteListNotifier(this._ref) : super([]);

  final Ref _ref;

  void add({required List<Favorites> favs}) {
    state = favs;
  }
}
