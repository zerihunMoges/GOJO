from urllib import response
from django.shortcuts import render
from httplib2 import Authentication
from .models import *
from .serializer import *
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.exceptions import AuthenticationFailed
from rest_framework.parsers import MultiPartParser, FileUploadParser, FormParser
from django.contrib.auth.models import User
from rest_framework import status
import jwt, datetime
# Create your views here.



class PostsView(APIView):
    parser_classes = [MultiPartParser, FormParser]

    def get(self, request):
        posts = Post.objects.all()
        serialized = PostSerializer(posts, many=True)
        return Response(serialized.data)

    def post(self, request, format=None):
        data = request.data
        serialized = PostSerializer(data=data)
        if serialized.is_valid():
            serialized.save()
            return Response(serialized.data, status=status.HTTP_201_CREATED)
        return Response(serialized.errors, status=status.HTTP_400_BAD_REQUEST)


class PostView(APIView):
    parser_classes = [MultiPartParser, FormParser]

    def get(self, request, pk):
        try:
            post = Post.objects.get(id=pk)
            serialized = PostSerializer(post)
            print(post)
            print(serialized)
            return Response(serialized.data, status=status.HTTP_200_OK)
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST)

    def put(self, request, pk):
        try:
            post = Post.objects.get(id=pk)
            serialized = PostSerializer(instance=post, data=request.data)
            if serialized.is_valid():
                serialized.save()
                return Response(serialized.data, status=status.HTTP_200_OK)
            return Response(serialized.errors, status=status.HTTP_400_BAD_REQUEST)
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST)

    def patch(self, request, pk):
        try:
            post = Post.objects.get(id=pk)
            serialized = PostSerializer(instance=post, data=request.data)
            if serialized.is_valid():
                serialized.save()
                return Response(serialized.data, status=status.HTTP_200_OK)
            return Response(serialized.errors, status=status.HTTP_400_BAD_REQUEST)
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk):
        try:
            post = Post.objects.get(id=pk)
            post.delete()
            return Response(status=status.HTTP_200_OK)
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST)

class UserView(APIView):

    def get(self, request, pk):
        try:
            user = User.objects.get(id=pk)
            serialized = UserSerializer(user)
            return Response(serialized.data)
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST)

    def put(self, request, pk):
        try:
            user = User.objects.get(id=pk)
            serialized = UserSerializer(instance=user, data=request.data)
            if serialized.is_valid():
                serialized.save()

                return Response(serialized.data)
            return Response(serialized.errors, status=status.HTTP_400_BAD_REQUEST)
        except:
            return Response( status=status.HTTP_400_BAD_REQUEST)

    def patch(self, request, pk):
        try:
            user = User.objects.get(id=pk)
            serialized = UserSerializer(instance=user, data=request.data)
            if serialized.is_valid():
                serialized.save()
                
                return Response(serialized.data)
            return Response(serialized.errors, status=status.HTTP_400_BAD_REQUEST)
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST)


class ListUsers(APIView):
    def get(self, request):
        users = User.objects.all()
        
        serialized = UserSerializer(users, many=True)
        return Response(serialized.data)

class RegisterView(APIView):
    def post(self, request):
        serialized = UserSerializer(data = request.data)
        if serialized.is_valid(raise_exception=True):
            serialized.save()
            return Response(serialized.data, status=status.HTTP_201_CREATED)

        return Response(serialized.errors, status=status.HTTP_400_BAD_REQUEST)

class LoginView(APIView):
    def post(self, request):
        username = request.data["username"]
        password = request.data["password"]
        try:
            user = User.objects.get(username = username)
            if not user.check_password(password):
                raise AuthenticationFailed("incorrect password")
            
        except KeyError:
            raise AuthenticationFailed(" user not found")

        payload= {
            "id": user.id,
            "exp" : datetime.datetime.utcnow() + datetime.timedelta(minutes=6000),
            "iat" : datetime.datetime.utcnow()
        }
       
            
        token = jwt.encode(payload, key = 'secret', algorithm='HS256').decode('utf-8')
        
        response = Response()
        response.data ={"jwt": token}
        response.set_cookie(key="jwt", value=token, httponly=True)
        

        return response
    
