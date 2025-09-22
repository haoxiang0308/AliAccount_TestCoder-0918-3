import asyncio
import random
import string

class StateManager:
    def __init__(self):
        self.state = {"count": 0}
        self.lock = asyncio.Lock()
    
    async def increment(self):
        async with self.lock:
            self.state["count"] += 1
            return self.state["count"]
    
    async def decrement(self):
        async with self.lock:
            self.state["count"] -= 1
            return self.state["count"]
    
    async def get_count(self):
        async with self.lock:
            return self.state["count"]
    
    async def reset(self):
        async with self.lock:
            self.state["count"] = 0
            return self.state["count"]

# Global instance
state_manager = StateManager()

async def handle_request(command):
    if command == "increment":
        result = await state_manager.increment()
        return f"Count incremented to {result}"
    elif command == "decrement":
        result = await state_manager.decrement()
        return f"Count decremented to {result}"
    elif command == "get_count":
        result = await state_manager.get_count()
        return f"Current count: {result}"
    elif command == "reset":
        result = await state_manager.reset()
        return f"Count reset to {result}"
    else:
        return "Unknown command"

async def main():
    print("State Manager Server started")
    
    # Test the functionality
    print(await handle_request("increment"))
    print(await handle_request("increment"))
    print(await handle_request("get_count"))
    print(await handle_request("decrement"))
    print(await handle_request("get_count"))
    print(await handle_request("reset"))
    print(await handle_request("get_count"))

if __name__ == "__main__":
    asyncio.run(main())