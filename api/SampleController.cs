using Microsoft.AspNetCore.Mvc;

namespace Workspace.Api.Controllers
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
            return Ok(new { id = id, message = $"Data for ID {id}" });
        }

        // POST: api/Sample
        [HttpPost]
        public IActionResult Post([FromBody] object value)
        {
            return Ok(new { message = "Data received successfully", data = value });
        }

        // PUT: api/Sample/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] object value)
        {
            return Ok(new { message = $"Data for ID {id} updated successfully", data = value });
        }

        // DELETE: api/Sample/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            return Ok(new { message = $"Data for ID {id} deleted successfully" });
        }
    }
}