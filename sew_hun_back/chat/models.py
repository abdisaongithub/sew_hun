from django.conf import settings
from django.db import models


class Chat(models.Model):
    admin = models.ForeignKey('accounts.MyUser', on_delete=models.CASCADE, related_name='admin')
    client = models.ForeignKey('accounts.MyUser', on_delete=models.CASCADE, related_name='client')


class Message(models.Model):
    chat = models.ForeignKey(Chat, on_delete=models.CASCADE, related_name='chats')
    text = models.CharField(max_length=256, default='')
    audio = models.FileField(upload_to='messages/', null=True, blank=True)

    is_from_admin = models.BooleanField(default=False)
    timestamp = models.DateTimeField(auto_now_add=True)
    admin_read = models.BooleanField(default=False)
    client_read = models.BooleanField(default=False)

    def __str__(self):
        if len(self.text) == 0:
            return self.chat.client.email
        else:
            return self.text

    class Meta:
        ordering = ('-timestamp',)
