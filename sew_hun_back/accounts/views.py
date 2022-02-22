from django.contrib import auth
from django.contrib.auth import get_user_model
from django.forms import model_to_dict
from django.http import JsonResponse
from rest_framework.authtoken.models import Token
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.response import Response
from rest_framework import generics, status
from rest_framework.permissions import IsAuthenticated
from . import serializers
from .models import MyUser


class CustomAuthToken(ObtainAuthToken):

    def post(self, request, *args, **kwargs):
        serializer = self.serializer_class(data=request.data,
                                           context={'request': request})
        serializer.is_valid(raise_exception=True)
        user = serializer.validated_data['user']
        token, created = Token.objects.get_or_create(user=user)
        return Response({
            'token': token.key,
            'user_id': user.pk,
            'email': user.email
        })


class RegisterView(generics.CreateAPIView):
    def post(self, request, *args, **kwargs):
        serialized = serializers.UserSerializer(data=request.data)
        if serialized.is_valid():
            user = MyUser.objects.create(serialized.data)

            return Response(data=user, status=status.HTTP_200_OK)
        return Response(data=None, status=status.HTTP_400_BAD_REQUEST)


class Me(generics.RetrieveAPIView):
    permission_classes = (IsAuthenticated,)
    # serializer_class = serializers.MeSerializer

    def get(self, request, *args, **kwargs):
        current_user = request.user
        if current_user.is_authenticated:
            user_object = MyUser.objects.get(id=current_user.id)
            serialized = serializers.MeSerializer(user_object)

            return Response(data={'user': serialized.data}, status=status.HTTP_200_OK)
        else:
            return Response(
                data={'error': 'You have to be authenticated to obtain your profile'},
                status=status.HTTP_401_UNAUTHORIZED,
            )


class Profile(generics.RetrieveAPIView):
    def get(self, request, user_id, *args, **kwargs):
        user = MyUser.objects.get(id=user_id)

        if user is None:
            return Response(data={'error': 'No user found'}, status=status.HTTP_404_NOT_FOUND)
        else:
            serializer = serializers.UserProfileSerializer(user)
            return Response(data={'data': serializer.data})
