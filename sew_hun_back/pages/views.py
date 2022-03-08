from django.http import HttpResponse
from django.shortcuts import render
from django.views import generic, View
from requests import Response

from .models import File


def home(request):
    file = File.objects.last()
    # print(file.description)
    return render(request, 'pages/templates/home.html', {'file': file})
