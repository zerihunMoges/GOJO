from django.contrib import admin
from .models import *
# Register your models here.

admin.site.register(Post)
admin.site.register(Room)
admin.site.register(Chat)
admin.site.register(Message)
