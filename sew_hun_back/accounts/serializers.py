# from django.contrib.auth.models import User
from django.conf import settings
from rest_framework import serializers
from rest_framework.validators import UniqueTogetherValidator
from django.contrib.auth import get_user_model

from .models import MyUser, Profile, Role


class UserCreationSerializer(serializers.Serializer):
    def update(self, instance, validated_data):
        pass

    def create(self, validated_data):
        user = get_user_model().objects.create(email=validated_data['email'], password=validated_data['password'],
                                               username=validated_data['username'], )

    email = serializers.CharField(max_length=120)
    password1 = serializers.CharField(max_length=120)
    password2 = serializers.CharField(max_length=120)


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


class RoleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Role
        fields = '__all__'


class ProfileSerializer(serializers.ModelSerializer):
    role = RoleSerializer(many=True)

    class Meta:
        model = Profile
        fields = '__all__'


class CreateProfileSerializer(serializers.Serializer):
    email = serializers.EmailField(required=True)
    firstName = serializers.CharField(max_length=256)
    lastName = serializers.CharField(max_length=256)
    phone = serializers.CharField(max_length=15)
    city = serializers.CharField(max_length=50)
    subCity = serializers.CharField(max_length=50, required=False, )


class ProfileMiniSerializer(serializers.ModelSerializer):
    class Meta:
        model = Profile
        fields = ['id', 'photo']


class MeSerializer(serializers.ModelSerializer):
    profile = ProfileSerializer(many=False)

    class Meta:
        model = MyUser
        # fields = '__all__'
        exclude = ('password', 'groups', 'user_permissions', 'is_active',)
        depth = 1


class UserProfileSerializer(serializers.ModelSerializer):
    profile = ProfileMiniSerializer()

    class Meta:
        model = MyUser
        exclude = ('password', 'groups', 'user_permissions', 'is_active', 'last_login', 'date_joined')
        # fields = '__all__'
        depth = 1
