from compat import url
from django.urls import path
from .views import *
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView
from django.urls import path, include


urlpatterns = [

    path("token/", TokenObtainPairView.as_view(), name="token_obtain_pair"),
    path('token/refresh/', TokenRefreshView.as_view(), name="token_refresh"),
    path("posts", PostsView.as_view(), name="posts"),
    path("post/<str:pk>", PostView.as_view(), name="post"),
    path("user/<str:pk>", UserView.as_view(), name="user"),
    path("users", ListUsers.as_view(), name="users"),
    path("register", RegisterView.as_view(), name="register"),
    path("login", LoginView.as_view(), name="login"),
    path("rest-auth/", include('rest_auth.urls'))
    
]