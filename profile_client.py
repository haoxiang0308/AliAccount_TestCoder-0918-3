"""Клиент для тестирования ProfileService."""

import grpc
import profile_pb2
import profile_pb2_grpc


def run():
    """Тестирование сервиса ProfileService."""
    # Подключаемся к серверу
    with grpc.insecure_channel('localhost:50051') as channel:
        stub = profile_pb2_grpc.ProfileServiceStub(channel)
        
        # Создаем профиль
        profile = profile_pb2.Profile(
            user_id="user123",
            name="Иван Иванов",
            email="ivan@example.com",
            age=30,
            bio="Разработчик программного обеспечения"
        )
        
        # Сохраняем профиль
        print("Сохранение профиля...")
        response = stub.SaveProfile(profile)
        if response.success:
            print(f"Профиль успешно сохранен!")
        else:
            print(f"Ошибка: {response.error_message}")
        
        # Получаем профиль
        print("\nПолучение профиля...")
        request = profile_pb2.ProfileRequest(user_id="user123")
        response = stub.GetProfile(request)
        
        if response.success:
            p = response.profile
            print(f"Профиль найден:")
            print(f"  User ID: {p.user_id}")
            print(f"  Имя: {p.name}")
            print(f"  Email: {p.email}")
            print(f"  Возраст: {p.age}")
            print(f"  Биография: {p.bio}")
        else:
            print(f"Ошибка: {response.error_message}")
        
        # Попытка получить несуществующий профиль
        print("\nПопытка получить несуществующий профиль...")
        request = profile_pb2.ProfileRequest(user_id="nonexistent")
        response = stub.GetProfile(request)
        
        if response.success:
            print("Профиль найден")
        else:
            print(f"Ошибка: {response.error_message}")


if __name__ == '__main__':
    run()
