from django.urls import path
from .views import CustomAuthToken

urlpatterns = [
    path('get-token/', CustomAuthToken.as_view(), name='get-token'),
]
