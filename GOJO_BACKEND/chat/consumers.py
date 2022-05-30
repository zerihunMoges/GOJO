import json
from channels.generic.websocket import WebsocketConsumer


class ChatConsumer(WebsocketConsumer):
    def connect(self):
        return super().connect()

    def receive(self, text_data=None, bytes_data=None):
        return super().receive(text_data, bytes_data)

    def close(self, code=None):
        return super().close(code)
