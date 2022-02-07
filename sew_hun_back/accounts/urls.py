from django.urls import path
from .views import CustomAuthToken, Me, Profile

urlpatterns = [
    # path('register/', CustomAuthToken.as_view(), name='register'),
    # path('get-token/', CustomAuthToken.as_view(), name='get-token'),
    path('me/', Me.as_view(), name='user'),
    # path('profile/<int:user_id>/', Profile.as_view(), name='profile'),
]
