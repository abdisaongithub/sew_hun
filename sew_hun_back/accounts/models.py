from django.contrib.auth import get_user_model
from django.contrib.auth.models import User, AbstractUser
from django.db import models
from django.dispatch import receiver


class MyUser(AbstractUser):
    email = models.EmailField(unique=True, )

    USERNAME_FIELD = 'email'

    REQUIRED_FIELDS = ['username']

    def save(self, *args, **kwargs):
        self.username = self.email
        super(MyUser, self).save(*args, **kwargs)


@receiver(models.signals.post_save, sender=MyUser)
def create_profile(sender, instance, created, **kwargs):
    if created and instance is not None:
        role = Role.objects.filter(role__exact='customer')
        Profile.objects.create(user_id=instance.id, role=role.id)


class Settings(models.Model):
    """
    Settings for user experience and user control
    """
    user = models.ForeignKey(MyUser, on_delete=models.CASCADE, related_name='setting')
    is_subscribed = models.BooleanField(default=False)
    dark_mode = models.BooleanField(default=False)

    is_active = models.BooleanField(default=True, )  # for payment purposes only

    def __str__(self):
        return self.user.username


class Role(models.Model):
    role = models.CharField(max_length=50)

    def __str__(self):
        return self.role


class Profile(models.Model):
    """
    Different information on the user for analytics purposes
    """
    user = models.OneToOneField(MyUser, on_delete=models.CASCADE, related_name='profile')
    phone = models.CharField(max_length=15, blank=False, default='0900000000')
    city = models.CharField(max_length=50, blank=True)
    sub_city = models.CharField(max_length=50, blank=True)
    special_name = models.CharField(max_length=50, blank=True)
    bio = models.TextField(blank=True)
    photo = models.ImageField(upload_to='photos/profiles/', blank=True)

    role = models.ManyToManyField(Role, related_name='profiles', )

    def __str__(self):
        if len(self.user.first_name + self.user.last_name) == 0:
            return self.user.username
        return self.user.first_name + self.user.last_name


class Favorite(models.Model):
    """
    Favourite Posts for the current user
    """
    user = models.ForeignKey(MyUser, on_delete=models.CASCADE, related_name='favorites')
    post = models.ForeignKey('blog.Post', on_delete=models.CASCADE, related_name='favorites')
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.user.email
