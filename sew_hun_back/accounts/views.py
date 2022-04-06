from dj_rest_auth.registration.views import RegisterView
from django.shortcuts import render
from django.utils.datastructures import MultiValueDictKeyError
from rest_framework.authtoken.models import Token
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.response import Response
from rest_framework import generics, status, permissions
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


# class RegisterView(generics.CreateAPIView):
#     permission_classes = [AllowAny]
#
#     def post(self, request, *args, **kwargs):
#         serialized = serializers.UserSerializer(data=request.data)
#         if serialized.is_valid():
#             user = MyUser.objects.create(serialized.data)
#
#             return Response(data=user, status=status.HTTP_200_OK)
#         return Response(data=serialized.errors, status=status.HTTP_400_BAD_REQUEST)


class Me(generics.RetrieveAPIView):
    permission_classes = [IsAuthenticated]

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


class CreateProfile(generics.CreateAPIView):
    permission_classes = [permissions.IsAuthenticated]

    def post(self, request, *args, **kwargs):
        form_data = serializers.CreateProfileSerializer(data=request.data, many=False, )
        if form_data.is_valid():
            user = MyUser.objects.get(id=request.user.id)

            if form_data.data['email']:
                user.email = form_data.data['email']

            user.first_name = form_data.data['firstName']
            user.last_name = form_data.data['lastName']

            if form_data.data['subCity']:
                user.profile.sub_city = form_data.data['subCity']
            user.profile.phone = form_data.data['phone']
            user.profile.city = form_data.data['city']
            try:
                if request.FILES['photo'] is not None:
                    if user.profile.photo is not None:
                        user.profile.photo.delete()
                    user.profile.photo = request.FILES.get('photo')
            except MultiValueDictKeyError:
                pass

            user.profile.save()
            user.save()
            return Response(data={'data': form_data.data}, status=status.HTTP_201_CREATED)
        else:
            return Response(data=form_data.errors, status=status.HTTP_400_BAD_REQUEST)
