from fastapi import FastAPI, Request
import uvicorn
import json

app = FastAPI()

@app.post('/data')
async def receive_post(request: Request):
    # Process the received data
    received_data = await request.json()
    print(f'Received POST data: {received_data}')
    
    # Return a response
    return {
        'message': 'POST request received successfully',
        'received_data': received_data,
        'status': 'success'
    }

if __name__ == '__main__':
    uvicorn.run(app, host='0.0.0.0', port=8000)
