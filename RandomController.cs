using Microsoft.AspNetCore.Mvc;

namespace WebAPI.Controllers
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
            var random = new Random();
            var result = new
            {
                Id = random.Next(1, 1000),
                Value = random.NextDouble(),
                Timestamp = DateTime.UtcNow
            };
            return Ok(result);
        }

        [HttpGet("{id}")]
        public IActionResult GetById(int id)
        {
            if (id <= 0)
                return BadRequest("ID must be a positive integer");

            var result = new
            {
                Id = id,
                Name = $"Random Item {id}",
                Value = new Random().NextDouble()
            };
            return Ok(result);
        }

        [HttpPost]
        public IActionResult Post([FromBody] RandomRequest request)
        {
            if (request == null)
                return BadRequest("Request body cannot be null");

            var result = new RandomResponse
            {
                Id = new Random().Next(1, 1000),
                Message = $"Created random item with seed: {request.Seed}",
                Timestamp = DateTime.UtcNow
            };

            return CreatedAtAction(nameof(GetById), new { id = result.Id }, result);
        }
    }

    public class RandomRequest
    {
        public int Seed { get; set; }
        public string? Name { get; set; }
    }

    public class RandomResponse
    {
        public int Id { get; set; }
        public string? Message { get; set; }
        public DateTime Timestamp { get; set; }
    }
}