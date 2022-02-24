from django.db import models
from django.contrib.auth.models import User
from django.conf import settings


class Category(models.Model):
    """
    Category to add posts to
    """
    category = models.CharField(max_length=256, verbose_name='categories')
    description = models.CharField(max_length=256)
    image = models.ImageField(upload_to='photos/categories/', )

    # created_at = models.DateTimeField(auto_now_add=True)
    # updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.category

    class Meta:
        verbose_name_plural = 'categories'


class Tag(models.Model):
    """
    Tags to filter out with their associations
    """
    tag = models.CharField(max_length=256)
    description = models.CharField(max_length=256, blank=True, null=True)

    def __str__(self):
        return self.tag


class Post(models.Model):
    """
    Main information regarding individual posts
    """
    author = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.PROTECT, related_name='posts')
    category = models.ForeignKey(Category, on_delete=models.PROTECT, related_name='posts')
    tags = models.ManyToManyField(Tag, related_name='posts')
    title = models.CharField(max_length=256, )
    text = models.TextField(null=False, blank=False, )
    image = models.ImageField(upload_to='photos/posts/', )
    created_at = models.DateField(auto_now_add=True)
    updated_at = models.DateField(auto_now=True)

    reads = models.BigIntegerField(default=0, blank=False, )
    shares = models.BigIntegerField(default=0, blank=False, )

    # TODO: not migrated, also update the pots provider after uncommenting this shit
    # is_published = models.BooleanField(default=True)

    def __str__(self):
        return str(self.title)

    class Meta:
        ordering = ('-created_at',)


class Comment(models.Model):
    """
    Comments for posts
    """
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='comments')
    post = models.ForeignKey(Post, on_delete=models.CASCADE, related_name='comments')
    comment = models.TextField(null=False, blank=False, default="No Comment")
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.comment

    class Meta:
        ordering = ('-created_at',)


class Narration(models.Model):
    """
    Audio files for posts with the author's information
    """
    narrator = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.PROTECT, related_name='narrator')
    post = models.ForeignKey(Post, on_delete=models.CASCADE, related_name='narration')
    audio = models.FileField(upload_to='narrations/')

    def __str__(self):
        return str(self.post.id) + ': ' + self.post.title


class YoutubePlaylist(models.Model):
    playlist = models.CharField(max_length=255)

    def __str__(self):
        return self.playlist
