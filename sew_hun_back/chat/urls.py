from django.urls import path
from .views import ChatsListCreateView, MessagesListCreateView, AdminsListView

urlpatterns = [
    path('', ChatsListCreateView.as_view(), name='chats'),
    path('messages/', MessagesListCreateView.as_view(), name='messages'),
    path('admins/', AdminsListView.as_view(), name='messages'),
]
