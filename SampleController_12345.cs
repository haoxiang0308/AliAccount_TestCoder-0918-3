using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class SampleController : ControllerBase
    {
        // GET: api/Sample
        [HttpGet]
        public IActionResult Get()
        {
            return Ok(new { Message = "Hello from Sample Controller!" });
        }

        // GET: api/Sample/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            return Ok(new { Id = id, Name = "Sample Item" });
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
            return NoContent();
        }

        // DELETE: api/Sample/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            return NoContent();
        }
    }
}