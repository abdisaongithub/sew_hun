from rest_framework.serializers import ModelSerializer
from .models import Post, Category, Tag, Comment, Narration


class PostsSerializer(ModelSerializer):
    class Meta:
        model = Post
        fields = '__all__'


class CategoriesSerializer(ModelSerializer):
    class Meta:
        model = Category
        fields = '__all__'


class TagsSerializer(ModelSerializer):
    class Meta:
        model = Tag
        fields = '__all__'


class CommentsSerializer(ModelSerializer):
    class Meta:
        model = Comment
        fields = '__all__'


class NarrationsSerializer(ModelSerializer):
    class Meta:
        model = Narration
        fields = '__all__'
