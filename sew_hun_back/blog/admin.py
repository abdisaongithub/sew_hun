from django.contrib import admin
from .models import Post, Category, Tag, Comment, Narration

admin.site.register(Post)
admin.site.register(Narration)
admin.site.register(Category)
admin.site.register(Tag)
admin.site.register(Comment)
