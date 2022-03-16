from django.db import models


class File(models.Model):
    file = models.FileField(upload_to='app/', blank=False, )
    description = models.TextField(blank=True)
    created_at = models.DateField(auto_now_add=True)
    
    def __str__(self):
        return str(self.created_at)
