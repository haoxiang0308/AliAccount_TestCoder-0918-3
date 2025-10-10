using Microsoft.AspNetCore.Mvc;

namespace WebApiApp.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RandomController : ControllerBase
    {
        // GET: api/Random
        [HttpGet]
        public IActionResult Get()
        {
            return Ok(new { Message = "This is a randomly generated controller." });
        }

        // GET: api/Random/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            return Ok(new { Id = id, Name = "Item " + id });
        }

        // POST: api/Random
        [HttpPost]
        public IActionResult Post([FromBody] object value)
        {
            return CreatedAtAction(nameof(Get), new { id = 1 }, value);
        }

        // PUT: api/Random/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] object value)
        {
            return NoContent();
        }

        // DELETE: api/Random/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            return NoContent();
        }
    }
}