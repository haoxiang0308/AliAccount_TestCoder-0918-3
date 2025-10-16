using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RandomController : ControllerBase
    {
        private static readonly string[] Summaries = new[]
        {
            "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
        };

        private readonly ILogger<RandomController> _logger;

        public RandomController(ILogger<RandomController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public IEnumerable<string> Get()
        {
            return Summaries;
        }

        [HttpGet("{id}")]
        public string Get(int id)
        {
            if (id >= 0 && id < Summaries.Length)
            {
                return Summaries[id];
            }
            return "Index out of range";
        }

        [HttpPost]
        public IActionResult Post([FromBody] string value)
        {
            _logger.LogInformation($"Received POST request with value: {value}");
            return Ok(new { message = "Value received successfully", value });
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] string value)
        {
            _logger.LogInformation($"Received PUT request for id: {id} with value: {value}");
            return Ok(new { message = $"Updated item {id} with value: {value}" });
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            _logger.LogInformation($"Received DELETE request for id: {id}");
            return Ok(new { message = $"Deleted item with id: {id}" });
        }
    }
}