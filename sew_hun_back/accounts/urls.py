from django.urls import path
from .views import CustomAuthToken

urlpatterns = [
    path('register/', CustomAuthToken.as_view(), name='register'),
    path('get-token/', CustomAuthToken.as_view(), name='get-token'),
]
