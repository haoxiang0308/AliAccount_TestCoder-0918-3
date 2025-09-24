using Microsoft.AspNetCore.Mvc;

namespace MyApiProject.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RandomNameController : ControllerBase
    {
        // GET: api/RandomName
        [HttpGet]
        public IActionResult Get()
        {
            return Ok(new { Message = "Hello from the RandomName API!" });
        }

        // GET: api/RandomName/5
        [HttpGet("{id}")]
        public IActionResult Get(int id)
        {
            return Ok(new { Id = id, Name = "Item " + id });
        }

        // POST: api/RandomName
        [HttpPost]
        public IActionResult Post([FromBody] dynamic value)
        {
            // Process the value (in a real app, you'd have a model)
            return CreatedAtAction(nameof(Get), new { id = 1 }, value);
        }

        // PUT: api/RandomName/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] dynamic value)
        {
            // Update logic here
            return NoContent();
        }

        // DELETE: api/RandomName/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            // Delete logic here
            return NoContent();
        }
    }
}