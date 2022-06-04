from django.urls import path, include
from .views import *
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView

urlpatterns = [
    path("token/", MyTokenObtainPairView.as_view(), name="token_obtain_pair"),
    path('token/refresh/', TokenRefreshView.as_view(), name="token_refresh"),
    path("register", RegisterView.as_view(), name="register"),
    path("login", LoginView.as_view(), name="login"),
    # path('rest-auth/', include('rest_auth.urls')),
    path("posts", PostsView.as_view(), name="posts"),
    path("posts/<str:pk>", PostView.as_view(), name="post"),
    path("chats", ChatsView.as_view(), name="chats"),
    path("chat/<str:pk>", ChatView.as_view(), name="chat"),
    path('chat/<str:chat_pk>/messages',
         MessagesView.as_view(), name="messages"),
    # path("messages", MessagesPostView.as_view(), name="post"),
    # path('message/<str:pk>'),
]
