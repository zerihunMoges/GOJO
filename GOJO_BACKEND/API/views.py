
from django.shortcuts import render
from .models import *
from .serializer import *
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.parsers import MultiPartParser, FileUploadParser, FormParser, JSONParser
from rest_framework import status
from django.db.models import Q
from rest_framework.permissions import IsAuthenticated
# Create your views here.


class PostsView(APIView):
    # permission_classes = [IsAuthenticated]
    parser_classes = [MultiPartParser, FormParser]

    def get(self, request):
        posts = Post.objects.all()
        serialized = PostSerializer(posts, many=True)
        return Response(serialized.data, status=status.HTTP_200_OK)

    def post(self, request, format=None):
        data = request.data
        serialized = PostSerializer(data=data)
        if serialized.is_valid():
            serialized.save()
            return Response(serialized.data, status=status.HTTP_201_CREATED)
        return Response(serialized.errors, status=status.HTTP_400_BAD_REQUEST)


class PostView(APIView):
    # permission_classes = [IsAuthenticated]
    parser_classes = [MultiPartParser, FormParser]

    def get(self, request, pk):
        try:
            post = Post.objects.get(id=pk)
            serialized = PostSerializer(post)
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


class ChatsView(APIView):
    # permission_classes = [IsAuthenticated]

    def get(self, request):
        try:
            user = User.objects.get(id=request.user.id)
            chats = Chat.objects.filter(Q(owner1=user) | Q(owner2=user))
            serialized = ChatSerializer(chats, many=True)
            return Response(serialized.data, status=status.HTTP_200_OK)
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST)

    def post(self, request, format=None):
        data = request.data
        serialized = ChatSerializer(data=data)
        if serialized.is_valid():
            serialized.save()
            return Response(serialized.data, status=status.HTTP_201_CREATED)
        return Response(serialized.errors, status=status.HTTP_400_BAD_REQUEST)


class ChatView(APIView):
    # permission_classes = [IsAuthenticated]

    def get(self, request, pk):
        try:
            chat = Chat.objects.get(id=pk)
            serialized = ChatSerializer(chat)
            return Response(serialized.data, status=status.HTTP_200_OK)
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST)

    def delete(self, request, pk):
        try:
            chat = Chat.objects.get(id=pk)
            chat.delete()
            return Response(status=status.HTTP_200_OK)
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST)


class MessagesView(APIView):
    # permission_classes = [IsAuthenticated]

    def get(self, request, pk):
        try:
            chat = Chat.objects.get(id=pk)
            if chat.owner1.id != request.user.id and chat.owner2.id != request.user.id:
                return Response(status=status.HTTP_400_BAD_REQUEST)
            messages = Message.objects.filter(chat=chat)
            serialized = MessageSerializer(messages, many=True)
            return Response(serialized.data, status=status.HTTP_200_OK)
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST)

    def post(self, request, pk):
        data = request.data
        try:
            chat = Chat.objects.get(id=pk)
            if chat.owner1.id != request.user.id and chat.owner2.id != request.user.id:
                return Response(status=status.HTTP_400_BAD_REQUEST)
            serialized = MessageSerializer(data=data)
            if serialized.is_valid():
                serialized.save()
                chat.last_message = serialized.text
                chat.save()
                return Response(serialized.data, status=status.HTTP_201_CREATED)
        except:
            return Response(status=status.HTTP_400_BAD_REQUEST)


# class MessageView(APIView):
#     permission_classes = [IsAuthenticated]

#     def get(self, request, chat_pk, pk):
#         try:

#             message = Message.objects.get(id=pk)
#             serialized = MessageSerializer(message)
#             return Response(serialized.data, status=status.HTTP_200_OK)
#         except:
#             return Response(status=status.HTTP_400_BAD_REQUEST)

#     def put(self, request, pk):
#         try:
#             message = Message.objects.get(id=pk)
#             serialized = MessageSerializer(instance=message, data=request.data)
#             if serialized.is_valid():
#                 serialized.save()
#                 return Response(serialized.data, status=status.HTTP_200_OK)
#             return Response(serialized.errors, status=status.HTTP_400_BAD_REQUEST)
#         except:
#             return Response(status=status.HTTP_400_BAD_REQUEST)

#     def patch(self, request, pk):
#         try:
#             message = Message.objects.get(id=pk)
#             serialized = MessageSerializer(instance=message, data=request.data)
#             if serialized.is_valid():
#                 serialized.save()
#                 return Response(serialized.data, status=status.HTTP_200_OK)
#             return Response(serialized.errors, status=status.HTTP_400_BAD_REQUEST)
#         except:
#             return Response(status=status.HTTP_400_BAD_REQUEST)

#     def delete(self, request, pk):
#         try:
#             message = Message.objects.get(id=pk)
#             message.delete()
#             return Response(status=status.HTTP_200_OK)
#         except:
#             return Response(status=status.HTTP_400_BAD_REQUEST)
