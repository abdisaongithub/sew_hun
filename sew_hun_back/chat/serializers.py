from django.conf import settings
from django.contrib.auth import get_user_model
from rest_framework import serializers
from .models import Message, Chat
from accounts.models import Profile


class ProfileMiniSerializer(serializers.ModelSerializer):
    class Meta:
        model = Profile
        fields = ['id', 'photo']


class UserProfileSerializer(serializers.ModelSerializer):
    profile = ProfileMiniSerializer()

    class Meta:
        model = get_user_model()
        # exclude = ('password', 'groups', 'user_permissions', 'is_active', 'last_login', 'date_joined')
        fields = ('id', 'profile', 'username', 'email')


class MessagesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Message
        fields = '__all__'


class ChatSerializer(serializers.ModelSerializer):
    admin = UserProfileSerializer()
    client = UserProfileSerializer()

    class Meta:
        model = Chat
        fields = ('id', 'admin', 'client')
        depth = 1
