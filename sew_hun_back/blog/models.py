from django.db import models
from django.contrib.auth.models import User


class Category(models.Model):
    category = models.CharField(max_length=256)
    description = models.CharField(max_length=256)

    def __str__(self):
        return self.category


class Tag(models.Model):
    tag = models.CharField(max_length=256)

    def __str__(self):
        return self.tag


class Post(models.Model):
    author = models.ForeignKey(User, on_delete=models.PROTECT, related_name='posts')
    category = models.ForeignKey(Category, on_delete=models.PROTECT, related_name='posts')
    tags = models.ManyToManyField(Tag, related_name='posts')
    title = models.CharField(max_length=256, )
    text = models.TextField(null=False, blank=False, )
    image = models.ImageField(upload_to='photos/', )
    created_at = models.DateTimeField(auto_now=True, auto_now_add=True)

    def __str__(self):
        return self.title


class Comment(models.Model):
    user = models.ForeignKey(User, on_delete=models.PROTECT, related_name='comments')
    comment = models.TextField(null=False, blank=False)
    created_at = models.DateTimeField(auto_now=True, auto_now_add=True)

    def __str__(self):
        return self.comment


class Narration(models.Model):
    narrator = models.ForeignKey(User, on_delete=models.PROTECT, related_name='narrator')
    audio = models.FileField(upload_to='media/')

    def __str__(self):
        return self.narrator
