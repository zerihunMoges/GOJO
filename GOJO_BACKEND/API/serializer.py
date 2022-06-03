from attr import fields
from .models import *
from rest_framework.serializers import ModelSerializer

class RoomSerializer(ModelSerializer):
    class Meta:
        model = Room
        fields = '__all__'

class PostSerializer(ModelSerializer):
    rooms = RoomSerializer(many= True)
    class Meta:
        model = Post
        fields = "__all__"

class UserSerializer(ModelSerializer):
    class Meta:
        model = User
        fields = ["id","username","first_name", "last_name","password", "email"]
        extra_kwargs = {
            'password': {'write_only': True}
        }
    def create(self, validated_data):
        print(validated_data)
        password = validated_data.pop("password", None)
        instance = self.Meta.model(**validated_data)
        if password is not None:
            instance.set_password(password)
            instance.save()
        return instance



class ChatSerializer(ModelSerializer):
    class Meta:
        model = Chat
        fields = '__all__'