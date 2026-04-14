"""Сервер ProfileService на gRPC."""

import grpc
from concurrent import futures
import profile_pb2
import profile_pb2_grpc


class ProfileServicer(profile_pb2_grpc.ProfileServiceServicer):
    """Реализация сервиса ProfileService."""

    def __init__(self):
        # Хранилище профилей в памяти
        self.profiles = {}

    def GetProfile(self, request, context):
        """Получить профиль пользователя по user_id."""
        user_id = request.user_id
        
        if user_id in self.profiles:
            return profile_pb2.ProfileResponse(
                profile=self.profiles[user_id],
                success=True,
                error_message=""
            )
        else:
            return profile_pb2.ProfileResponse(
                profile=profile_pb2.Profile(),
                success=False,
                error_message=f"Профиль с user_id={user_id} не найден"
            )

    def SaveProfile(self, request, context):
        """Сохранить профиль пользователя."""
        user_id = request.user_id
        
        if not user_id:
            return profile_pb2.ProfileResponse(
                profile=profile_pb2.Profile(),
                success=False,
                error_message="user_id не может быть пустым"
            )
        
        # Сохраняем профиль в хранилище
        self.profiles[user_id] = request
        
        return profile_pb2.ProfileResponse(
            profile=request,
            success=True,
            error_message=""
        )


def serve():
    """Запуск gRPC сервера."""
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
    profile_pb2_grpc.add_ProfileServiceServicer_to_server(ProfileServicer(), server)
    server.add_insecure_port('[::]:50051')
    server.start()
    print("Сервер запущен на порту 50051")
    server.wait_for_termination()


if __name__ == '__main__':
    serve()
