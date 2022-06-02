from django.urls import path
from .views import *
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView


urlpatterns = [
    path("token/", TokenObtainPairView.as_view(), name="token_obtain_pair"),
    path('token/refresh/', TokenRefreshView.as_view(), name="token_refresh"),
    path("posts", PostsView.as_view(), name="posts"),
    path("post/<str:pk>", PostView.as_view(), name="post"),
    path("chats", ChatsView.as_view(), name="chats"),
    path("chat/<str:pk>", ChatView.as_view(), name="chat"),
    path('chat/<str:chat_pk>/messages/<str:pk>',
         MessagesView.as_view(), name="messages"),
    # path('message/<str:pk>'),
]
