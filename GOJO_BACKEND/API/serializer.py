from curses.textpad import Textbox
from .models import *
from rest_framework.serializers import ModelSerializer
from django.contrib.auth.models import User


class UserSerializer(ModelSerializer):
    class Meta:
        model = User
        fields = ["id", "username", "first_name",
                  "last_name", "password", "email"]
        extra_kwargs = {
            'password': {'write_only': True},
        }

    def create(self, validated_data):
        print(validated_data)
        password = validated_data.pop("password", None)
        instance = self.Meta.model(**validated_data)
        if password is not None:
            instance.set_password(password)
            instance.save()
        return instance


class OtherUserSerializer(ModelSerializer):
    class Meta:
        model = User
        fields = ["username", "first_name", "last_name", "email"]


# class RoomSerializer(ModelSerializer):
#     class Meta:
#         model = Room
#         fields = '__all__'


class PostSerializer(ModelSerializer):
    

    class Meta:
        model = Post
        fields = "__all__"


class ChatSerializer(ModelSerializer):
    owner1 = UserSerializer()
    owner2 = UserSerializer()

    class Meta:
        model = Chat
        fields = '__all__'


class MessageSerializer(ModelSerializer):
    class Meta:
        model = Text
        fields = '__all__'


class TextSerializer(ModelSerializer):
    class Meta:
        model = Text
        fields = "__all__"
