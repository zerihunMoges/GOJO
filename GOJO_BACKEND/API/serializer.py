from attr import fields
from .models import *
from rest_framework.serializers import ModelSerializer


class PostSerializer(ModelSerializer):
    class Meta:
        model = Post
        fields = ["user", "title", "location", "price",
                  "area", "rooms", "payment_frequency"]

class UserSerializer(ModelSerializer):
    class Meta:
        model = User
        fields = '__all__'
        
class RoomSerializer(ModelSerializer):
    class Meta:
        model = Room
        fields = '__all__'


class ChatSerializer(ModelSerializer):
    class Meta:
        model = Chat
        fields = '__all__'