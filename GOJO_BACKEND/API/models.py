from email.policy import default
from tkinter import CASCADE
from turtle import update
from django.db import models
from django.contrib.auth.models import User
# Create your models here.


# class Room(models.Model):
#     type = models.CharField(max_length=200)
#     photos = models.JSONField(default=[])
#     count = models.IntegerField()

#     def __str__(self) -> str:
#         return self.type
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
        User, on_delete=models.CASCADE)
    chat = models.ForeignKey(
        Chat, on_delete=models.CASCADE)
    text = models.TextField()
    updated = models.DateTimeField(auto_now=True)

    def __str__(self) -> str:
        return self.text[:10]


class Post(models.Model):
    
    title = models.CharField(max_length=200)

    user = models.ForeignKey(User,on_delete= models.CASCADE)
    type = models.CharField(max_length=200)
    photo = models.JSONField(default=[])
    location = models.TextField(null=True, blank=True)
    price = models.FloatField()
    area = models.FloatField()
    rooms = models.JSONField(default=[[]])
    payment_frequency = models.IntegerField()
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    def __str__(self) -> str:
        return self.title
