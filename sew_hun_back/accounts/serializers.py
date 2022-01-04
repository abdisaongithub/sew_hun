# from django.contrib.auth.models import User
from django.conf import settings
from rest_framework import serializers
from rest_framework.validators import UniqueTogetherValidator
from django.contrib.auth import get_user_model


class UserSerializer(serializers.ModelSerializer):

    def create(self, validated_data):
        user = get_user_model().create(**validated_data)
        return user

    class Meta:
        model = settings.AUTH_USER_MODEL
        fields = (
            'first_name',
            'last_name',
            'email',
            'password',
        )
        validators = [
            UniqueTogetherValidator(
                queryset=get_user_model().objects.all(),
                fields=['email']
            )
        ]
