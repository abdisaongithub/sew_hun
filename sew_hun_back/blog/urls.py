from django.urls import path
from .views import (
    PostListView,
    PostDetailView,
    CommentCreateView,
    CommentRetrieveUpdateDestroyView,
    CategoriesView,
    CategoryPostListView,
    FavoritesListCreateView,
    FavoriteDestroyView,
    YoutubePlaylistListView,
    LandingView,
    SettingsListView,
    SearchView,
)

urlpatterns = [
    path('categories/', CategoriesView.as_view(), name='categories'),
    path('categories/posts/<int:pk>/', CategoryPostListView.as_view(), name='categories.posts'),

    # TODO: remove posts from the url

    path('landing/', LandingView.as_view(), name='landing'),

    path('posts/', PostListView.as_view(), name='posts'),
    path('posts/<int:pk>/', PostDetailView.as_view(), name='post'),
    path('search/', SearchView.as_view(), name='post'),

    path('posts/<int:pk>/comments/', CommentCreateView.as_view(), name='comment.create'),
    path('comments/<int:pk>/', CommentRetrieveUpdateDestroyView.as_view(), name='comment.update'),

    path('favorites/', FavoritesListCreateView.as_view(), name='favorites'),
    path('favorites/<int:pk>/', FavoriteDestroyView.as_view(), name='favorites.detail'),

    path('playlists/', YoutubePlaylistListView.as_view(), name='playlist'),

    path('settings/', SettingsListView.as_view(), name='settings'),
]
