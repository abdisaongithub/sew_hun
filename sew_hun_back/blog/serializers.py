from django.contrib.auth import get_user_model
from rest_framework import serializers
from .models import Post, Category, Tag, Comment, Narration, YoutubePlaylist
from accounts.models import Profile, Favorite, Settings


class CategoriesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = '__all__'


class NarrationsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Narration
        fields = '__all__'
        depth = 0


class ProfileSerializer(serializers.ModelSerializer):
    class Meta:
        model = Profile
        fields = '__all__'


class ProfileMiniSerializer(serializers.ModelSerializer):
    class Meta:
        model = Profile
        fields = ['id', 'photo']


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = get_user_model()
        fields = ['id', 'username', 'profile']


class UserMiniSerializer(serializers.ModelSerializer):
    class Meta:
        model = get_user_model()
        fields = ['id', 'username', 'email']


class UserProfileSerializer(serializers.ModelSerializer):
    profile = ProfileMiniSerializer()

    class Meta:
        model = get_user_model()
        fields = ['id', 'username', 'profile']


class CommentsSerializer(serializers.ModelSerializer):
    user = UserProfileSerializer(read_only=True)

    class Meta:
        model = Comment
        fields = ['id', 'comment', 'user']


class CommentDetailSerializer(serializers.ModelSerializer):
    # todo: override create method to add additional data for validation

    class Meta:
        model = Comment
        fields = '__all__'


class PostsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Post
        fields = ['id', 'title', 'text', 'image', 'reads', 'shares', 'category', ]
        depth = 1


class PostsCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Post
        fields = ['id', 'title', 'text', 'image', 'reads', ]
        depth = 1


class PostDetailSerializer(serializers.ModelSerializer):
    author = UserProfileSerializer()
    comments = CommentsSerializer(many=True)
    narration = NarrationsSerializer(many=True)

    class Meta:
        model = Post
        # fields = ['id', 'title', 'text', 'image', 'reads', 'author', 'category']
        exclude = []
        depth = 2


class TagsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tag
        fields = '__all__'


class FavoritesSerializer(serializers.ModelSerializer):
    post = PostsSerializer()

    class Meta:
        model = Favorite
        fields = ['id', 'post', ]


class YoutubePlaylistSerializer(serializers.ModelSerializer):
    class Meta:
        model = YoutubePlaylist
        fields = '__all__'


class SettingsSerializer(serializers.ModelSerializer):
    user = UserMiniSerializer

    class Meta:
        model = Settings
        fields = ('id', 'is_subscribed', 'dark_mode', 'is_active', 'user')
        depth = 0
