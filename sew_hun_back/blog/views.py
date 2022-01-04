from rest_framework.generics import ListAPIView
from rest_framework.permissions import AllowAny

from .models import Post
from .serializers import PostsSerializer


class PostListView(ListAPIView):
    serializer_class = PostsSerializer
    queryset = Post.objects.all()

    permission_classes = [AllowAny]
