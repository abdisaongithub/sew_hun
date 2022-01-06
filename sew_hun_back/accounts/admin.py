from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import MyUser, Profile, Role, Favorite

admin.site.register(MyUser, UserAdmin)
admin.site.register(Profile)
admin.site.register(Role)
admin.site.register(Favorite)
