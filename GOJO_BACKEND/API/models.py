from turtle import update
from django.db import models
from django.contrib.auth.models import User
# Create your models here.


class Room(models.Model):
    type = models.CharField(max_length=200)
    photo = models.ImageField()
    count = models.IntegerField()

    def __str__(self) -> str:
        return self.type
# Create your models here.


class Chat(models.Model):
    owner1 = models.ForeignKey(
        User, on_delete=models.CASCADE, related_name="owner1")
    owner2 = models.ForeignKey(
        User, on_delete=models.CASCADE, related_name="owner2")
    last_message = models.TextField(null=False, default="No Messages Yet")
    updated = models.DateTimeField(auto_now=True)


class Text(models.Model):
    user = models.ForeignKey(
        User, on_delete=models.CASCADE, related_name="user")
    chat = models.ForeignKey(
        Chat, on_delete=models.CASCADE, related_name="chat")
    text = models.CharField(max_length=1000000)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self) -> str:
        return self.text[:10]


class Post(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    title = models.CharField(max_length=200)
    photo = models.ImageField(null=True)
    location = models.TextField(null=True, blank=True)
    price = models.FloatField()
    area = models.FloatField()
    rooms = models.ManyToManyField(Room, blank=True, null=True)
    payment_frequency = models.IntegerField()
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self) -> str:
        return self.title
