from rest_framework import generics, permissions, status
from rest_framework.response import Response

from .models import Message, Chat
from .serializers import MessagesSerializer, ChatSerializer


class MessagesListCreateView(generics.ListCreateAPIView):
    permission_classes = [permissions.IsAuthenticated, ]

    def get(self, request, *args, **kwargs):
        user = request.user
        if user.is_staff:
            messages = Message.objects.filter(chat__admin=user.id,)
        else:
            messages = Message.objects.filter(chat__client=user.id)
        # messages = Message.objects.filter(chat=chat_id, )
        # messages = Message.objects.all()
        print(messages)

        if messages is None:
            return Response(data={'error': 'None'})
        else:
            serializer = MessagesSerializer(messages, many=True)

            return Response(data={'data': serializer.data})

    def post(self, request, *args, **kwargs):
        chat_id = request.POST['chat_id']
        user = request.user
        # TODO: take all the data you need and create a message
        # if user.is_staff:
        #     messages = Message.objects.create(chat_id=chat_id,)
        # else:
        #     messages = Message.objects.filter(chat__client=user.id)

        messages = Message.objects.filter(chat=chat_id, )
        # for message in messages:
        #     message.read = True
        #     message.save()
        return Response(data={'data': chat_id}, status=status.HTTP_200_OK)
    # TODO: Check ownership before answering


class ChatsListView(generics.ListAPIView):
    permission_classes = [permissions.IsAuthenticated, ]

    def get(self, request, *args, **kwargs):
        user = request.user
        if user.is_staff:
            chats = Chat.objects.filter(admin_id=user.id)
        else:
            chats = Chat.objects.filter(client_id=user.id)

        serializer = ChatSerializer(chats, many=True, context={'request': request})

        return Response(data={'chats': serializer.data})
