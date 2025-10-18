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
                Timestamp = DateTime.UtcNow
            };
            
            return Ok(randomData);
        }

        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            if (id <= 0)
            {
                return BadRequest("Invalid ID");
            }

            var randomData = new
            {
                Id = id,
                Name = $"Random Item {id}",
                Value = new Random().NextDouble() * 100
            };

            return Ok(randomData);
        }

        [HttpPost]
        public IActionResult Post([FromBody] object data)
        {
            _logger.LogInformation("Received POST request with data");
            
            return CreatedAtAction(nameof(Get), new { id = new Random().Next(1, 100) }, data);
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] object data)
        {
            if (id <= 0)
            {
                return BadRequest("Invalid ID");
            }

            _logger.LogInformation($"Received PUT request for ID {id}");
            
            return NoContent();
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            if (id <= 0)
            {
                return BadRequest("Invalid ID");
            }

            _logger.LogInformation($"Received DELETE request for ID {id}");
            
            return NoContent();
        }
    }
}