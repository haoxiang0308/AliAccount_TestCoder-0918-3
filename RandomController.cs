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
        public IActionResult GetById(int id)
        {
            if (id < 0 || id >= Summaries.Length)
            {
                return NotFound();
            }

            return Ok(Summaries[id]);
        }

        [HttpPost]
        public IActionResult Post([FromBody] string value)
        {
            if (string.IsNullOrEmpty(value))
            {
                return BadRequest("Value cannot be null or empty");
            }

            // In a real application, you would add the value to a data store
            _logger.LogInformation($"New item added: {value}");
            
            return CreatedAtAction(nameof(GetById), new { id = Summaries.Length }, value);
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] string value)
        {
            if (id < 0 || id >= Summaries.Length)
            {
                return NotFound();
            }

            if (string.IsNullOrEmpty(value))
            {
                return BadRequest("Value cannot be null or empty");
            }

            // In a real application, you would update the item in a data store
            _logger.LogInformation($"Item {id} updated to: {value}");
            
            return NoContent();
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            if (id < 0 || id >= Summaries.Length)
            {
                return NotFound();
            }

            // In a real application, you would remove the item from a data store
            _logger.LogInformation($"Item {id} deleted");
            
            return NoContent();
        }
    }
}