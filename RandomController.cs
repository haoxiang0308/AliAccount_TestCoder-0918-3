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
            var randomValue = new
            {
                Id = new Random().Next(1, 100),
                Name = "Random Item",
                CreatedAt = DateTime.UtcNow
            };
            
            return Ok(randomValue);
        }

        [HttpGet("{id}")]
        public IActionResult GetById(int id)
        {
            if (id <= 0)
            {
                return BadRequest("ID must be a positive number");
            }
            
            var randomValue = new
            {
                Id = id,
                Name = $"Random Item {id}",
                Value = new Random().NextDouble() * 100
            };
            
            return Ok(randomValue);
        }

        [HttpPost]
        public IActionResult Create([FromBody] CreateRandomRequest request)
        {
            if (request == null)
            {
                return BadRequest("Request body cannot be null");
            }
            
            var createdItem = new
            {
                Id = new Random().Next(100, 1000),
                Name = request.Name ?? "Default Name",
                Value = request.Value,
                CreatedAt = DateTime.UtcNow
            };
            
            return CreatedAtAction(nameof(GetById), new { id = createdItem.Id }, createdItem);
        }
    }
    
    public class CreateRandomRequest
    {
        public string? Name { get; set; }
        public double Value { get; set; }
    }
}