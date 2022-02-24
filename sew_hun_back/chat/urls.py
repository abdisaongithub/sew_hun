from django.urls import path
from .views import ChatsListCreateView, MessagesListView, AdminsListView, MessageCreateView


urlpatterns = [
    path('', ChatsListCreateView.as_view(), name='chats'),
    path('messages/', MessageCreateView.as_view(), name='createMessage'),
    path('messages/<int:chat_id>/', MessagesListView.as_view(), name='messages'),
    path('admins/', AdminsListView.as_view(), name='messages'),
]
