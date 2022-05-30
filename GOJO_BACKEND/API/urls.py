from django.urls import path
from .views import *
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView


urlpatterns = [
    path("token/", TokenObtainPairView.as_view(), name="token_obtain_pair"),
    path('token/refresh/', TokenRefreshView.as_view(), name="token_refresh"),
    path("posts", PostsView.as_view(), name="posts"),
    path("post/<str:pk>", PostView.as_view(), name="post"),
    path("user/<str:pk>", UserView.as_view(), name="user"),
    path("users", UsersView.as_view(), name="users"),
]