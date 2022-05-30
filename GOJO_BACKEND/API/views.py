from django.shortcuts import render
from .models import *
from .serializer import *
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.parsers import MultiPartParser, FileUploadParser, FormParser
from django.contrib.auth.models import User
# Create your views here.


class PostsView(APIView):
    parser_classes = [MultiPartParser]

    def get(self, request):
        posts = Post.objects.all()
        serialized = PostSerializer(posts, many=True)
        return Response(serialized.data)

    def post(self, request):
        data = request.data
        img = data["photo"]
        data.pop("photo")
        serialized = PostSerializer(data=data)
        if serialized.is_valid():
            serialized.save()
            print(serialized.id, "this is the id")

        print("invalid")
        return Response(serialized.data)


class PostView(APIView):

    def get(self, request, pk):
        post = Post.objects.get(id=pk)
        serialized = PostSerializer(post)
        return Response(serialized.data)

    def put(self, request, pk):
        post = Post.objects.get(id=pk)
        serialized = PostSerializer(instance=post, data=request.data)
        if serialized.is_valid():
            serialized.save()
        return Response(serialized.data)

    def patch(self, request, pk):
        post = Post.objects.get(id=pk)
        serialized = PostSerializer(instance=post, data=request.data)
        if serialized.is_valid():
            serialized.save()
        return Response(serialized.data)

class UserView(APIView):

    def get(self, request, pk):
        user = User.objects.get(id=pk)
        serialized = UserSerializer(user)
        return Response(serialized.data)

    def put(self, request, pk):
        user = User.objects.get(id=pk)
        serialized = UserSerializer(instance=user, data=request.data)
        if serialized.is_valid():
            serialized.save()

        return Response(serialized.data)

    def patch(self, request, pk):
        user = User.objects.get(id=pk)
        serialized = UserSerializer(instance=user, data=request.data)
        if serialized.is_valid():
            serialized.save()
            
        return Response(serialized.data)

class UsersView(APIView):
    def get(self, request):
        users = User.objects.all()
        
        serialized = UserSerializer(users, many=True)
        return Response(serialized.data)
    def post(self, request):
        serialized = UserSerializer(data = request.data)
        if serialized.is_valid():
            serialized.save()

        return Response(serialized.data)
