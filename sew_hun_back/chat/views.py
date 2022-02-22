from django.conf import settings
from rest_framework import generics, permissions, status
from rest_framework.response import Response
from .models import Message, Chat
from .serializers import MessagesSerializer, ChatSerializer, UserProfileSerializer
from accounts.models import MyUser


class MessagesListCreateView(generics.ListCreateAPIView):
    permission_classes = [permissions.IsAuthenticated, ]

    def get(self, request, *args, **kwargs):
        user = request.user
        if user.is_staff:
            messages = Message.objects.filter(chat__admin=user.id, )
        else:
            messages = Message.objects.filter(chat__client=user.id, )
        # messages = Message.objects.filter(chat=chat_id, )
        # messages = Message.objects.all()
        print(messages)

        if messages is None:
            return Response(data={'error': 'None'}, status=status.HTTP_204_NO_CONTENT)
        else:
            serializer = MessagesSerializer(messages, many=True)

            return Response(data={'data': serializer.data})

    def post(self, request, *args, **kwargs):
        chat_id = request.POST['chat_id']
        text = request.POST['text']  # TODO: create with empty text if not provided
        sender = request.user
        try:
            if request.data['audio'] is not None:
                print(request.data['audio'])
        except:
            print('safe')
        # if request.data['audio']:
        #     print('request.data')
        #     print(request.data)
        if sender.is_staff:
            message = Message.objects.create(chat_id=chat_id, text=text, is_from_admin=True, )
        else:
            message = Message.objects.create(chat_id=chat_id, text=text, is_from_admin=False,
                                             audio=request.data['audio'])

        # messages = Message.objects.filter(chat=chat_id, )
        # for message in messages:
        #     message.read = True
        #     message.save()
        serialized = MessagesSerializer(message)
        return Response(data={'data': serialized.data}, status=status.HTTP_200_OK)
    # TODO: Check ownership before answering


class ChatsListCreateView(generics.ListCreateAPIView):
    permission_classes = [permissions.IsAuthenticated, ]

    def get(self, request, *args, **kwargs):
        user = request.user

        if user.is_staff:
            chats = Chat.objects.filter(admin_id=user.id)
        else:
            chats = Chat.objects.filter(client_id=user.id)

        serializer = ChatSerializer(chats, many=True, context={'request': request})

        return Response(data={'chats': serializer.data})

    def post(self, request, *args, **kwargs):
        user = request.user
        other_user = request.POST['id']
        if user.is_staff:
            chat = Chat.objects.create(admin_id=user.id, client_id=other_user)
        else:
            chat = Chat.objects.create(admin_id=other_user, client_id=user.id)

        serialized = ChatSerializer(chat)
        return Response(data=serialized.data, status=status.HTTP_200_OK)


class AdminsListView(generics.ListAPIView):
    def get(self, request, *args, **kwargs):
        admins = MyUser.objects.filter(is_staff=True)
        serialized = UserProfileSerializer(admins, many=True)

        return Response(data={'data': serialized.data}, status=status.HTTP_200_OK)
