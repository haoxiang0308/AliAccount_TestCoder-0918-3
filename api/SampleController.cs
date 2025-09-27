using Microsoft.AspNetCore.Mvc;

namespace api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class SampleController : ControllerBase
    {
        // GET: api/Sample
        [HttpGet]
        public IActionResult Get()
        {
            return Ok(new { message = "Hello from the Sample API controller!" });
        }

        // GET: api/Sample/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            return Ok(new { id = id, message = $"Details for item {id}" });
        }

        // POST: api/Sample
        [HttpPost]
        public IActionResult Post([FromBody] object value)
        {
            return CreatedAtAction(nameof(Get), new { id = 1 }, value);
        }

        // PUT: api/Sample/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] object value)
        {
            return Ok(value);
        }

        // DELETE: api/Sample/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            return NoContent();
        }
    }
}