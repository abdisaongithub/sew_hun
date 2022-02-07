from django.urls import path
from .views import ChatsListView, MessagesListCreateView

urlpatterns = [
    path('', ChatsListView.as_view(), name='chats'),
    path('messages/', MessagesListCreateView.as_view(), name='messages')
]
