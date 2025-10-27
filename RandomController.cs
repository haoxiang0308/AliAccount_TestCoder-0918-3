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
            var randomValue = new { Id = new Random().Next(1, 100), Name = "Random Item" };
            return Ok(randomValue);
        }

        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            var randomValue = new { Id = id, Name = $"Random Item {id}" };
            return Ok(randomValue);
        }

        [HttpPost]
        public IActionResult Post([FromBody] object value)
        {
            return CreatedAtAction(nameof(Get), new { id = new Random().Next(1, 100) }, value);
        }

        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] object value)
        {
            return Ok(new { Id = id, Value = value, Message = "Updated successfully" });
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            return NoContent();
        }
    }
}