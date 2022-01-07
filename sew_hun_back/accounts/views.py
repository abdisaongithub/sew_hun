from django.contrib.auth import get_user_model
from rest_framework.authtoken.models import Token
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.response import Response
from rest_framework import generics, status
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
        serialized = serializers.UserSerializer(request.data)
        if serialized.is_valid():
            user = MyUser.objects.create(serialized.data)
            
            return Response(data=user, status=status.HTTP_200_OK)
        return Response(data=None, status=status.HTTP_400_BAD_REQUEST)
