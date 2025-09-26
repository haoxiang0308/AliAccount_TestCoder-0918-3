using Microsoft.AspNetCore.Mvc;

namespace MyApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RandomController : ControllerBase
    {
        // GET: api/Random
        [HttpGet]
        public IActionResult Get()
        {
            return Ok("This is a randomly generated controller.");
        }

        // GET: api/Random/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            return Ok($"This is a randomly generated controller with id {id}.");
        }

        // POST: api/Random
        [HttpPost]
        public IActionResult Post([FromBody] string value)
        {
            return Ok("Item created successfully.");
        }

        // PUT: api/Random/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] string value)
        {
            return Ok("Item updated successfully.");
        }

        // DELETE: api/Random/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            return Ok("Item deleted successfully.");
        }
    }
}