from django.http import JsonResponse
from rest_framework import generics, status
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response

from .models import Post, Comment, Category, YoutubePlaylist
from . import serializers
from accounts.models import Favorite


class CategoriesView(generics.ListAPIView):
    serializer_class = serializers.CategoriesSerializer
    queryset = Category.objects.all()

    permission_classes = [IsAuthenticated]


class CategoryPostListView(generics.ListAPIView):
    permission_classes = [IsAuthenticated]

    def get(self, request, *args, **kwargs):
        posts = Post.objects.filter(category=kwargs['pk'])
        serialized = serializers.PostsCategorySerializer(posts, many=True)
        return Response({"posts": serialized.data}, status=status.HTTP_200_OK, )


class PostListView(generics.ListAPIView):
    serializer_class = serializers.PostsSerializer
    queryset = Post.objects.all().order_by('-created_at')

    permission_classes = [IsAuthenticated]


class PostDetailView(generics.RetrieveAPIView):
    serializer_class = serializers.PostDetailSerializer
    queryset = Post.objects.all()

    permission_classes = [IsAuthenticated]


class CommentCreateView(generics.CreateAPIView):
    serializer_class = serializers.CommentDetailSerializer
    queryset = Comment

    permission_classes = [IsAuthenticated]

    def post(self, request, *args, **kwargs):
        # todo: make validation here
        serialized = serializers.CommentDetailSerializer(
            data=request.data, context={
                'user': request.user.id,
                'post': request.data['post']
            }
        )
        serialized.is_valid()
        print(serialized.data)
        comment = Comment.objects.create(
            user_id=request.user.id,
            post_id=serialized.data['post'],
            comment=serialized.data['comment'],
        )
        return Response(data=serialized.data, status=status.HTTP_200_OK)


class CommentRetrieveUpdateDestroyView(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]

    # todo: check if the user owns the comment
    # todo: start from here

    def put(self, request, *args, **kwargs):
        try:
            comment = Comment.objects.get(pk=kwargs['pk'])

            comment.comment = request.data['comment']
            comment.save()
            serialized = serializers.CommentDetailSerializer(data=comment)
            serialized.is_valid()
            return JsonResponse(data=serialized.data, status=status.HTTP_202_ACCEPTED)
        except Comment.DoesNotExist:
            return Response(data=None, status=status.HTTP_404_NOT_FOUND)

    def delete(self, request, *args, **kwargs):
        try:
            comment = Comment.objects.get(pk=kwargs['pk'])
            comment.delete()
            return Response(data=None, status=status.HTTP_204_NO_CONTENT)
        except Comment.DoesNotExist:
            return Response(data=None, status=status.HTTP_404_NOT_FOUND)

    def get(self, request, *args, **kwargs):
        return Response(data=None, status=status.HTTP_405_METHOD_NOT_ALLOWED)


class FavoritesListCreateView(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticated]

    def get(self, request, *args, **kwargs):
        fav = Favorite.objects.filter(user=request.user.id).order_by('-created_at')
        serialized = serializers.FavoritesSerializer(fav, many=True)
        return Response(data={'favorites': serialized.data})

    def post(self, request, *args, **kwargs):
        post = Post.objects.get(pk=request.data['post'])
        favorite = Favorite.objects.filter(user=request.user, post=post)
        if len(favorite) > 0:
            for fav in favorite:
                fav.delete()
            return Response(status=status.HTTP_204_NO_CONTENT)
        else:
            fav = Favorite.objects.create(user=request.user, post=post)
        serialized = serializers.FavoritesSerializer(fav)
        return Response(serialized.data)


class FavoriteDestroyView(generics.DestroyAPIView):
    def delete(self, request, *args, **kwargs):
        try:
            fav = Favorite.objects.get(pk=kwargs['pk'])
            if fav:
                if fav.user.id == request.user.id:
                    fav.delete()
                    return Response(data={}, status=status.HTTP_204_NO_CONTENT)
                return Response(data={"error": "Favorite doesn\'t belong to user"}, status=status.HTTP_403_FORBIDDEN, )
        except Favorite.DoesNotExist:
            return Response(data={}, status=status.HTTP_404_NOT_FOUND)


class YoutubePlaylistListView(generics.ListAPIView):
    def get(self, request, *args, **kwargs):
        playlists = YoutubePlaylist.objects.all()
        serialized = serializers.YoutubePlaylistSerializer(playlists, many=True)

        return Response(data={'playlists': serialized.data}, status=status.HTTP_200_OK, )


class LandingView(generics.ListAPIView):
    def get(self, request, *args, **kwargs):
        categories = Category.objects.all()
        cat_ser = serializers.CategoriesSerializer(categories, many=True)

        fav = Favorite.objects.filter(user=request.user.id).order_by('-created_at')
        fav_ser = serializers.FavoritesSerializer(fav, many=True)

        res = {
            'categories': cat_ser.data,
            'favorites': fav_ser.data
        }

        return Response(data=res, )
