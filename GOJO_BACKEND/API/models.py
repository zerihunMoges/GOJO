from django.db import models
from django.contrib.auth.models import User
# Create your models here.


class Room(models.Model):
    type = models.CharField(max_length=200)
    photo = models.ImageField()
    count = models.IntegerField()

    def __str__(self) -> str:
        return self.type


class Post(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    title = models.CharField(max_length=200)
    photo = models.ImageField(null=True)
    location = models.TextField(null=True, blank=True)
    price = models.FloatField()
    area = models.FloatField()
    rooms = models.ManyToManyField(Room)
    payment_frequency = models.IntegerField()
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self) -> str:
        return self.title


class Chat(models.Model):
    owner = models.ForeignKey(
        User, on_delete=models.CASCADE, related_name="owner")
    contacts = models.ManyToManyField(User)