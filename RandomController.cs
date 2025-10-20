using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RandomController : ControllerBase
    {
        private readonly ILogger<RandomController> _logger;

        public RandomController(ILogger<RandomController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public IActionResult Get()
        {
            var randomData = new
            {
                Id = new Random().Next(1, 100),
                Name = "Random Item",
                CreatedAt = DateTime.UtcNow
            };
            return Ok(randomData);
        }

        [HttpGet("{id}")]
        public IActionResult GetById(int id)
        {
            if (id <= 0)
            {
                return BadRequest("Invalid ID");
            }

            var randomItem = new
            {
                Id = id,
                Name = $"Random Item {id}",
                Value = new Random().NextDouble()
            };
            return Ok(randomItem);
        }

        [HttpPost]
        public IActionResult Post([FromBody] object data)
        {
            if (data == null)
            {
                return BadRequest("Data cannot be null");
            }

            var response = new
            {
                Success = true,
                Message = "Data received successfully",
                Timestamp = DateTime.UtcNow
            };
            return Ok(response);
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] object data)
        {
            if (id <= 0)
            {
                return BadRequest("Invalid ID");
            }

            var response = new
            {
                Success = true,
                Message = $"Item {id} updated successfully",
                Id = id
            };
            return Ok(response);
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            if (id <= 0)
            {
                return BadRequest("Invalid ID");
            }

            var response = new
            {
                Success = true,
                Message = $"Item {id} deleted successfully"
            };
            return Ok(response);
        }
    }
}